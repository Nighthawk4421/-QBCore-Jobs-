local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('whitewidow:givewhitewidow')
AddEventHandler('whitewidow:givewhitewidow', function(itemname, count)
    local player = QBCore.Functions.GetPlayer(source)    
    player.Functions.AddItem('whitewidow', 1, nil, {})
end)

RegisterNetEvent('whitewidow:giveBlueDream')
AddEventHandler('whitewidow:giveBlueDream', function(itemname, count)
    local player = QBCore.Functions.GetPlayer(source)    
    player.Functions.AddItem('bluedream', 1, nil, {})
end)

RegisterNetEvent('whitewidow:giveSourAppleDiesel')
AddEventHandler('whitewidow:giveSourAppleDiesel', function(itemname, count)
    local player = QBCore.Functions.GetPlayer(source)    
    player.Functions.AddItem('SourAppleDiesel', 1, nil, {})
end)

RegisterNetEvent('whitewidow:giveogkush')
AddEventHandler('whitewidow:giveogkush', function(itemname, count)
    local player = QBCore.Functions.GetPlayer(source)    
    player.Functions.AddItem('ogkush', 1, nil, {})
end)

RegisterNetEvent('whitewidow:removebluedreamblunt')
AddEventHandler('whitewidow:removebluedreamblunt', function(itemname, count)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local item = "premiumbluedreamblunt"
    local count = 1
    if xPlayer then
        xPlayer.Functions.RemoveItem(item, count)
        return
    end
end)

RegisterNetEvent('whitewidow:removepremiumogkushblunt')
AddEventHandler('whitewidow:removepremiumogkushblunt', function(itemname, count)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local item = "premiumogkushblunt"
    local count = 1
    if xPlayer then
        xPlayer.Functions.RemoveItem(item, count)
        return
    end
end)

RegisterNetEvent('whitewidow:removepremiumsourappledieselblunt')
AddEventHandler('whitewidow:removepremiumsourappledieselblunt', function(itemname, count)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local item = "premiumsourappledieselblunt"
    local count = 1
    if xPlayer then
        xPlayer.Functions.RemoveItem(item, count)
        return
    end
end)

RegisterNetEvent('whitewidow:removepremiumwhitewidowblunt')
AddEventHandler('whitewidow:removepremiumwhitewidowblunt', function(itemname, count)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local item = "premiumwhitewidowblunt"
    local count = 1
    if xPlayer then
        xPlayer.Functions.RemoveItem(item, count)
        return
    end
end)

RegisterNetEvent('whitewidow:server:buysoda')
AddEventHandler('whitewidow:server:buysoda', function(itemname, count)
    local Player = QBCore.Functions.GetPlayer(source)
    local count = 1
    local cost = Config.DrinkCosts
    if Player then
        exports['qb-management']:AddMoney('whitewidow', cost) -- Add $500 to society account
        Player.Functions.AddItem('kurkakola', count)
        Player.Functions.RemoveMoney('cash', cost)
        return
    end
end)

RegisterNetEvent('whitewidow:server:buysnikkels')
AddEventHandler('whitewidow:server:buysnikkels', function(itemname, count)
    local Player = QBCore.Functions.GetPlayer(source)
    local count = 1
    local cost = Config.SnackCosts
    if Player then
        exports['qb-management']:AddMoney('whitewidow', cost) -- Add $500 to society account
        Player.Functions.AddItem('snikkel_candy', count)
        Player.Functions.RemoveMoney('cash', cost)
        return
    end
end)

RegisterNetEvent('whitewidow:server:buytwerks')
AddEventHandler('whitewidow:server:buytwerks', function(itemname, count)
    local Player = QBCore.Functions.GetPlayer(source)
    local count = 1
    local cost = Config.SnackCosts
    if Player then
        exports['qb-management']:AddMoney('whitewidow', cost) -- Add $500 to society account
        Player.Functions.AddItem('twerks_candy', count)
        Player.Functions.RemoveMoney('cash', cost)
        return
    end
end)

