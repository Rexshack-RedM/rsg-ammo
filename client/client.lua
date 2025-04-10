local RSGCore = exports['rsg-core']:GetCoreObject()
lib.locale()

local _ammoTypes = {}
local ammoCache = {}
local dbDataInitialized = false

------------------------------------------
-- load ammo
------------------------------------------
local function canAddAmmo(ammoType, amount) 
    local ammoDefinition = _ammoTypes[ammoType]
    if not ammoDefinition then
        lib.notify({ title = locale('cl_lang_2'), type = 'error', duration = 5000 })
        return false
    end

    local total = GetPedAmmoByType(cache.ped, ammoType) + amount
    if total <= ammoDefinition.maxAmmo then
        return true
    else
        lib.notify({ title = locale('cl_lang_3'), type = 'error', duration = 5000 })
        return false
    end
end

lib.callback.register('rsg-ammo:client:CanAddAmmo', function(ammoType, amount)
    return canAddAmmo(ammoType, amount)
end)

RegisterNetEvent('rsg-ammo:client:AddAmmo', function(ammoType, amount)
    local ammoDefinition = _ammoTypes[ammoType]
    if not ammoDefinition then
        return
    end

    local total = GetPedAmmoByType(cache.ped, ammoType) + amount
    if total <= ammoDefinition.maxAmmo then
        AddAmmoToPedByType(cache.ped, ammoDefinition.hash, amount)
        lib.notify({ title = locale('cl_lang_6') .. '  x' .. amount, duration = 5000 })
    end
end)

------------------------------------------
-- open ammo box
------------------------------------------
RegisterNetEvent('rsg-ammo:client:openAmmoBox', function(ammoBoxItem, ammoType, amount)
    if not canAddAmmo(ammoType, amount) then return end

    if LocalPlayer.state.inv_busy then return end

    LocalPlayer.state:set("inv_busy", true, true)
    lib.progressBar({
        duration = Config.OpenAmmoBoxTime,
        label = locale('cl_lang_5') .. ' '.. RSGCore.Shared.Items[ammoBoxItem].label,
        useWhileDead = false,
        canCancel = false,
    })
    TriggerServerEvent('rsg-ammo:server:openAmmoBox', ammoBoxItem, ammoType, amount)
    LocalPlayer.state:set("inv_busy", false, true)
end)

------------------------------------------
-- update ammo loop
------------------------------------------
CreateThread(function()
    repeat Wait(1000) until dbDataInitialized

    while true do
        if LocalPlayer.state.isLoggedIn then

            local update = {}
            for ammoType, ammoData in pairs(_ammoTypes) do
                amount = GetPedAmmoByType(cache.ped, ammoData.hash)
                
                if amount ~= ammoCache[ammoType] then
                    update[ammoData.dbColumn] = amount
                    ammoCache[ammoType] = amount
                end
            end

            if next(update) ~= nil then
                TriggerServerEvent('rsg-ammo:server:updateDb', update)
            end
        end
        
        Wait(Config.SaveAmmoInterval)
    end
end)

------------------------------------------
-- set saved ammo values when player joins
------------------------------------------
local function onPlayerLoaded()
    _ammoTypes = _generateAmmoTypesTable()
    local reverseAmmoTypes = {}
    for ammoType, ammoData in pairs(_ammoTypes) do
        reverseAmmoTypes[ammoData.dbColumn] = ammoType
    end
    
    --throwable requires its weapon equipped in order to set ammo
    local throwableWeapons = {
        AMMO_MOLOTOV = 0x7067E7A7,
        AMMO_TOMAHAWK = 0xA5E972D7,
        AMMO_TOMAHAWK_ANCIENT = 0x7F23B6C7,
        AMMO_DYNAMITE = 0xA64DAA5E,
        AMMO_POISONBOTTLE = joaat('weapon_thrown_poisonbottle'),
        AMMO_THROWING_KNIVES = 0xD2718D48,
        AMMO_THROWING_KNIVES_DRAIN = 0xD2718D48,
        AMMO_THROWING_KNIVES_POISON = 0xD2718D48,
        AMMO_BOLAS = joaat('weapon_thrown_bolas'),
        AMMO_BOLAS_HAWKMOTH = joaat('weapon_thrown_bolas_hawkmoth'),
        AMMO_BOLAS_INTERTWINED = joaat('weapon_thrown_bolas_intertwined'),
        AMMO_BOLAS_IRONSPIKED = joaat('weapon_thrown_bolas_ironspiked'),
        AMMO_HATCHET = 0x09E12A01,
        AMMO_HATCHET_HUNTER = 0x2A5CF9D6,
        AMMO_HATCHET_CLEAVER = 0xEF32A25D,
    }

    RSGCore.Functions.TriggerCallback('rsg-ammo:server:initializeDb', function(ammoRow)
        for dbColumn, amount in pairs(ammoRow) do
            if not amount then goto continue end

            local ammoType = reverseAmmoTypes[dbColumn]
            if not ammoType then goto continue end

            if throwableWeapons[ammoType] and not HasPedGotWeapon(cache.ped, throwableWeapons[ammoType]) then
                GiveWeaponToPed(cache.ped, throwableWeapons[ammoType], 0, false, true )
            end

            SetPedAmmoByType(cache.ped, joaat(ammoType), amount)
            ammoCache[ammoType] = amount

            ::continue::
        end
        dbDataInitialized = true
    end)
end
AddEventHandler('RSGCore:Client:OnPlayerLoaded', onPlayerLoaded)

AddEventHandler('onResourceStart', function (resourceName) 
    if GetCurrentResourceName() == resourceName then
        if LocalPlayer.state.isLoggedIn and not dbDataInitialized then 
            onPlayerLoaded() 
        end
    end
end) 


AddEventHandler('onResourceStop', function (resourceName) 
    if GetCurrentResourceName() == resourceName then
        _ammoTypes = nil
        ammoCache = nil
        dbDataInitialized = nil
    end
end)

------------------------------------------
-- Generate db column names and hashes
------------------------------------------
_generateAmmoTypesTable = function()
    local ammoTypes = {}
    for _ammoType, _ammoData in pairs(Config.AmmoTypes) do
        ammoTypes[_ammoType] = {
            hash = joaat(_ammoType),
            dbColumn = string.lower(_ammoType),
            maxAmmo = _ammoData.maxAmmo,
            refill = _ammoData.refill,
        }
    end

    return ammoTypes
end

exports('GetAmmoTypes', function() 
    return _ammoTypes
end)