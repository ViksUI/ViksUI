local T, C, L, _ = unpack(select(2, ...))
if T.client ~= "ruRU" then return end
------------------------------------------------
L.DataText = {} -- Data Text Locales  -- Needs review
------------------------------------------------

L.DataText.LootSpec = "Loot Specialization"
L.DataText.Garrison = "Garrison"
L.DataText.Zone = "Zone"
L.DataText.AvoidanceBreakdown = "Avoidance Breakdown"
L.DataText.Level = "Lvl"
L.DataText.Boss = "Boss"
L.DataText.Miss = "Miss"
L.DataText.Dodge = "Dodge"
L.DataText.Block = "Block"
L.DataText.Parry = "Parry"
L.DataText.Avoidance = "Avoidance"
L.DataText.AvoidanceShort = "Avd: "
L.DataText.Memory = "Memory"
L.DataText.Hit = "Hit"
L.DataText.Power = "Power"
L.DataText.Mastery = "Mastery"
L.DataText.Crit = "Crit"
L.DataText.Regen = "Regen"
L.DataText.Versatility = "Versatility"
L.DataText.Leech = "Leech"
L.DataText.Multistrike = "Multistrike"
L.DataText.Session = "Session: "
L.DataText.Earned = "Earned:"
L.DataText.Spent = "Spent:"
L.DataText.Deficit = "Deficit:"
L.DataText.Profit = "Profit:"
L.DataText.Character = "Character: "
L.DataText.Server = "Server: "
L.DataText.Gold = "Gold"
L.DataText.TotalGold = "Total: "
L.DataText.GoldShort = "|cffffd700g|r"
L.DataText.SilverShort = "|cffc7c7cfs|r"
L.DataText.CopperShort = "|cffeda55fc|r"
L.DataText.Talents = "Talents"
L.DataText.NoTalent = "No Talents"
L.DataText.Download = "Download: "
L.DataText.Bandwidth = "Bandwidth: "
L.DataText.Guild = "Guild"
L.DataText.NoGuild = "No Guild"
L.DataText.Bags = "Bags"
L.DataText.BagSlots = "Bags Slots"
L.DataText.Friends = "Friends"
L.DataText.Online = "Online: "
L.DataText.Armor = "Armor"
L.DataText.Durability = "Durability"
L.DataText.TimeTo = "Time to"
L.DataText.FriendsList = "Friends list:"
L.DataText.Spell = "SP"
L.DataText.AttackPower = "AP"
L.DataText.Haste = "Haste"
L.DataText.DPS = "DPS"
L.DataText.HPS = "HPS"
L.DataText.Session = "Session: "
L.DataText.Character = "Character: "
L.DataText.Server = "Server: "
L.DataText.Total = "Total: "
L.DataText.SavedRaid = "Saved Raid(s)"
L.DataText.Currency = "Currency"
L.DataText.FPS = "FPS &"
L.DataText.MS = "MS"
L.DataText.FPSAndMS = "FPS & MS"
L.DataText.Critical = " Crit"
L.DataText.Heal = " Heal"
L.DataText.Time = "Time"
L.DataText.ServerTime = "Server Time: "
L.DataText.LocalTime = "Local Time: "
L.DataText.Mitigation = "Mitigation By Level: "
L.DataText.Healing = "Healing: "
L.DataText.Damage = "Damage: "
L.DataText.Honor = "Honor: "
L.DataText.KillingBlow = "Killing Blows: "
L.DataText.StatsFor = "Stats for "
L.DataText.HonorableKill = "Honorable Kills:"
L.DataText.Death = "Deaths:"
L.DataText.HonorGained = "Honor Gained:"
L.DataText.DamageDone = "Damage Done:"
L.DataText.HealingDone = "Healing Done:"
L.DataText.BaseAssault = "Bases Assaulted:"
L.DataText.BaseDefend = "Bases Defended:"
L.DataText.TowerAssault = "Towers Assaulted:"
L.DataText.TowerDefend = "Towers Defended:"
L.DataText.FlagCapture = "Flags Captured:"
L.DataText.FlagReturn = "Flags Returned:"
L.DataText.GraveyardAssault = "Graveyards Assaulted:"
L.DataText.GraveyardDefend = "Graveyards Defended:"
L.DataText.DemolisherDestroy = "Demolishers Destroyed:"
L.DataText.GateDestroy = "Gates Destroyed:"
L.DataText.TotalMemory = "Total Memory Usage:"
L.DataText.ControlBy = "Controlled by:"
L.DataText.CallToArms = "Call to Arms"
L.DataText.ArmError = "Could not get Call To Arms information."
L.DataText.NoDungeonArm = "No dungeons are currently offering a Call To Arms."
L.DataText.CartControl = "Carts Controlled:"
L.DataText.VictoryPts = "Victory Points:"
L.DataText.OrbPossession = "Orb Possessions:"
L.DataText.Slots = {
	[1] = {1, "Head", 1000},
	[2] = {3, "Shoulder", 1000},
	[3] = {5, "Chest", 1000},
	[4] = {6, "Waist", 1000},
	[5] = {9, "Wrist", 1000},
	[6] = {10, "Hands", 1000},
	[7] = {7, "Legs", 1000},
	[8] = {8, "Feet", 1000},
	[9] = {16, "Main Hand", 1000},
	[10] = {17, "Off Hand", 1000},
	[11] = {18, "Ranged", 1000}
}

