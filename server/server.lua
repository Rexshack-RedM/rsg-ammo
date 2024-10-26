local RSGCore = exports['rsg-core']:GetCoreObject()
lib.locale()

------------------------------------------
-- use revolver ammo
------------------------------------------
RSGCore.Functions.CreateUseableItem('ammo_revolver', function(source, item)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', source, 'AMMO_REVOLVER')
end)

RSGCore.Functions.CreateUseableItem('ammo_revolver_high_velocity', function(source, item)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', source, 'AMMO_REVOLVER_HIGH_VELOCITY')
end)

RSGCore.Functions.CreateUseableItem('ammo_revolver_split_point', function(source, item)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', source, 'AMMO_REVOLVER_SPLIT_POINT')
end)

RSGCore.Functions.CreateUseableItem('ammo_revolver_express', function(source, item)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', source, 'AMMO_REVOLVER_EXPRESS')
end)

RSGCore.Functions.CreateUseableItem('ammo_revolver_express_explosive', function(source, item)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', source, 'AMMO_REVOLVER_EXPRESS_EXPLOSIVE')
end)

------------------------------------------
-- use pistol ammo
------------------------------------------
RSGCore.Functions.CreateUseableItem('ammo_pistol', function(source, item)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', source, 'AMMO_PISTOL')
end)

RSGCore.Functions.CreateUseableItem('ammo_pistol_high_velocity', function(source, item)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', source, 'AMMO_PISTOL_HIGH_VELOCITY')
end)

RSGCore.Functions.CreateUseableItem('ammo_pistol_split_point', function(source, item)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', source, 'AMMO_PISTOL_SPLIT_POINT')
end)

RSGCore.Functions.CreateUseableItem('ammo_pistol_express', function(source, item)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', source, 'AMMO_PISTOL_EXPRESS')
end)

RSGCore.Functions.CreateUseableItem('ammo_pistol_express_explosive', function(source, item)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', source, 'AMMO_PISTOL_EXPRESS_EXPLOSIVE')
end)

------------------------------------------
-- use repeater ammo
------------------------------------------
RSGCore.Functions.CreateUseableItem('ammo_repeater', function(source, item)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', source, 'AMMO_REPEATER')
end)

RSGCore.Functions.CreateUseableItem('ammo_repeater_high_velocity', function(source, item)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', source, 'AMMO_REPEATER_HIGH_VELOCITY')
end)

RSGCore.Functions.CreateUseableItem('ammo_repeater_split_point', function(source, item)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', source, 'AMMO_REPEATER_SPLIT_POINT')
end)

RSGCore.Functions.CreateUseableItem('ammo_repeater_express', function(source, item)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', source, 'AMMO_REPEATER_EXPRESS')
end)

RSGCore.Functions.CreateUseableItem('ammo_repeater_express_explosive', function(source, item)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', source, 'AMMO_REPEATER_EXPRESS_EXPLOSIVE')
end)

------------------------------------------
-- use rifle ammo
------------------------------------------
RSGCore.Functions.CreateUseableItem('ammo_rifle', function(source, item)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', source, 'AMMO_RIFLE')
end)

RSGCore.Functions.CreateUseableItem('ammo_rifle_high_velocity', function(source, item)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', source, 'AMMO_RIFLE_HIGH_VELOCITY')
end)

RSGCore.Functions.CreateUseableItem('ammo_rifle_split_point', function(source, item)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', source, 'AMMO_RIFLE_SPLIT_POINT')
end)

RSGCore.Functions.CreateUseableItem('ammo_rifle_express', function(source, item)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', source, 'AMMO_RIFLE_EXPRESS')
end)

RSGCore.Functions.CreateUseableItem('ammo_rifle_express_explosive', function(source, item)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', source, 'AMMO_RIFLE_EXPRESS_EXPLOSIVE')
end)

------------------------------------------
-- use shotgun ammo
------------------------------------------
RSGCore.Functions.CreateUseableItem('ammo_shotgun', function(source, item)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', source, 'AMMO_SHOTGUN')
end)

RSGCore.Functions.CreateUseableItem('ammo_shotgun_buckshot_incendiary', function(source, item)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', source, 'AMMO_SHOTGUN_BUCKSHOT_INCENDIARY')
end)

RSGCore.Functions.CreateUseableItem('ammo_shotgun_slug', function(source, item)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', source, 'AMMO_SHOTGUN_SLUG')
end)

