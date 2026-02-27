-- ============================================================================
-- ViksUI Tag Validator
-- ============================================================================
-- This script tests all custom tags defined in Tags.lua and reports:
-- - Tags that fail to execute
-- - Tags that throw errors
-- - Potentially deprecated API functions
-- - Results for different unit types
--
-- Usage: Run this after ViksUI is loaded, or call ValidateAllTags()
-- ============================================================================

local T, C, L = unpack(ViksUI)
local _, ns = ...
local oUF = ns.oUF
-- ============================================================================
-- Configuration
-- ============================================================================

local VALIDATOR_CONFIG = {
    verbose = true,           -- Print detailed output for each tag
    reportToFile = true,      -- Save results to a file
    testUnits = { "player", "target", "party1", "boss1" },
    maxOutputLength = 200,    -- Truncate long outputs
}

-- ============================================================================
-- Report Storage
-- ============================================================================

local ValidationReport = {
    totalTags = 0,
    passedTags = 0,
    failedTags = {},
    errorTags = {},
    deprecatedFunctions = {},
    warnings = {},
}

-- ============================================================================
-- Helper Functions
-- ============================================================================

local function Log(level, message)
    local prefix = {
        INFO = "|cff00ff00[INFO]|r",
        WARN = "|cffffff00[WARN]|r",
        ERROR = "|cffff0000[ERROR]|r",
        DEBUG = "|cff0080ff[DEBUG]|r",
    }
    
    if level == "DEBUG" and not VALIDATOR_CONFIG.verbose then
        return
    end
    
    print((prefix[level] or "[LOG]") .. " " .. message)
end

local function TruncateOutput(str, maxLen)
    if not str then return "nil" end
    str = tostring(str)
    if #str > maxLen then
        return str:sub(1, maxLen) .. "..."
    end
    return str
end

local function TableToString(tbl)
    if not tbl then return "{}" end
    local result = "{"
    for k, v in pairs(tbl) do
        result = result .. tostring(k) .. "=" .. tostring(v) .. ", "
    end
    return result .. "}"
end

local function CheckForDeprecatedFunctions(tagMethod)
    -- Convert function to string to analyze it
    local funcStr = tostring(tagMethod)
    local deprecatedAPIs = {
        "CurveConstants.ScaleTo100",
        "GetQuestDifficultyColor",
        "UnitSelectionColor",
        "ALTERNATE_POWER_INDEX",
    }
    
    local found = {}
    for _, api in ipairs(deprecatedAPIs) do
        if funcStr:find(api, 1, true) then
            table.insert(found, api)
        end
    end
    
    return found
end

local function SafeExecuteTag(tagName, tagMethod, unit)
    if not tagMethod then
        return false, "Tag method not found"
    end
    
    if type(tagMethod) ~= "function" then
        return false, "Tag method is not a function"
    end
    
    local success, result = pcall(function()
        return tagMethod(unit)
    end)
    
    if not success then
        return false, result -- result is the error message
    end
    
    return true, result
end

local function ValidateTag(tagName, tagMethod)
    local testResults = {}
    local hasError = false
    local errorMessages = {}
    
    Log("DEBUG", "Testing tag: " .. tagName)
    
    -- Test with different units
    for _, unit in ipairs(VALIDATOR_CONFIG.testUnits) do
        local success, result = SafeExecuteTag(tagName, tagMethod, unit)
        
        testResults[unit] = {
            success = success,
            result = result,
        }
        
        if not success then
            hasError = true
            table.insert(errorMessages, unit .. ": " .. tostring(result))
        end
    end
    
    -- Check for potentially deprecated functions
    local deprecatedFound = CheckForDeprecatedFunctions(tagMethod)
    
    local tagReport = {
        name = tagName,
        success = not hasError,
        testResults = testResults,
        deprecatedFunctions = deprecatedFound,
        errorMessages = errorMessages,
    }
    
    return tagReport
end