----------------------------------------------------------------------------------------
--	Localization for ruRU client
--	Translation: Shestak, Wetxius
----------------------------------------------------------------------------------------
-- Announce flasks and food
L_ANNOUNCE_FF_NOFOOD = "Нет еды: "
L_ANNOUNCE_FF_NOFLASK = "Нет настоя: "
L_ANNOUNCE_FF_ALLBUFFED = "Еда и настой есть у всех. Можно щемить!"
L_ANNOUNCE_FF_CHECK_BUTTON = "Проверка еды и настоя"

-- Says thanks for some spells
L_ANNOUNCE_SS_THANKS = "Спасибо за "
L_ANNOUNCE_SS_RECEIVED = " получено от "

-- Pull countdown announce
L_ANNOUNCE_PC_GO = "ВЫСТУПАЕМ!"
L_ANNOUNCE_PC_MSG = "Атакуем %s через %s.."
L_ANNOUNCE_PC_ABORTED = "Атака ОТМЕНЕНА!"

-- Announce feasts and portals
L_ANNOUNCE_FP_STAT = "%s готовит %s - [%s]."
L_ANNOUNCE_FP_PRE = "%s готовит %s."
L_ANNOUNCE_FP_PUT = "%s ставит %s."
L_ANNOUNCE_FP_CAST = "%s создает %s."
L_ANNOUNCE_FP_CLICK = "%s создает %s. Кликаем!"
L_ANNOUNCE_FP_USE = "%s использует %s."

-- Announce your interrupts
L_ANNOUNCE_INTERRUPTED = INTERRUPTED

-- Tooltip
L_TOOLTIP_NO_TALENT = "Нет талантов"
L_TOOLTIP_LOADING = "Загрузка..."
L_TOOLTIP_ACH_STATUS = "Ваш статус:"
L_TOOLTIP_ACH_COMPLETE = "Ваш статус: Получено "
L_TOOLTIP_ACH_INCOMPLETE = "Ваш статус: Не завершено"
L_TOOLTIP_SPELL_ID = "Номер заклинания:"
L_TOOLTIP_ITEM_ID = "Номер предмета:"
L_TOOLTIP_WHO_TARGET = "Выбран целью"
L_TOOLTIP_ITEM_COUNT = "Количество предметов:"
L_TOOLTIP_INSPECT_OPEN = "Открыто окно осмотра"

