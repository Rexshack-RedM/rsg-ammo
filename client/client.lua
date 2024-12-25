local RSGCore = exports['rsg-core']:GetCoreObject()
lib.locale()

------------------------------------------
-- load ammo
------------------------------------------
RegisterNetEvent('rsg-ammo:client:AddAmmo', function(ammotype, amount)
    local max_ammo = 0
    local amount_ammo = 0
    local ammo_type = nil
    local ammo_save = 0
    local ammo_item = nil
    local valid_ammo = false

    ----------------------------
    -- revolver
    ----------------------------
    if ammotype == 'AMMO_REVOLVER' then
        max_ammo = 200
        amount_ammo = amount
        ammo_type = joaat('AMMO_REVOLVER')
        ammo_save = 'ammo_revolver'
        ammo_item = 'ammo_revolver'
        valid_ammo = true
    elseif ammotype == 'AMMO_REVOLVER_HIGH_VELOCITY' then
        max_ammo = 200
        amount_ammo = amount
        ammo_type = joaat('AMMO_REVOLVER_HIGH_VELOCITY')
        ammo_save = 'ammo_revolver_high_velocity'
        ammo_item = 'ammo_revolver_high_velocity'
        valid_ammo = true
    elseif ammotype == 'AMMO_REVOLVER_SPLIT_POINT' then
        max_ammo = 200
        amount_ammo = amount
        ammo_type = joaat('AMMO_REVOLVER_SPLIT_POINT')
        ammo_save = 'ammo_revolver_split_point'
        ammo_item = 'ammo_revolver_split_point'
        valid_ammo = true
    elseif ammotype == 'AMMO_REVOLVER_EXPRESS' then
        max_ammo = 200
        amount_ammo = amount
        ammo_type = joaat('AMMO_REVOLVER_EXPRESS')
        ammo_save = 'ammo_revolver_express'
        ammo_item = 'ammo_revolver_express'
        valid_ammo = true
    elseif ammotype == 'AMMO_REVOLVER_EXPRESS_EXPLOSIVE' then
        max_ammo = 10
        amount_ammo = amount
        ammo_type = joaat('AMMO_REVOLVER_EXPRESS_EXPLOSIVE')
        ammo_save = 'ammo_revolver_express_explosive'
        ammo_item = 'ammo_revolver_express_explosive'
        valid_ammo = true

    ----------------------------
    -- pistol
    ----------------------------
    elseif ammotype == 'AMMO_PISTOL' then
        max_ammo = 100
        amount_ammo = amount
        ammo_type = joaat('AMMO_PISTOL')
        ammo_save = 'ammo_pistol'
        ammo_item = 'ammo_pistol'
        valid_ammo = true
    elseif ammotype == 'AMMO_PISTOL_HIGH_VELOCITY' then
        max_ammo = 100
        amount_ammo = amount
        ammo_type = joaat('AMMO_PISTOL_HIGH_VELOCITY')
        ammo_save = 'ammo_pistol_high_velocity'
        ammo_item = 'ammo_pistol_high_velocity'
        valid_ammo = true
    elseif ammotype == 'AMMO_PISTOL_SPLIT_POINT' then
        max_ammo = 50
        amount_ammo = amount
        ammo_type = joaat('AMMO_PISTOL_SPLIT_POINT')
        ammo_save = 'ammo_pistol_split_point'
        ammo_item = 'ammo_pistol_split_point'
        valid_ammo = true
    elseif ammotype == 'AMMO_PISTOL_EXPRESS' then
        max_ammo = 100
        amount_ammo = amount
        ammo_type = joaat('AMMO_PISTOL_EXPRESS')
        ammo_save = 'ammo_pistol_express'
        ammo_item = 'ammo_pistol_express'
        valid_ammo = true
    elseif ammotype == 'AMMO_PISTOL_EXPRESS_EXPLOSIVE' then
        max_ammo = 10
        amount_ammo = amount
        ammo_type = joaat('AMMO_PISTOL_EXPRESS_EXPLOSIVE')
        ammo_save = 'ammo_pistol_express_explosive'
        ammo_item = 'ammo_pistol_express_explosive'
        valid_ammo = true

    ----------------------------
    -- repeater
    ----------------------------
    elseif ammotype == 'AMMO_REPEATER' then
        max_ammo = 200
        amount_ammo = amount
        ammo_type = joaat('AMMO_REPEATER')
        ammo_save = 'ammo_repeater'
        ammo_item = 'ammo_repeater'
        valid_ammo = true
    elseif ammotype == 'AMMO_REPEATER_HIGH_VELOCITY' then
        max_ammo = 200
        amount_ammo = amount
        ammo_type = joaat('AMMO_REPEATER_HIGH_VELOCITY')
        ammo_save = 'ammo_repeater_high_velocity'
        ammo_item = 'ammo_repeater_high_velocity'
        valid_ammo = true
    elseif ammotype == 'AMMO_REPEATER_SPLIT_POINT' then
        max_ammo = 100
        amount_ammo = amount
        ammo_type = joaat('AMMO_REPEATER_SPLIT_POINT')
        ammo_save = 'ammo_repeater_split_point'
        ammo_item = 'ammo_repeater_split_point'
        valid_ammo = true
    elseif ammotype == 'AMMO_REPEATER_EXPRESS' then
        max_ammo = 200
        amount_ammo = amount
        ammo_type = joaat('AMMO_REPEATER_EXPRESS')
        ammo_save = 'ammo_repeater_express'
        ammo_item = 'ammo_repeater_express'
        valid_ammo = true
    elseif ammotype == 'AMMO_REPEATER_EXPRESS_EXPLOSIVE' then
        max_ammo = 10
        amount_ammo = amount
        ammo_type = joaat('AMMO_REPEATER_EXPRESS_EXPLOSIVE')
        ammo_save = 'ammo_repeater_express_explosive'
        ammo_item = 'ammo_repeater_express_explosive'
        valid_ammo = true

    ----------------------------
    -- rifle
    ----------------------------
    elseif ammotype == 'AMMO_RIFLE' then
        max_ammo = 100
        amount_ammo = amount
        ammo_type = joaat('AMMO_RIFLE')
        ammo_save = 'ammo_rifle'
        ammo_item = 'ammo_rifle'
        valid_ammo = true
    elseif ammotype == 'AMMO_RIFLE_HIGH_VELOCITY' then
        max_ammo = 100
        amount_ammo = amount
        ammo_type = joaat('AMMO_RIFLE_HIGH_VELOCITY')
        ammo_save = 'ammo_rifle_high_velocity'
        ammo_item = 'ammo_rifle_high_velocity'
        valid_ammo = true
    elseif ammotype == 'AMMO_RIFLE_SPLIT_POINT' then
        max_ammo = 50
        amount_ammo = amount
        ammo_type = joaat('AMMO_RIFLE_SPLIT_POINT')
        ammo_save = 'ammo_rifle_split_point'
        ammo_item = 'ammo_rifle_split_point'
        valid_ammo = true
    elseif ammotype == 'AMMO_RIFLE_EXPRESS' then
        max_ammo = 100
        amount_ammo = amount
        ammo_type = joaat('AMMO_RIFLE_EXPRESS')
        ammo_save = 'ammo_rifle_express'
        ammo_item = 'ammo_rifle_express'
        valid_ammo = true
    elseif ammotype == 'AMMO_RIFLE_EXPRESS_EXPLOSIVE' then
        max_ammo = 10
        amount_ammo = amount
        ammo_type = joaat('AMMO_RIFLE_EXPRESS_EXPLOSIVE')
        ammo_save = 'ammo_rifle_express_explosive'
        ammo_item = 'ammo_rifle_express_explosive'
        valid_ammo = true

    ----------------------------
    -- shotgun
    ----------------------------
    elseif ammotype == 'AMMO_SHOTGUN' then
        max_ammo = 60
        amount_ammo = amount
        ammo_type = joaat('AMMO_SHOTGUN')
        ammo_save = 'ammo_buckshot'
        ammo_item = 'ammo_shotgun'
        valid_ammo = true
    elseif ammotype == 'AMMO_SHOTGUN_BUCKSHOT_INCENDIARY' then
        max_ammo = 14
        amount_ammo = amount
        ammo_type = joaat('AMMO_SHOTGUN_BUCKSHOT_INCENDIARY')
        ammo_save = 'ammo_buckshot_incendiary'
        ammo_item = 'ammo_shotgun_buckshot_incendiary'
        valid_ammo = true
    elseif ammotype == 'AMMO_SHOTGUN_SLUG' then
        max_ammo = 60
        amount_ammo = amount
        ammo_type = joaat('AMMO_SHOTGUN_SLUG')
        ammo_save = 'ammo_slug'
        ammo_item = 'ammo_shotgun_slug'
        valid_ammo = true
    elseif ammotype == 'AMMO_SHOTGUN_SLUG_EXPLOSIVE' then
        max_ammo = 10
        amount_ammo = amount
        ammo_type = joaat('AMMO_SHOTGUN_SLUG_EXPLOSIVE')
        ammo_save = 'ammo_slug_explosive'
        ammo_item = 'ammo_shotgun_slug_explosive'
        valid_ammo = true

    ----------------------------
    -- elephant rifle
    ----------------------------
    elseif ammotype == 'AMMO_RIFLE_ELEPHANT' then
        max_ammo = 20
        amount_ammo = amount
        ammo_type = joaat('AMMO_RIFLE_ELEPHANT')
        ammo_save = 'ammo_rifle_elephant'
        ammo_item = 'ammo_rifle_elephant'
        valid_ammo = true

    ----------------------------
    -- vermint rifle
    ----------------------------
    elseif ammotype == 'AMMO_22' then
        max_ammo = 100
        amount_ammo = amount
        ammo_type = joaat('AMMO_22')
        ammo_save = 'ammo_varmint'
        ammo_item = 'ammo_varmint'
        valid_ammo = true
    elseif ammotype == 'AMMO_22_TRANQUILIZER' then
        max_ammo = 200
        amount_ammo = amount
        ammo_type = joaat('AMMO_22_TRANQUILIZER')
        ammo_save = 'ammo_tranquilizer'
        ammo_item = 'ammo_varmint_tranquilizer'
        valid_ammo = true

    ----------------------------
    -- bow
    ----------------------------
    elseif ammotype == 'AMMO_ARROW' then
        max_ammo = 40
        amount_ammo = amount
        ammo_type = joaat('AMMO_ARROW')
        ammo_save = 'ammo_arrow'
        ammo_item = 'ammo_arrow'
        valid_ammo = true
    elseif ammotype == 'AMMO_ARROW_FIRE' then
        max_ammo = 8
        amount_ammo = amount
        ammo_type = joaat('AMMO_ARROW_FIRE')
        ammo_save = 'ammo_fire'
        ammo_item = 'ammo_arrow_fire'
        valid_ammo = true
    elseif ammotype == 'AMMO_ARROW_POISON' then
        max_ammo = 8
        amount_ammo = amount
        ammo_type = joaat('AMMO_ARROW_POISON')
        ammo_save = 'ammo_poison'
        ammo_item = 'ammo_arrow_poison'
        valid_ammo = true
    elseif ammotype == 'AMMO_ARROW_DYNAMITE' then
        max_ammo = 8
        amount_ammo = amount
        ammo_type = joaat('AMMO_ARROW_DYNAMITE')
        ammo_save = 'ammo_dynamite'
        ammo_item = 'ammo_arrow_dynamite'
        valid_ammo = true
    end

    if not valid_ammo then
        lib.notify({ title = locale('cl_lang_2'), type = 'error', duration = 5000 })
        return
    end

    local currentammo = GetPedAmmoByType(cache.ped, ammo_type)
    local total = currentammo + amount_ammo

    if total <= max_ammo then
        AddAmmoToPedByType(cache.ped, ammo_type, amount_ammo, 0xCA3454E6)
    else
        lib.notify({ title = locale('cl_lang_3'), type = 'error', duration = 5000 })
    end

end)

