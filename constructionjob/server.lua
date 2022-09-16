local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('construction:ToggleDuty', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if Player.PlayerData.job.onduty then
        Player.Functions.SetJobDuty(false)
        TriggerClientEvent('QBCore:Notify', source, ('You clocked in'))
    else
        Player.Functions.SetJobDuty(true)
        TriggerClientEvent('QBCore:Notify', source, ('You clocked out'))
    end
    TriggerClientEvent('QBCore:Client:SetDuty', source, Player.PlayerData.job.onduty)
end)

RegisterNetEvent('constructionjob:server:giveID', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'constructionid'
    local item2 = 'jobdetails'
    local quantity = 1
    local payment = Config.LicenseCost

    Player.Functions.AddItem(item, quantity)
    Player.Functions.RemoveItem(item2, quantity)
    Player.Functions.RemoveMoney('cash', Config.LicenseCost)
end)

RegisterNetEvent('constructionjob:server:giveIronPoles', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'ironpoles'
    local quantity = 1

    Player.Functions.AddItem(item, quantity)
end)

RegisterNetEvent('constructionjob:server:giveJobDetails', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'jobdetails'
    local quantity = 1

    Player.Functions.AddItem(item, quantity)
end)

RegisterNetEvent('constructionjob:server:sellIronPoles', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'ironpoles'
    local quantity = 1
    local cashquantity = Config.PoleSellAmount

    Player.Functions.RemoveItem(item, quantity)
    Player.Functions.AddMoney('cash', cashquantity)
end)