-- Misc
L_MISC_UNDRESS = "Раздеть"
L_MISC_DRINKING = " пьёт."
L_MISC_BUY_STACK = "Зажмите Alt и щелкните мышью, чтобы купить связку"
L_MISC_ONECLICK_BUYOUT = "Зажмите Shift и щелкните правой кнопкой мыши, чтобы выкупить выбранный предмет без подтверждения"
L_MISC_ONECLICK_BID = "Зажмите Shift и щелкните правой кнопкой мыши, чтобы сделать ставку на выбранном предмете без подтверждения"
L_MISC_ONECLICK_CANCEL = "Зажмите Shift и щелкните правой кнопкой мыши, чтобы отменить аукцион выбранного предмета без подтверждения"
L_MISC_UI_OUTDATED = "Ваша версия ViksUI устарела. Вы можете скачать последнюю версию с http://goo.gl/QAj0J6"
L_MISC_HEADER_MARK = "Метки по наведению курсора"
L_MISC_BINDER_OPEN = "Назначения мыши"
L_MISC_GROCERY_BUY = "Купить"
L_MISC_GROCERY_DESC = "Автоматически купить пустые контейнеры"
L_MISC_SCROLL = "Свиток"
L_MISC_COLLAPSE = "Обрушение"

-- Raid Utility
L_RAID_UTIL_DISBAND = "Распустить группу"

-- Zone name
L_ZONE_TOLBARAD = "Тол Барад"
L_ZONE_TOLBARADPEN = "Полуостров Тол Барад"
L_ZONE_ARATHIBASIN = "Низина Арати"
L_ZONE_GILNEAS = "Битва за Гилнеас"
L_ZONE_ANCIENTDALARAN = "Даларанский кратер"

-- WatchFrame Wowhead link
L_WATCH_WOWHEAD_LINK = "Ссылка на Wowhead"

-- Toggle Menu
L_TOGGLE_ADDON = "Модификация "
L_TOGGLE_ADDONS = " модификации"
L_TOGGLE_EXPAND = "Показать "
L_TOGGLE_COLLAPSE = "Скрыть "
L_TOGGLE_RCLICK = "ПКМ - Включить или выключить "
L_TOGGLE_LCLICK = "ЛКМ - Показать окно "
L_TOGGLE_RELOAD = " (необходимо перезагрузить интерфейс)"
L_TOGGLE_NOT_FOUND = " не найден."

-- UnitFrame
L_UF_GHOST = "Призрак"
L_UF_DEAD = "Мёртв"
L_UF_OFFLINE = "Не в сети"
L_UF_MANA = "Мало маны"

-- Map
L_MAP_CURSOR = "Курсор: "
L_MAP_BOUNDS = "Вне карты!"
L_MAP_FOG = "Туман войны"
L_MAP_COORDS = "Координаты"

-- Minimap
L_MINIMAP_CALENDAR = "Календарь"
L_MINIMAP_HEAL_LAYOUT = "Левый клик - Лекарь"
L_MINIMAP_DPS_LAYOUT = "Правый клик - Боец"
L_MINIMAP_BLIZZ_LAYOUT = "Средний клик - Blizzard"

-- Chat
L_CHAT_WHISPER = "От"
L_CHAT_BN_WHISPER = "От"
L_CHAT_AFK = "[AFK]"
L_CHAT_DND = "[DND]"
L_CHAT_GM = "[GM]"
L_CHAT_GUILD = "Г"
L_CHAT_PARTY = "Гр"
L_CHAT_PARTY_LEADER = "Лгр"
L_CHAT_RAID = "Р"
L_CHAT_RAID_LEADER = "ЛР"
L_CHAT_RAID_WARNING = "ОР"
L_CHAT_INSTANCE_CHAT = "П"
L_CHAT_INSTANCE_CHAT_LEADER = "ЛП"
L_CHAT_OFFICER = "О"
L_CHAT_PET_BATTLE = "БП"
L_CHAT_COME_ONLINE = "|cff298F00входит|r в игровой мир."
L_CHAT_GONE_OFFLINE = "|cffff0000выходит|r из игрового мира."