RegisterNetEvent('whitewidow:ToggleDuty', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if Player.PlayerData.job.onduty then
        Player.Functions.SetJobDuty(false)
        TriggerClientEvent('QBCore:Notify', src, ('You clocked out'))
    else
        Player.Functions.SetJobDuty(true)
        TriggerClientEvent('QBCore:Notify', src, ('You clocked in'))
    end
    TriggerClientEvent('QBCore:Client:SetDuty', src, Player.PlayerData.job.onduty)
end)

RegisterNetEvent('whitewidow:server:rollpremiumogkushblunt')
AddEventHandler('whitewidow:server:rollpremiumogkushblunt', function(itemname, count)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local item = "premiumogkushblunt"
    local count = 5
    if xPlayer then
        xPlayer.Functions.AddItem(item, count)
        xPlayer.Functions.RemoveItem("ogkush", 1)
        return
    end
    if QBCore.Player.GetTotalWeight(xPlayer.PlayerData.items) < 85000 then
        xPlayer.Functions.AddItem(item, count)
    else
        TriggerClientEvent("QBCore:Notify", source, "You are too heavy ", "error")
    end
end)

RegisterNetEvent('whitewidow:server:rollpremiumsourappledieselblunt')
AddEventHandler('whitewidow:server:rollpremiumsourappledieselblunt', function(itemname, count)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local item = "premiumsourappledieselblunt"
    local count = 5
    if xPlayer then
        xPlayer.Functions.AddItem(item, count)
        xPlayer.Functions.RemoveItem("sourapplediesel", 1)
        return
    end
    if QBCore.Player.GetTotalWeight(xPlayer.PlayerData.items) < 85000 then
        xPlayer.Functions.AddItem(item, count)
    else
        TriggerClientEvent("QBCore:Notify", source, "You are too heavy ", "error")
    end
end)

RegisterNetEvent('whitewidow:server:rollbluedreampremiumblunt')
AddEventHandler('whitewidow:server:rollbluedreampremiumblunt', function(itemname, count)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local item = "premiumbluedreamblunt"
    local count = 5
    if xPlayer then
        xPlayer.Functions.AddItem(item, count)
        xPlayer.Functions.RemoveItem("bluedream", 1)
        return
    end
    if QBCore.Player.GetTotalWeight(xPlayer.PlayerData.items) < 85000 then
        xPlayer.Functions.AddItem(item, count)
    else
        TriggerClientEvent("QBCore:Notify", source, "You are too heavy ", "error")
    end
end)

RegisterNetEvent('whitewidow:server:rollpremiumwhitewidowblunt')
AddEventHandler('whitewidow:server:rollpremiumwhitewidowblunt', function(itemname, count)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local item = "premiumwhitewidowblunt"
    local count = 5
    if xPlayer then
        xPlayer.Functions.AddItem(item, count)
        xPlayer.Functions.RemoveItem("whitewidow", 1)
        return
    end
    if QBCore.Player.GetTotalWeight(xPlayer.PlayerData.items) < 85000 then
        xPlayer.Functions.AddItem(item, count)
    else
        TriggerClientEvent("QBCore:Notify", source, "You are too heavy ", "error")
    end
end)

QBCore.Functions.CreateUseableItem("premiumbluedreamblunt", function(source, item)
    TriggerClientEvent("whitewidow:client:smokeBlueDream", source, item.name)
end)

QBCore.Functions.CreateUseableItem("premiumogkushblunt", function(source, item)
    TriggerClientEvent("whitewidow:client:smokeBlueDream", source, item.name)
end)

QBCore.Functions.CreateUseableItem("premiumsourappledieselblunt", function(source, item)
    TriggerClientEvent("whitewidow:client:smokeBlueDream", source, item.name)
end)

QBCore.Functions.CreateUseableItem("premiumwhitewidowblunt", function(source, item)
    TriggerClientEvent("whitewidow:client:smokeBlueDream", source, item.name)
end)

QBCore.Functions.CreateUseableItem("girlscoutcookiesseed", function(source, item)
    TriggerClientEvent("whitewidow:client:girlscoutcookies", source, item.name)
end)

QBCore.Functions.CreateUseableItem("gscblunt", function(source, item)
    TriggerClientEvent("whitewidow:client:smokegscblunt", source, item.name)
end)

