local RSGCore = exports['rsg-core']:GetCoreObject()

for _itemName, _ammoData in pairs(Config.BoxAmmo) do
    RSGCore.Functions.CreateUseableItem(_itemName, function(source, item)
        local src = source
        local Player = RSGCore.Functions.GetPlayer(src)
        if not Player then return end
        TriggerClientEvent('rsg-ammo:client:openAmmoBox', src, item.name, item.label, _ammoData.ammoType, _ammoData.amount)
    end)
end

------------------------------------------
-- use arrow ammo
------------------------------------------
RSGCore.Functions.CreateUseableItem('ammo_arrow', function(source, item)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', source, 'AMMO_ARROW', Config.AmountArrowAmmo)
end)

RSGCore.Functions.CreateUseableItem('ammo_arrow_fire', function(source, item)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', source, 'AMMO_ARROW_FIRE', Config.AmountFireArrowAmmo)
end)

RSGCore.Functions.CreateUseableItem('ammo_arrow_poison', function(source, item)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', source, 'AMMO_ARROW_POISON', Config.AmountPoisonArrowAmmo)
end)

RSGCore.Functions.CreateUseableItem('ammo_arrow_dynamite', function(source, item)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', source, 'AMMO_ARROW_DYNAMITE', Config.AmountDynamiteArrowAmmo)
end)

---------------------------------------------
-- remove item
---------------------------------------------
RegisterServerEvent('rsg-ammo:server:removeitem')
AddEventHandler('rsg-ammo:server:removeitem', function(item, amount)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveItem(item, amount)
    TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[item], 'remove', amount)
end)

---------------------------------------------
-- open ammo box
---------------------------------------------
RegisterServerEvent('rsg-ammo:server:openAmmoBox')
AddEventHandler('rsg-ammo:server:openAmmoBox', function(removeitem, ammotype, amount)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveItem(removeitem, 1)
    TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[removeitem], 'remove', 1)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', src, ammotype, amount)

end)

RSGCore.Functions.CreateCallback('rsg-ammo:server:initializeDb', function(source, cb)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local citizenid = Player.PlayerData.citizenid
    if not citizenid then return end
    MySQL.single('SELECT * FROM player_ammo WHERE citizenid = ? LIMIT 1', {
        citizenid
    }, function(row)
        if not row then
            MySQL.insert.await('INSERT INTO player_ammo (citizenid) VALUES (?)', {
                citizenid
            })
            row = MySQL.single.await('SELECT * FROM player_ammo WHERE citizenid = ? LIMIT 1', {
                citizenid
            })
        end
     
        cb(row)
    end)
end)

RegisterServerEvent('rsg-ammo:server:updateDb')
AddEventHandler('rsg-ammo:server:updateDb', function(update)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end

    if next(update) then 
        local setClauses = {}
        local params = {}
        for column, value in pairs(update) do
            table.insert(setClauses, column .. " = @" .. column)
            params["@" .. column] = value
        end
    
        local sql = "UPDATE player_ammo SET " .. table.concat(setClauses, ", ") .. " WHERE citizenid = @citizenid"
        params["@citizenid"] = Player.PlayerData.citizenid
    
        MySQL.Sync.execute(sql, params)
    end
end)