-- Errors frame
L_ERRORFRAME_L = "Щелкните, чтобы посмотреть ошибки."

-- Bags
L_BAG_BANK = "Bank"
L_BAG_NO_SLOTS = "Can't buy anymore slots!"
L_BAG_COSTS = "Cost: %.2f gold"
L_BAG_BUY_SLOTS = "Buy new slot with /bags purchase yes"
L_BAG_OPEN_BANK = "You need to open your bank first."
L_BAG_SORT = "Sort your bags or your bank, if open."
L_BAG_STACK = "Fill up partial stacks in your bags or bank, if open."
L_BAG_BUY_BANKS_SLOT = "Buy bank slot (need to have bank open)."
L_BAG_SORT_MENU = "Sort"
L_BAG_SORT_SPECIAL = "Sort Special"
L_BAG_STACK_MENU = "Stack"
L_BAG_STACK_SPECIAL = "Stack Special"
L_BAG_SHOW_BAGS = "Показать сумки"
L_BAG_SORTING_BAGS = "Sorting finished."
L_BAG_NOTHING_SORT = "Nothing to sort."
L_BAG_BAGS_BIDS = "Using bags: "
L_BAG_STACK_END = "Restacking finished."
L_BAG_RIGHT_CLICK_SEARCH = "ПКМ для поиска"
L_BAG_STACK_MENU = "Сложить"
L_BAG_BUTTONS_DEPOSIT = "Deposit Reagents"
L_BAG_BUTTONS_SORT = "LM:Cleanup / RM:Blizzard"
L_BAG_BUTTONS_ARTIFACT = "Right click to use Artifact Power item in bag"
L_BAG_RIGHT_CLICK_CLOSE = "ПКМ, чтобы открыть меню"

-- Grab mail
L_MAIL_STOPPED = "Сбор почты приостановлен. Нет места в сумках."
L_MAIL_UNIQUE = "Сбор почты приостановлен. Найден дубликат уникального предмета в сумке или банке."
L_MAIL_COMPLETE = "Сбор почты окончен."
L_MAIL_NEED = "Нужен почтовый ящик."
L_MAIL_MESSAGES = "сообщений"

-- Loot
L_LOOT_RANDOM = "Случайному игроку"
L_LOOT_SELF = "Забрать себе"
L_LOOT_FISH = "Рыбалка"
L_LOOT_ANNOUNCE = "Объявить"
L_LOOT_TO_RAID = "  рейду"
L_LOOT_TO_PARTY = "  группе"
L_LOOT_TO_GUILD = "  гильдии"
L_LOOT_TO_SAY = "  сказав"

-- LitePanels AFK module
L_PANELS_AFK = "Вы отсутствуете!"
L_PANELS_AFK_RCLICK = "Нажмите ПКМ, чтобы скрыть."
L_PANELS_AFK_LCLICK = "Нажмите ЛКМ, чтобы вернуться."

-- Cooldowns
L_COOLDOWNS = "Перезарядка: "
L_COOLDOWNS_COMBATRESS = "Возрождение"
L_COOLDOWNS_COMBATRESS_REMAINDER = "Возрождений в бою: "
L_COOLDOWNS_NEXTTIME = "Следующее: "

-- Autoinvite
L_INVITE_ENABLE = "Автоприглашение включено: "
L_INVITE_DISABLE = "Автоприглашение выключено"

-- Bind key
L_BIND_SAVED = "Все назначения клавиш сохранены."
L_BIND_DISCARD = "Все новые назначения клавиш были отменены."
L_BIND_INSTRUCT = "Наведите указатель мыши на кнопку действия, чтобы назначить клавишу. Нажмите клавишу ESC или правую кнопку мыши, чтобы убрать назначение."
L_BIND_CLEARED = "Все назначения были отменены для клавиши"
L_BIND_BINDING = "Назначение"
L_BIND_KEY = "Клавиша"
L_BIND_NO_SET = "Не назначено"