RegisterNetEvent('whitewidow:getcoffee')
AddEventHandler('whitewidow:getcoffee', function(itemname, count)
    local Player = QBCore.Functions.GetPlayer(source)
    local count = 1
    local cost = 5
    if Player then
        exports['qb-management']:AddMoney('whitewidow', cost) -- Add $500 to society account
        Player.Functions.AddItem('coffee', count)
        return
    end
end)

RegisterNetEvent('whitewidow:server:givegirlscoutcookies')
AddEventHandler('whitewidow:server:givegirlscoutcookies', function(itemname, count)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local count = 1
    if xPlayer then
        xPlayer.Functions.AddItem('girlscoutcookies', count)
        xPlayer.Functions.RemoveItem('girlscoutcookiesseed', count)
        return
    end
end)

RegisterNetEvent('whitewidow:server:givegirlscoutcookiesblunt')
AddEventHandler('whitewidow:server:givegirlscoutcookiesblunt', function(itemname, count)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local item = "gscblunt"
    local count = 1
    if xPlayer then
        xPlayer.Functions.AddItem(item, count)
        xPlayer.Functions.RemoveItem('girlscoutcookies', count)
        return
    end
end)

RegisterNetEvent('whitewidow:server:removegscblunt')
AddEventHandler('whitewidow:server:removegscblunt', function(itemname, count)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local count = 1
    if xPlayer then
        xPlayer.Functions.RemoveItem('gscblunt', count)
        return
    end
end)

RegisterNetEvent('whitewidow:server:getscale')
AddEventHandler('whitewidow:server:getscale', function(itemname, count)
    local Player = QBCore.Functions.GetPlayer(source)
    local count = 1
    local cost = 50
    if Player then
        exports['qb-management']:AddMoney('whitewidow', cost)
        Player.Functions.AddItem('scale', count)
        Player.Functions.RemoveMoney('cash', cost)
        return
    end
end)

RegisterNetEvent('whitewidow:server:gettrimmers')
AddEventHandler('whitewidow:server:gettrimmers', function(itemname, count)
    local Player = QBCore.Functions.GetPlayer(source)
    local count = 1
    local cost = 50
    if Player then
        exports['qb-management']:AddMoney('whitewidow', cost)
        Player.Functions.AddItem('trimmers', count)
        Player.Functions.RemoveMoney('cash', cost)
        return
    end
end)

RegisterNetEvent('whitewidow:server:getpapers')
AddEventHandler('whitewidow:server:getpapers', function(itemname, count)
    local Player = QBCore.Functions.GetPlayer(source)
    local count = 1
    local cost = 50
    if Player then
        exports['qb-management']:AddMoney('whitewidow', cost)
        Player.Functions.AddItem('rolling_paper', count)
        Player.Functions.RemoveMoney('cash', cost)
        return
    end
end)





--Bongs remove item section 
RegisterNetEvent('whitewidow:removebluedream')
AddEventHandler('whitewidow:removebluedream', function(itemname, count)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local item = "bluedream"
    local count = 1
    if xPlayer then
        xPlayer.Functions.RemoveItem(item, count)
        return
    end
end)

RegisterNetEvent('whitewidow:removesourapplediesel')
AddEventHandler('whitewidow:removesourapplediesel', function(itemname, count)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local item = "sourapplediesel"
    local count = 1
    if xPlayer then
        xPlayer.Functions.RemoveItem(item, count)
        return
    end
end)

RegisterNetEvent('whitewidow:removewhitewidow')
AddEventHandler('whitewidow:removewhitewidow', function(itemname, count)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local item = "whitewidow"
    local count = 1
    if xPlayer then
        xPlayer.Functions.RemoveItem(item, count)
        return
    end
end)

RegisterNetEvent('whitewidow:removeogkush')
AddEventHandler('whitewidow:removeogkush', function(itemname, count)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local item = "ogkush"
    local count = 1
    if xPlayer then
        xPlayer.Functions.RemoveItem(item, count)
        return
    end
end)

RegisterNetEvent('whitewidow:removegirlscoutcookies')
AddEventHandler('whitewidow:removegirlscoutcookies', function(itemname, count)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local item = "girlscoutcookies"
    local count = 1
    if xPlayer then
        xPlayer.Functions.RemoveItem(item, count)
        return
    end
end)