------------------------------------------
-- open ammo box
------------------------------------------
RegisterNetEvent('rsg-ammo:client:openAmmoBox', function(removeitem, removeitemlabel, ammotype, amount)
    LocalPlayer.state:set("inv_busy", true, true)
    lib.progressBar({
        duration = Config.OpenAmmoBoxTime,
        label = locale('Opening') .. ' '.. removeitemlabel,
        useWhileDead = false,
        canCancel = false,
    })
    TriggerServerEvent('rsg-ammo:server:openAmmoBox', removeitem, ammotype, amount)
    LocalPlayer.state:set("inv_busy", false, true)
end)


local _ammoTypes = {
    AMMO_REVOLVER = 'ammo_revolver',
    AMMO_REVOLVER_EXPRESS = 'ammo_revolver_express',
    AMMO_REVOLVER_EXPRESS_EXPLOSIVE = 'ammo_revolver_express_explosive',
    AMMO_REVOLVER_HIGH_VELOCITY = 'ammo_revolver_high_velocity',
    AMMO_REVOLVER_SPLIT_POINT = 'ammo_revolver_split_point',
    AMMO_PISTOL = 'ammo_pistol',
    AMMO_PISTOL_EXPRESS = 'ammo_pistol_express',
    AMMO_PISTOL_EXPRESS_EXPLOSIVE = 'ammo_pistol_express_explosive',
    AMMO_PISTOL_HIGH_VELOCITY = 'ammo_pistol_high_velocity',
    AMMO_PISTOL_SPLIT_POINT = 'ammo_pistol_split_point',
    AMMO_REPEATER = 'ammo_repeater',
    AMMO_REPEATER_EXPRESS = 'ammo_repeater_express',
    AMMO_REPEATER_EXPRESS_EXPLOSIVE = 'ammo_repeater_express_explosive',
    AMMO_REPEATER_HIGH_VELOCITY = 'ammo_repeater_high_velocity',
    AMMO_REPEATER_SPLIT_POINT = 'ammo_repeater_split_point',
    AMMO_RIFLE = 'ammo_rifle',
    AMMO_RIFLE_EXPRESS = 'ammo_rifle_express',
    AMMO_RIFLE_EXPRESS_EXPLOSIVE = 'ammo_rifle_express_explosive',
    AMMO_RIFLE_HIGH_VELOCITY = 'ammo_rifle_high_velocity',
    AMMO_RIFLE_SPLIT_POINT = 'ammo_rifle_split_point',
    AMMO_SHOTGUN = 'ammo_buckshot',
    AMMO_SHOTGUN_BUCKSHOT_INCENDIARY = 'ammo_buckshot_incendiary',
    AMMO_SHOTGUN_SLUG = 'ammo_slug',
    AMMO_SHOTGUN_SLUG_EXPLOSIVE = 'ammo_slug_explosive',
    AMMO_RIFLE_ELEPHANT = 'ammo_rifle_elephant',
    AMMO_22 = 'ammo_varmint',
    AMMO_22_TRANQUILIZER = 'ammo_tranquilizer',
    AMMO_ARROW = 'ammo_arrow',
    AMMO_ARROW_FIRE = 'ammo_fire',
    AMMO_ARROW_POISON = 'ammo_poison',
    AMMO_ARROW_DYNAMITE = 'ammo_dynamite',

    AMMO_MOLOTOV = 'thrown_molotov',
    AMMO_TOMAHAWK = 'thrown_tomahawk',
    AMMO_TOMAHAWK_ANCIENT = 'thrown_tomahawk_ancient',
    AMMO_DYNAMITE = 'thrown_dynamite',
    AMMO_POISONBOTTLE = 'thrown_poisonbottle',
    AMMO_THROWING_KNIVES = 'thrown_knives',
    AMMO_BOLAS = 'thrown_bolas',
    AMMO_BOLAS_HAWKMOTH = 'thrown_bolas_hawkmoth',
    AMMO_BOLAS_INTERTWINED = 'thrown_bolas_intertwined',
    AMMO_BOLAS_IRONSPIKED = 'thrown_bolas_ironspiked',
    AMMO_HATCHET = 'thrown_hatchet',
    AMMO_HATCHET_HUNTER = 'thrown_hatchet_hunter',
    AMMO_HATCHET_CLEAVER = 'thrown_hatchet_cleaver',
}