-- Info text
L_INFO_ERRORS = "Ошибок не обнаружено."
L_INFO_INVITE = "Приглашение принято от "
L_INFO_DUEL = "Дуэль отклонена от "
L_INFO_PET_DUEL = "Битва питомцев отклонена от "
L_INFO_DISBAND = "Роспуск группы..."
L_INFO_SETTINGS_DBM = "Введите /settings dbm, чтобы применить настройки DBM."
L_INFO_SETTINGS_BIGWIGS = "Введите /settings bw, чтобы применить настройки BigWigs."
L_INFO_SETTINGS_MSBT = "Введите /settings msbt, чтобы применить настройки MSBT."
L_INFO_SETTINGS_SKADA = "Введите /settings skada, чтобы применить настройки Skada."
L_INFO_SETTINGS_CHAT = "Type /settings chat, to apply the default chat settings."
L_INFO_SETTINGS_CVAR = "Type /settings cvar, to apply the default cvar(Game UI) settings."
L_INFO_SETTINGS_ALL = "Введите /settings all, чтобы применить настройки для всех модификаций."
L_INFO_NOT_INSTALLED = " не установлен."
L_INFO_SKIN_DISABLED1 = "Стилизация для "
L_INFO_SKIN_DISABLED2 = " выключена."

-- Popups
L_POPUP_INSTALLUI = "Это первый запуск ViksUI для этого персонажа. Необходимо перезагрузить интерфейс для его настройки."
L_POPUP_RESETUI = "Вы уверены, что хотите сбросить настройки ViksUI?"
L_POPUP_RESETSTATS = "Вы уверены, что хотите сбросить статистику золота и проведенного времени в игре?"
L_POPUP_SWITCH_RAID = "Выберите рейдовую раскладку."
L_POPUP_DISBAND_RAID = "Вы уверены, что хотите распустить группу?"
L_POPUP_DISABLEUI = "ViksUI не работает на этом разрешении, хотите отключить ViksUI? (Отмена, если хотите попробовать другое разрешение)"
L_POPUP_SETTINGS_ALL = "Применить настройки для всех модификаций? (DBM/DXE, Skada и MSBT)"
L_POPUP_SETTINGS_DBM = "Необходимо изменить позиции элементов DBM."
L_POPUP_SETTINGS_BW = "Необходимо изменить позиции элементов BigWigs."
L_POPUP_ARMORY = "Оружейная"
L_POPUP_CURRENCY_CAP = "Вы набрали максимальное количество"

-- Welcome message
L_WELCOME_LINE_1 = "Добро пожаловать в ViksUI "
L_WELCOME_LINE_2_1 = "Введите /cfg для входа в настройки интерфейса, или посетите страницу https://discord.gg/Dhp5nHh"
L_WELCOME_LINE_2_2 = "для получения дополнительной информации."

-- Combat text
L_COMBATTEXT_KILLING_BLOW = "Смерт. Удар"
L_COMBATTEXT_ALREADY_UNLOCKED = "Текст боя уже разблокирован."
L_COMBATTEXT_ALREADY_LOCKED = "Текст боя уже заблокирован."
L_COMBATTEXT_TEST_DISABLED = "Тестовый режим текста боя выключен."
L_COMBATTEXT_TEST_ENABLED = "Тестовый режим текста боя включен."
L_COMBATTEXT_TEST_USE_UNLOCK = "Введите /xct unlock, чтобы передвинуть или изменить размер области текста боя."
L_COMBATTEXT_TEST_USE_LOCK = "Введите /xct lock, чтобы заблокировать области текста боя."
L_COMBATTEXT_TEST_USE_TEST = "Введите /xct test, чтобы включить тестовый режим текста боя."
L_COMBATTEXT_TEST_USE_RESET = "Введите /xct reset, чтобы вернуть позиции по умолчанию."
L_COMBATTEXT_POPUP = "Для сохранения позиций текста боя необходимо перезагрузить интерфейс."
L_COMBATTEXT_UNSAVED = "Позиции текста боя не сохранены, не забудьте перезагрузить интерфейс."
L_COMBATTEXT_UNLOCKED = "Текст боя разблокирован."

