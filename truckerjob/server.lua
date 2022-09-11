local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('truckerjob:server:deliverpackage', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = 'deliveryslip'
    local item2 = 'deliveryreceipt'
    local item3 = 'deliverypackages'
    local quantity = 1

    Player.Functions.RemoveItem(item1, quantity)
    Player.Functions.RemoveItem(item3, quantity)
    Player.Functions.AddItem(item2, quantity)

end)

RegisterNetEvent('truckerjob:server:getpaid', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local payment = Config.DeliveryPayment

    Player.Functions.RemoveItem('deliveryreceipt', 1)
    Player.Functions.AddMoney('cash', payment)
end)

RegisterNetEvent('truckerjob:server:warehousegetpaid', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local payment = Config.StockPayment

    Player.Functions.AddMoney('cash', payment)
end)

RegisterNetEvent('truckerjob:server:givestoragelabel', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local item = 'storagelabel'
    local quantity = 1

    Player.Functions.AddItem(item, quantity)
end)

RegisterNetEvent('truckerjob:server:removestoragelabel', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local item = 'storagelabel'
    local quantity = 1

    Player.Functions.RemoveItem(item, quantity)
end)

RegisterNetEvent('truckerjob:server:additem', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local item = 'deliveryslip'
    local item2 = 'deliverypackages'
    local quantity = 1

    Player.Functions.AddItem(item, quantity)
    Player.Functions.AddItem(item2, quantity)
end)

RegisterNetEvent('truckerjob:ToggleDuty', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    if Player.PlayerData.job.onduty then
        Player.Functions.SetJobDuty(false)
        TriggerClientEvent('QBCore:Notify', source, ('You clocked out'))
    else
        Player.Functions.SetJobDuty(true)
        TriggerClientEvent('QBCore:Notify', source, ('You clocked in '))
    end
    TriggerClientEvent('QBCore:Client:SetDuty', source, Player.PlayerData.job.onduty)
end)

RegisterNetEvent('warehousejob:ToggleDuty', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    if Player.PlayerData.job.onduty then
        Player.Functions.SetJobDuty(false)
        TriggerClientEvent('QBCore:Notify', source, ('You clocked out'))
    else
        Player.Functions.SetJobDuty(true)
        TriggerClientEvent('QBCore:Notify', source, ('You clocked in '))
    end
    TriggerClientEvent('QBCore:Client:SetDuty', source, Player.PlayerData.job.onduty)
end)