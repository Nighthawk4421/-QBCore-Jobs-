local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    for i, d in pairs(Config.Moonshine) do --index the config.packageddrugs list and make them useable in the function below
        QBCore.Functions.CreateUseableItem(i, function(source, item) --returns the list or arry of the config.packageddrugs
            player = QBCore.Functions.GetPlayer(source)
            TriggerClientEvent('moonshine:client:moonshinebreakdown', source, item, QBCore.Shared.Items[Config.Moonshine[item.name]])
        end)
    end
end)

RegisterNetEvent('moonshine:server:moonshinebreakdown', function(fromdrug, todrug)
    player = QBCore.Functions.GetPlayer(source)
    player.Functions.RemoveItem(fromdrug.name, 1, nil)
    player.Functions.AddItem(todrug.name, 50, nil, {})
end)

RegisterNetEvent('moonshine:server:moonshineharvest', function(harvestdrug)
    player = QBCore.Functions.GetPlayer(source)
    player.Functions.AddItem('moonshinecase', 1, nil, {})
end)

RegisterNetEvent('moonshine:server:getrubalcohol', function(harvestdrug)
    player = QBCore.Functions.GetPlayer(source)
    player.Functions.AddItem('rubbingalcohol', 1, nil, {})
end)

RegisterNetEvent('moonshine:server:harvestbarley', function(harvestdrug)
    player = QBCore.Functions.GetPlayer(source)
    player.Functions.AddItem('barley', 1, nil, {})
end)

RegisterServerEvent("moonshineharvest:removeItem")
AddEventHandler("moonshineharvest:removeItem", function(itemname, count)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    xPlayer.Functions.RemoveItem(itemname, count)
end)

RegisterNetEvent('moonshiner:ToggleDuty', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if Player.PlayerData.job.onduty then
        Player.Functions.SetJobDuty(false)
        TriggerClientEvent('QBCore:Notify', src, ('You clocked in'))
    else
        Player.Functions.SetJobDuty(true)
        TriggerClientEvent('QBCore:Notify', src, ('You clocked out'))
    end
    TriggerClientEvent('QBCore:Client:SetDuty', src, Player.PlayerData.job.onduty)
end)

QBCore.Functions.CreateUseableItem("moonshinejar", function(source, item)
    TriggerClientEvent("moonshine:client:DrinkShine", source, item.name)
end)

RegisterServerEvent('moonshine:server:sellproduct', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddMoney('cash', 75000)
    Player.Functions.RemoveItem('moonshinejar', 50, nil)
    --QBCore.Functions.Notify('You have sold a jar of moonshine ', 'success', 5000)
end)

RegisterNetEvent('moonshine:server:delivermoonshine', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = 'delivery_instructions'
    local item2 = 'deliveryreceipt'
    local item3 = 'moonshinecase'
    local quantity = 1

    Player.Functions.RemoveItem(item1, quantity)
    Player.Functions.RemoveItem(item3, quantity)
    Player.Functions.AddItem(item2, quantity)
end)

RegisterNetEvent('moonshine:server:getpaid', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local payment = Config.DeliveryPayment

    Player.Functions.RemoveItem('deliveryreceipt', 1)
    Player.Functions.AddMoney('cash', payment)
end)

RegisterNetEvent('moonshine:server:additem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'delivery_instructions'
    local quantity = 1

    Player.Functions.AddItem(item, quantity)
end)