-- LiteStats
L_STATS_ACC_PLAYED = "Время игры персонажем"
L_STATS_ADDED_JUNK = "Добавлено для автопродажи"
L_STATS_REMOVE_EXCEPTION = "Добавить/удалить предмет."
L_STATS_AUTO_REPAIR = "Автопочинка"
L_STATS_GUILD_REPAIR = "Починка из банка гильдии"
L_STATS_AUTO_SELL = "Автопродажа"
L_STATS_BANDWIDTH = "Скорость:"
L_STATS_DOWNLOAD = "Загрузка:"
L_STATS_CLEARED_JUNK = "Очищен список автопродажи."
L_STATS_CLEAR_EXCEPTIONS = "Очистить список."
L_STATS_CURRENCY_RAID = "Печати"
L_STATS_WORLD_MAP = "Нажатие открывает карту."
L_STATS_CURRENT_XP = "Текущий/Макс. опыт"
L_STATS_MEMORY_USAGE = "Использование памяти Blizzard:"
L_STATS_GARBAGE_COLLECTED = "Память очищена"
L_STATS_CHANGE_SORTING = "[Гильдия] ПКМ приглашения и шепот, СКМ изменяет сортировку, Shift+СКМ изменяет порядок сортировки."
L_STATS_HIDDEN = "Скрытые"
L_STATS_VIEW_NOTES = "Зажмите Alt для просмотра званий, обычных заметок и офицерских."
L_STATS_HR = "ч"
L_STATS_INF = "бесконечный"
L_STATS_ALREADY_EXCEPTIONS = "Уже в списке автопродажи."
L_STATS_NOT_JUNK = "is not junk."
L_STATS_ITEMLINK = "Ссылка на предмет"
L_STATS_JUNK_EXCEPTIONS = "Предметы для автопродажи"
L_STATS_JUNK_LIST = "Список автопродажи"
L_STATS_JUNK_PROFIT = "Прибыль с продажи"
L_STATS_KILLS = "У"
L_STATS_OPEN_CALENDAR = "ЛКМ открывает календарь (/календарь)."
L_STATS_OPEN_CHARACTER = "ЛКМ открывает окно персонажа."
L_STATS_OPEN_CURRENCY = "ЛКМ открывает окно валюты."
L_STATS_OPEN_TALENT = "ЛКМ открывает окно талантов."
L_STATS_XP_RATE = "Темп XP на этом уровне"
L_STATS_IGNORED_ITEMS = "Список предметов для автопродажи."
L_STATS_TOGGLE_TIME = "Местное/Серверное и 24-ч. показ времени изменяются через меню часов."
L_STATS_LOCATION = "Зона/Координаты"
L_STATS_MEMORY = "Память"
L_STATS_ON = "ВКЛ."
L_STATS_OTHER_OPTIONS = "Другие настройки вы можете изменить в %s"
L_STATS_PLAYED_LEVEL = "Время игры на этом уровне"
L_STATS_PLAYED_SESSION = "Время игры на этой сессии"
L_STATS_PLAYED_TOTAL = "Общее время игры"
L_STATS_QUEST = "З"
L_STATS_QUESTS_TO = "Заданий/Убийств до %s"
L_STATS_REMAINING_XP = "Осталось опыта"
L_STATS_REMOVED_JUNK = "Удалено из автопродажи"
L_STATS_RESTED_XP = "Опыт отдыха"
L_STATS_RC_COLLECTS_GARBAGE = "ПКМ очищает память от lua мусора."
L_STATS_RC_TIME_MANAGER = "ПКМ открывает часы."
L_STATS_RC_EXPERIENCE = "ПКМ переключает показ опыта, время игры, слежение за фракцией."
L_STATS_RC_AUTO_REPAIRING = "ПКМ переключает автопочинку."
L_STATS_RC_AUTO_SELLING = "ПКМ переключает автопродажу."
L_STATS_RC_TALENT = "ПКМ переключает ваш набор талантов."
L_STATS_SERVER_GOLD = "Золото на сервере"
L_STATS_SESSION_GAIN = "Получено/Потрачено за сеанс"
L_STATS_SESSION_XP = "Темп XP за этот сеанс"
L_STATS_INSERTS_COORDS = "Shift+ПКМ по модулю координат для вставки в чат ваших текущих координат."
L_STATS_EQUIPMENT_CHANGER = "Shift+ЛКМ или СКМ показывает комплекты экипировки."
L_STATS_SORTING_BY = "Сортировка по"
L_STATS_TIPS = "cоветы:"
L_STATS_TOTAL_MEMORY_USAGE = "Всего использовано памяти:"
L_STATS_NOT_TO_SELL = "Введите /junk, чтобы настроить какие предметы принудительно продавать."
L_STATS_WATCH_CURRENCY = "Показывает отображаемую валюту в подсказке."
L_STATS_WATCH_FACTIONS = "Просмотр фракций из окна репутации."
L_STATS_TOOLTIP_TIME_PLAYED = "Когда уровень максимальный, подсказка будет показывать время игры персонажами."
L_STATS_TOOLTIP_EXPERIENCE = "Когда уровень не максимальный, подсказка будет показывать подробности опыта."
L_STATS_SEALS = "Печатей на этой неделе"
L_STATS_TOTAL_CPU_USAGE = "Использование процессора:"
L_STATS_SPEC = "Спек"