local function PrintReport(report)
    print("\n" .. string.rep("=", 80))
    print("|cff00ff00ViksUI Tag Validation Report|r")
    print(string.rep("=", 80))
    
    print("|cff00ff00Total Tags:|r " .. report.totalTags)
    print("|cff00ff00Passed:|r " .. report.passedTags)
    print("|cffff0000Failed:|r " .. #report.failedTags)
    print("|cffffff00Errors:|r " .. #report.errorTags)
    
    if #report.deprecatedFunctions > 0 then
        print("\n|cffffff00Potentially Deprecated Functions Found:|r")
        for func, count in pairs(report.deprecatedFunctions) do
            print("  - |cffffff00" .. func .. "|r (found in " .. count .. " tag(s))")
        end
    end
    
    if #report.failedTags > 0 then
        print("\n|cffff0000Failed Tags:|r")
        for _, failedTag in ipairs(report.failedTags) do
            print("  |cffff0000✗|r " .. failedTag.name)
            for unit, result in pairs(failedTag.testResults) do
                if not result.success then
                    print("    └─ |cffff0000" .. unit .. ":|r " .. TruncateOutput(result.result, 100))
                end
            end
            if #failedTag.deprecatedFunctions > 0 then
                print("    └─ |cffffff00Deprecated:|r " .. table.concat(failedTag.deprecatedFunctions, ", "))
            end
        end
    end
    
    if #report.warnings > 0 then
        print("\n|cffffff00Warnings:|r")
        for _, warning in ipairs(report.warnings) do
            print("  ⚠ " .. warning)
        end
    end
    
    print("\n" .. string.rep("=", 80) .. "\n")
end

local function SaveReportToFile(report)
    -- This would require an addon that can write files
    -- For now, we'll just prepare the data
    local reportText = "ViksUI Tag Validation Report\n"
    reportText = reportText .. "Generated: " .. date("%Y-%m-%d %H:%M:%S") .. "\n"
    reportText = reportText .. string.rep("=", 80) .. "\n\n"
    
    reportText = reportText .. "Summary:\n"
    reportText = reportText .. "Total Tags: " .. report.totalTags .. "\n"
    reportText = reportText .. "Passed: " .. report.passedTags .. "\n"
    reportText = reportText .. "Failed: " .. #report.failedTags .. "\n"
    reportText = reportText .. "Errors: " .. #report.errorTags .. "\n\n"
    
    if #report.failedTags > 0 then
        reportText = reportText .. "Failed Tags:\n"
        for _, failedTag in ipairs(report.failedTags) do
            reportText = reportText .. "\n" .. failedTag.name .. ":\n"
            for unit, result in pairs(failedTag.testResults) do
                if not result.success then
                    reportText = reportText .. "  " .. unit .. ": " .. tostring(result.result) .. "\n"
                end
            end
        end
    end
    
    Log("INFO", "Report data prepared (save to file requires file I/O addon)")
    return reportText
end

-- ============================================================================
-- Main Validation Function
-- ============================================================================

local function ValidateAllTags()
    Log("INFO", "Starting ViksUI Tag Validation...")
    
    local oUF = T.oUF or _G.oUF
    
    if not oUF or not oUF.Tags or not oUF.Tags.Methods then
        Log("ERROR", "oUF or oUF.Tags.Methods not found. Make sure ViksUI is loaded!")
        return nil
    end
    
    ValidationReport = {
        totalTags = 0,
        passedTags = 0,
        failedTags = {},
        errorTags = {},
        deprecatedFunctions = {},
        warnings = {},
    }
    
    -- Collect all tag names
    local tagNames = {}
    for tagName, _ in pairs(oUF.Tags.Methods) do
        table.insert(tagNames, tagName)
    end
    table.sort(tagNames)
    
    ValidationReport.totalTags = #tagNames
    Log("INFO", "Found " .. #tagNames .. " tags to validate")
    
    -- Test each tag
    for _, tagName in ipairs(tagNames) do
        local tagMethod = oUF.Tags.Methods[tagName]
        local report = ValidateTag(tagName, tagMethod)
        
        if report.success then
            ValidationReport.passedTags = ValidationReport.passedTags + 1
            Log("DEBUG", "✓ " .. tagName)
        else
            table.insert(ValidationReport.failedTags, report)
            Log("DEBUG", "✗ " .. tagName)
        end
        
        -- Track deprecated functions
        for _, func in ipairs(report.deprecatedFunctions) do
            ValidationReport.deprecatedFunctions[func] = (ValidationReport.deprecatedFunctions[func] or 0) + 1
        end
    end
    
    Log("INFO", "Validation complete!")
    
    return ValidationReport
end

-- ============================================================================
-- Public API
-- ============================================================================

_G.ViksUITagValidator = {
    Validate = ValidateAllTags,
    PrintReport = PrintReport,
    GetReport = function() return ValidationReport end,
    Config = VALIDATOR_CONFIG,
}

-- ============================================================================
-- Auto-run on addon load (optional)
-- ============================================================================

-- local validatorFrame = CreateFrame("Frame")
-- validatorFrame:RegisterEvent("PLAYER_LOGIN")
-- validatorFrame:SetScript("OnEvent", function(self, event)
    -- if event == "PLAYER_LOGIN" then
        -- Wait a moment for all addons to fully load
        -- C_Timer.After(2, function()
            -- local report = ValidateAllTags()
            -- if report then
                -- PrintReport(report)
            -- end
        -- end)
        -- self:UnregisterEvent("PLAYER_LOGIN")
    -- end
-- end)

-- ============================================================================
-- Slash Command for Manual Testing
-- ============================================================================

SLASH_VIKSUITAGVALIDATOR1 = "/tagvalidate"
SLASH_VIKSUITAGVALIDATOR2 = "/vtags"

SlashCmdList["VIKSUITAGVALIDATOR"] = function(msg)
    local command = msg:lower()
    
    if command == "verbose" then
        VALIDATOR_CONFIG.verbose = not VALIDATOR_CONFIG.verbose
        Log("INFO", "Verbose mode: " .. (VALIDATOR_CONFIG.verbose and "ON" or "OFF"))
    elseif command == "run" then
        local report = ValidateAllTags()
        if report then
            PrintReport(report)
        end
    elseif command == "report" then
        PrintReport(ValidationReport)
    elseif command == "export" then
        local reportText = SaveReportToFile(ValidationReport)
        print(reportText)
    else
        print("|cff00ff00ViksUI Tag Validator Commands:|r")
        print("  /tagvalidate run     - Run validation")
        print("  /tagvalidate report  - Print last report")
        print("  /tagvalidate verbose - Toggle verbose mode")
        print("  /tagvalidate export  - Export report")
    end
end

-- Log("INFO", "ViksUI Tag Validator loaded. Use /tagvalidate for commands")