RSGCore.Functions.CreateUseableItem('ammo_shotgun_slug_explosive', function(source, item)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', source, 'AMMO_SHOTGUN_SLUG_EXPLOSIVE')
end)

------------------------------------------
-- use elephant rifle ammo
------------------------------------------
RSGCore.Functions.CreateUseableItem('ammo_rifle_elephant', function(source, item)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', source, 'AMMO_RIFLE_ELEPHANT')
end)

------------------------------------------
-- use varmint rifle ammo
------------------------------------------
RSGCore.Functions.CreateUseableItem('ammo_varmint', function(source, item)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', source, 'AMMO_22')
end)

RSGCore.Functions.CreateUseableItem('ammo_varmint_tranquilizer', function(source, item)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', source, 'AMMO_22_TRANQUILIZER')
end)

------------------------------------------
-- use arrow ammo
------------------------------------------
RSGCore.Functions.CreateUseableItem('ammo_arrow', function(source, item)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', source, 'AMMO_ARROW')
end)

RSGCore.Functions.CreateUseableItem('ammo_arrow_fire', function(source, item)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', source, 'AMMO_ARROW_FIRE')
end)

RSGCore.Functions.CreateUseableItem('ammo_arrow_poison', function(source, item)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', source, 'AMMO_ARROW_POISON')
end)

RSGCore.Functions.CreateUseableItem('ammo_arrow_dynamite', function(source, item)
    TriggerClientEvent('rsg-ammo:client:AddAmmo', source, 'AMMO_ARROW_DYNAMITE')
end)

for k, v in pairs(Config.BoxAmmo) do
    RSGCore.Functions.CreateUseableItem(k, function(source, item)
        local src = source
        local Player = RSGCore.Functions.GetPlayer(src)
        if not Player then return end
        TriggerClientEvent('rsg-ammo:client:openAmmoBox', src, item.name, item.label, v.item, v.amount)
    end)
end

------------------------------------------
-- update ammo
------------------------------------------
RegisterServerEvent('rsg-ammo:server:updateammo', function(serial, ammotype, ammo)
    if ammotype == 'ammo' then
        MySQL.update('UPDATE player_weapons SET ammo = ? WHERE serial = ?', { ammo, serial })
    end
    if ammotype == 'ammo_express' then
        MySQL.update('UPDATE player_weapons SET ammo_express = ? WHERE serial = ?', { ammo, serial })
    end
    if ammotype == 'ammo_express_explosive' then
        MySQL.update('UPDATE player_weapons SET ammo_express_explosive = ? WHERE serial = ?', { ammo, serial })
    end
    if ammotype == 'ammo_high_velocity' then
        MySQL.update('UPDATE player_weapons SET ammo_high_velocity = ? WHERE serial = ?', { ammo, serial })
    end
    if ammotype == 'ammo_split_point' then
        MySQL.update('UPDATE player_weapons SET ammo_split_point = ? WHERE serial = ?', { ammo, serial })
    end
    if ammotype == 'ammo_buckshot_incendiary' then
        MySQL.update('UPDATE player_weapons SET ammo_buckshot_incendiary = ? WHERE serial = ?', { ammo, serial })
    end
    if ammotype == 'ammo_slug' then
        MySQL.update('UPDATE player_weapons SET ammo_slug = ? WHERE serial = ?', { ammo, serial })
    end
    if ammotype == 'ammo_slug_explosive' then
        MySQL.update('UPDATE player_weapons SET ammo_slug_explosive = ? WHERE serial = ?', { ammo, serial })
    end
    if ammotype == 'ammo_tranquilizer' then
        MySQL.update('UPDATE player_weapons SET ammo_tranquilizer = ? WHERE serial = ?', { ammo, serial })
    end
    if ammotype == 'ammo_fire' then
        MySQL.update('UPDATE player_weapons SET ammo_fire = ? WHERE serial = ?', { ammo, serial })
    end
    if ammotype == 'ammo_poison' then
        MySQL.update('UPDATE player_weapons SET ammo_poison = ? WHERE serial = ?', { ammo, serial })
    end
    if ammotype == 'ammo_dynamite' then
        MySQL.update('UPDATE player_weapons SET ammo_dynamite = ? WHERE serial = ?', { ammo, serial })
    end
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
AddEventHandler('rsg-ammo:server:openAmmoBox', function(removeitem, giveitem, amount)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveItem(removeitem, 1)
    TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[removeitem], 'remove', 1)
    Player.Functions.AddItem(giveitem, amount)
    TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[giveitem], 'add', amount)
end)