local ammoCache = {}
local dbDataInitialized = false
------------------------------------------
-- update ammo loop
------------------------------------------
CreateThread(function()
    while true do
        repeat Wait(1000) until dbDataInitialized
        local update = {}

        for ammoType, dbAmmoType in pairs(_ammoTypes) do
            amount = GetPedAmmoByType(cache.ped, joaat(ammoType))
            
            if amount ~= ammoCache[ammoType] then
                update[dbAmmoType] = amount
                ammoCache[ammoType] = amount
            end
        end

        if next(update) ~= nil then
            TriggerServerEvent('rsg-ammo:server:updateDb', update)
        end
       
        Wait(1000)
    end
end)

------------------------------------------
-- check if ammo row exists and fetch ammo values
------------------------------------------
AddEventHandler('RSGCore:Client:OnPlayerLoaded', function()
    local reverseAmmoTypes = {}
    for key, value in pairs(_ammoTypes) do
        reverseAmmoTypes[value] = key
    end
    
    local thrownWeapons = {
        AMMO_MOLOTOV = 0x7067E7A7,
        AMMO_TOMAHAWK = 0xA5E972D7,
        AMMO_TOMAHAWK_ANCIENT = 0x7F23B6C7,
        AMMO_DYNAMITE = 0xA64DAA5E,
        AMMO_POISONBOTTLE = joaat('weapon_thrown_poisonbottle'),
        AMMO_THROWING_KNIVES = 0xD2718D48,
        AMMO_BOLAS = joaat('weapon_thrown_bolas'),
        AMMO_BOLAS_HAWKMOTH = joaat('weapon_thrown_bolas_hawkmoth'),
        AMMO_BOLAS_INTERTWINED = joaat('weapon_thrown_bolas_intertwined'),
        AMMO_BOLAS_IRONSPIKED = joaat('weapon_thrown_bolas_ironspiked'),
        AMMO_HATCHET = 0x09E12A01,
        AMMO_HATCHET_HUNTER = 0x2A5CF9D6,
        AMMO_HATCHET_CLEAVER = 0xEF32A25D,
    }

    RSGCore.Functions.TriggerCallback('rsg-ammo:server:initializeDb', function(ammoRow)
        for ammoDbType, amount in pairs(ammoRow) do
            if not reverseAmmoTypes[ammoDbType] then goto continue end

            local ammoType = reverseAmmoTypes[ammoDbType]
            if thrownWeapons[ammoType] then
                GiveWeaponToPed(cache.ped, thrownWeapons[ammoType], amount, false, true )
            end

            SetPedAmmoByType(cache.ped, joaat(ammoType), amount)
            ammoCache[ammoType] = amount

            ::continue::
        end
        dbDataInitialized = true
    end)
end)