-- Slash commands
L_SLASHCMD_HELP = {
	"Доступные слэш-команды:",
	"/rl - Перезагружает интерфейс.",
	"/rc - Провести проверку готовности группы/рейда.",
	"/gm - Связаться с ГМ. Помощь по игре.",
	"/dis ADDON_NAME - Выключение эддона.",
	"/en ADDON_NAME - Включение эддона.",
	"/rd - Расформировать группу/рейд.",
	"/toraid - Конвертация в группу/рейд.",
	"/teleport - Телепортация из подземелья.",
	"/spec, /ss - Переключение специализации.",
	"/heal - Переключает на 'Heal' раскладку.",
	"/dps - Переключает на 'DPS' раскладку.",
	"/frame - Информация об элементе под курсором.",
	"/farmmode - Увеличивает миникарту.",
	"/moveui - Перемещение элементов интерфейса.",
	"/resetui - Сброс общих настроек на стандартные.",
	"/resetuf - Сброс позиций юнит фреймов.",
	"/resetconfig - Сброс настроек ViksUI_Config.",
	"/resetstats - Сброс статистики золота и проведенного времени.",
	"/settings ADDON_NAME - Применение настроек для модификаций (msbt, dbm, skada).",
	"/ls, /litestats - Помощь для инфо-текстов.",
	"/xct - Управление текстом боя.",
	"/raidcd - Тест рейдовых перезарядок.",
	"/enemycd - Тест вражеских перезарядок.",
	"/pulsecd - Тест своих перезарядок.",
	"/threat - Тест списка угрозы.",
	"/tt - Шепнуть цели.",
	"/ainv - Включение автоматического приглашения.",
	"/testuf - Тест юнит фреймов.",
	"/cfg - Открыть настройки интерфейса.",
	"/installui - Opens installer.",
	"/vbt - Opens Bartender Select Profile.",
}