local QBCore = exports['qb-core']:GetCoreObject()
local alcoholCount = 0
local veh = nil
RegisterNetEvent('moonshine:client:moonshinebreakdown', function(fromdrug, todrug)
    QBCore.Functions.Progressbar('Opening package ' .. fromdrug.label .. '  ' .. todrug.label, 'Opening package ' .. fromdrug.label .. '  ' .. todrug.label, 5000, false, false, false, nil, nil, nil, function()
        TriggerServerEvent('moonshine:server:moonshinebreakdown', fromdrug, todrug)
    end, nil)
end)




--Clock In


exports['qb-target']:AddBoxZone("moonshineclockin", vector3(2435.33, 4962.78, 42.35), 2.45, 3.35, {
	name = "moonshineclockin",
	heading = 222.57,
	debugPoly = false,
	minZ = 1.77834,
	maxZ = 338.87834,
}, {
	options = {
		{
            type = "server",
            event = "moonshiner:ToggleDuty",
			icon = "fas fa-sign-in-alt",
			label = "Clock In",
			job = "moonshiner",
		},
	},
	distance = 2.5
})



--Craft the rubbing alcohol


RegisterNetEvent('moonshine:client:getrubalcohol', function(harvestdrug)
    local playerPed = PlayerPedId()
    local hasItem = QBCore.Functions.HasItem('butanegas')
    local hasItem2 = QBCore.Functions.HasItem('oliveoil')
    local animDict = "anim@amb@business@meth@meth_monitoring_cooking@cooking@"
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Wait(10) end
    Wait(10)
    if hasItem and hasItem2 then
        TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_ATM", 0, false)
        TriggerServerEvent("moonshineharvest:removeItem", 'butanegas', 1)
        TriggerServerEvent("moonshineharvest:removeItem", 'oliveoil', 1)
        QBCore.Functions.Progressbar('You start to ', ' You are cooking rubbing alcohol ', 7000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true
            }, {}, {}, {}, function()
                QBCore.Functions.Notify('you started the cooking process. Wait for it to finish %1', 'success', 2500)
                Wait(5000)
                QBCore.Functions.Notify('you started the cooking process. Wait for it to finish %10', 'success', 2500)
                Wait(5000)
                QBCore.Functions.Notify('you started the cooking process. Wait for it to finish %20', 'success', 2500)
                Wait(5000)
                QBCore.Functions.Notify('you started the cooking process. Wait for it to finish %30', 'success', 2500)
                Wait(5000)
                QBCore.Functions.Notify('you started the cooking process. Wait for it to finish %40', 'success', 2500)
                Wait(5000)
                QBCore.Functions.Notify('you started the cooking process. Wait for it to finish %50', 'success', 2500)
                Wait(5000)
                QBCore.Functions.Notify('you started the cooking process. Wait for it to finish %60', 'success', 2500)
                Wait(5000)
                QBCore.Functions.Notify('you started the cooking process. Wait for it to finish %70', 'success', 2500)
                Wait(5000)
                QBCore.Functions.Notify('you started the cooking process. Wait for it to finish %80', 'success', 2500)
                Wait(5000)
                QBCore.Functions.Notify('you started the cooking process. Wait for it to finish %90', 'success', 2500)
                Wait(5000)
                QBCore.Functions.Notify('you started the cooking process. Wait for it to finish %100', 'success', 2500)
                Wait(3000)
                TriggerServerEvent('moonshine:server:getrubalcohol')
                QBCore.Functions.Notify('You have cooked rubbing alcohol ', 'success', 5000)
            end)
        else
            QBCore.Functions.Notify('You dont have the right ingredients', 'error', 5000)
        end
        ClearPedTasks(playerPed)
end)

exports['qb-target']:AddBoxZone("getrubalcohol", vector3(2435.98, 4965.6, 42.35), 3.0, 3.0, {
	name = "getrubalcohol",
	heading = 222.47,
	debugPoly = false,
	minZ = 1.77834,
	maxZ = 300.87834,
}, {
	options = {
		{
            type = "client",
            event = "moonshine:client:getrubalcohol",
			icon = "fas fa-sign-in-alt",
			label = "Cook Rubbing Alcohol",
            job = "moonshiner",
		},
	},
	distance = 2.5
})




--Harvest Barley with target export



RegisterNetEvent('moonshine:client:harvestbarley', function(harvestdrug)
    local playerPed = PlayerPedId()
    local hasItem = QBCore.Functions.HasItem('trimmers')
    local animDict = "anim@amb@business@weed@weed_inspecting_lo_med_hi@"
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Wait(10) end
    Citizen.Wait(10)
    if hasItem then
        TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_GARDENER_PLANT", 0, false)
        QBCore.Functions.Progressbar('You start to ', ' You are harvesting barley ', 7000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true
            }, {}, {}, {}, function()
                QBCore.Functions.Notify('You are collecting barley. Wait for it to finish %1', 'success', 1000)
                Wait(2000)
                QBCore.Functions.Notify('You are collecting barley. Wait for it to finish %10', 'success', 1000)
                Wait(2000)
                QBCore.Functions.Notify('You are collecting barley. Wait for it to finish %20', 'success', 1000)
                Wait(2000)
                QBCore.Functions.Notify('You are collecting barley. Wait for it to finish %30', 'success', 1000)
                Wait(2000)
                QBCore.Functions.Notify('You are collecting barley. Wait for it to finish %40', 'success', 1000)
                Wait(2000)
                QBCore.Functions.Notify('You are collecting barley. Wait for it to finish %50', 'success', 1000)
                Wait(2000)
                QBCore.Functions.Notify('You are collecting barley. Wait for it to finish %60', 'success', 1000)
                Wait(2000)
                QBCore.Functions.Notify('You are collecting barley. Wait for it to finish %70', 'success', 1000)
                Wait(2000)
                QBCore.Functions.Notify('You are collecting barley. Wait for it to finish %80', 'success', 1000)
                Wait(2000)
                QBCore.Functions.Notify('You are collecting barley. Wait for it to finish %90', 'success', 1000)
                Wait(2000)
                QBCore.Functions.Notify('You are collecting barley. Wait for it to finish %100', 'success', 1000)
                Wait(2000)
                TriggerServerEvent('moonshine:server:harvestbarley')
                QBCore.Functions.Notify('You have harvested barley ', 'success', 5000)
            end)
        else
            QBCore.Functions.Notify('You dont have the right ingredients', 'error', 5000)
        end
        ClearPedTasks(playerPed)
end)

exports['qb-target']:AddBoxZone("harvestbarley", vector3(2511.74, 4834.43, 35.58), 100.0, 145.0, {
	name = "harvestbarley",
	heading = 226.83,
	debugPoly = false,
	minZ = 1.77834,
	maxZ = 300.87834,
}, {
	options = {
		{
            type = "client",
            event = "moonshine:client:harvestbarley",
			icon = "fas fa-sign-in-alt",
			label = "Harvest Barley",
            job = "moonshiner",
		},
	},
	distance = 10.5
})

exports['qb-target']:AddBoxZone("harvestbarley2", vector3(2555.13, 4792.88, 32.93), 40.0, 40.0, {
	name = "harvestbarley2",
	heading = 220.48,
	debugPoly = false,
	minZ = 1.77834,
	maxZ = 300.87834,
}, {
	options = {
		{
            type = "client",
            event = "moonshine:client:harvestbarley",
			icon = "fas fa-sign-in-alt",
			label = "Harvest Barley",
            job = "moonshiner",
		},
	},
	distance = 10.5
})






--Moonshine cooking event



RegisterNetEvent('moonshine:client:moonshineharvest', function(harvestdrug)
    local playerPed = PlayerPedId()
    local hasItem = QBCore.Functions.HasItem('rubbingalcohol')
    local hasItem2 = QBCore.Functions.HasItem('barley')
    local animDict = "anim@amb@business@meth@meth_monitoring_cooking@cooking@"
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Wait(10) end
    Wait(10)
    if hasItem and hasItem2 then
        TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_ATM", 0, false)
        TriggerServerEvent("moonshineharvest:removeItem", 'rubbingalcohol', 1)
        TriggerServerEvent("moonshineharvest:removeItem", 'barley', 1)
        QBCore.Functions.Progressbar('You start to ', ' You are cooking moonshine ', 7000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true
            }, {}, {}, {}, function()
                QBCore.Functions.Notify('you started the cooking process. Wait for it to finish %1', 'success', 2500)
                Wait(5000)
                QBCore.Functions.Notify('you started the cooking process. Wait for it to finish %10', 'success', 2500)
                Wait(5000)
                QBCore.Functions.Notify('you started the cooking process. Wait for it to finish %20', 'success', 2500)
                Wait(5000)
                QBCore.Functions.Notify('you started the cooking process. Wait for it to finish %30', 'success', 2500)
                Wait(5000)
                QBCore.Functions.Notify('you started the cooking process. Wait for it to finish %40', 'success', 2500)
                Wait(5000)
                QBCore.Functions.Notify('you started the cooking process. Wait for it to finish %50', 'success', 2500)
                Wait(5000)
                QBCore.Functions.Notify('you started the cooking process. Wait for it to finish %60', 'success', 2500)
                Wait(5000)
                QBCore.Functions.Notify('you started the cooking process. Wait for it to finish %70', 'success', 2500)
                Wait(5000)
                QBCore.Functions.Notify('you started the cooking process. Wait for it to finish %80', 'success', 2500)
                Wait(5000)
                QBCore.Functions.Notify('you started the cooking process. Wait for it to finish %90', 'success', 2500)
                Wait(5000)
                QBCore.Functions.Notify('you started the cooking process. Wait for it to finish %100', 'success', 2500)
                Wait(3000)
                TriggerServerEvent('moonshine:server:moonshineharvest')
                QBCore.Functions.Notify('You have cooked a case of moonshine ', 'success', 5000)
            end)
        else
            QBCore.Functions.Notify('You dont have the right ingredients', 'error', 5000)
        end
        ClearPedTasks(playerPed)
end)

exports['qb-target']:AddBoxZone("moonshineharvesting", vector3(2433.57, 4969.04, 42.35), 3.0, 3.0, {
	name = "moonshineharvesting",
	heading = 43.61,
	debugPoly = false,
	minZ = 1.77834,
	maxZ = 300.87834,
}, {
	options = {
		{
            type = "client",
            event = "moonshine:client:moonshineharvest",
			icon = "fas fa-sign-in-alt",
			label = "Cook Moonshine",
            job = "moonshiner",
		},
	},
	distance = 2.5
})






--Moonshine effects and consumables piece



function MoonshineEffect()
    local startStamina = 8
    DrunkEffect()
    SetRunSprintMultiplierForPlayer(PlayerId(), 0.7)
    while startStamina > 0 do
        Wait(1000)
        if math.random(5, 15) < 10 then
            RestorePlayerStamina(PlayerId(), 1.0)
        end
        startStamina = startStamina - 1
        if math.random(5, 25) < 20 then
            return
        end
    end
    SetRunSprintMultiplierForPlayer(PlayerId(), 0.5)
end

function DrunkEffect()
    local playerPed = PlayerPedId()
    StartScreenEffect("DrugsDrivingIn", 6.0, true)
    --Wait(3000)
    StartScreenEffect("ChopVision", 6.0, true)
    --Wait(3000)
	StartScreenEffect("DeathFailMPDark", 6.0, true)
    --Wait(3000)
    SetCamEffect(2)
    --Wait(3000)
    ShakeCam(DRUNK_SHAKE, 1, 9)
    --Wait(3000)
    ShakeCam(JOLT_SHAKE, 1, 9)
    Wait(10000)
    SetPedMovementClipset(playerPed, "MOVE_M@DRUNK@VERYDRUNK", 5.0)
    StartScreenEffect("PPPinkOut", 3.0, 0)
	StopScreenEffect("DrugsDrivingIn")
	StopScreenEffect("ChopVision")
	StopScreenEffect("DeathFailMPDark")
    StopScreenEffect("PPPinkOut")
    SetCamEffect(0)
end

RegisterNetEvent('moonshine:client:DrinkShine', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"whiskey"})
    TriggerServerEvent("moonshineharvest:removeItem", 'moonshinejar', 1)
    QBCore.Functions.Progressbar("drink_moonshine", "Drinking moonshine..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() --Done
        MoonshineEffect()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesAlcohol[itemName])
        alcoholCount = alcoholCount + 1
        if alcoholCount > 1 and alcoholCount < 2 then
            TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
        elseif alcoholCount >= 2 then
            TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200)
        end
    end, function() -- Cancel
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        QBCore.Functions.Notify("Cancelled..", "error")
    end)
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
end)

RegisterNetEvent('moonshine:client:openStash')
AddEventHandler('moonshine:client:openStash', function()
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "MoonshineStash", {maxweight = 1000000, slots = 450})
    TriggerEvent("inventory:client:SetCurrentStash", "MoonshineStash")
end)

exports['qb-target']:AddBoxZone("MoonshineStash", vector3(2431.48, 4970.66, 42.35), 6.0, 6.0, {
	name = "MoonshineStash",
	heading = 46.41,
	debugPoly = false,
	minZ = 1.77834,
	maxZ = 300.87834,
}, {
	options = {
		{
            type = "client",
            event = "moonshine:client:openStash",
			icon = "fas fa-sign-in-alt",
			label = "Moonshine Stash",
            job = "moonshiner",
		},
	},
	distance = 2.5
})

RegisterNetEvent('moonshine:client:deliverymission', function()
    local vehicle = 'airflow'
    local model = GetHashKey(model)
    local ped = PlayerPedId()
    local coords = vector3(2457.93, 4953.18, 45.15)
    QBCore.Functions.Progressbar('name_here', 'Receiving a new order ', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'misscarsteal4@actor',
        anim = 'actor_berating_loop',
        flags = 16,
    }, {}, {}, function()
        ClearPedTasks(PlayerPedId())

        Wait(Config.DeliveryWait)

        QBCore.Functions.Notify('The delivery request has been recived, now go at location in your map and give it to the customer', 'primary', 7500)
        TriggerServerEvent('moonshine:server:additem')
        ExportDeliveryTarget()
        end)

        local model = 'airflow'
        local player = PlayerPedId()
        QBCore.Functions.SpawnVehicle(model, function(vehicle)
            SetEntityHeading(vehicle, 223.29)
            TaskWarpPedIntoVehicle(player, vehicle, -1)
            TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
            SetVehicleEngineOn(vehicle, true, true)
            SpawnVehicle = true
        end, vector4(2468.56, 4955.81, 45.11, 223.29), true)
        Wait(1000)
        TaskWarpPedIntoVehicle(player, model, -1)
        local vehicle = GetVehiclePedIsIn(player, false)
        local vehicleLabel = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
        vehicleLabel = GetLabelText(vehicleLabel)
        local plate = GetVehicleNumberPlateText(vehicle)
        --TriggerServerEvent('qb-rental:rentalpapers', plate, vehicleLabel, money)
        --SpawnGuards()
        --TriggerServerEvent('QBCore:Server:AddItem', "meth_jobrecive", 1)
end)


RegisterNetEvent('moonshine:client:GiveKeys', function(id)
    local targetVehicle = 'airflow'

    if targetVehicle then
        local targetPlate = QBCore.Functions.GetPlate(targetVehicle)
        if HasKeys(targetPlate) then
            if id ~= nil then -- Give keys to specific ID
                GiveKeys(id, targetPlate)
            else
                if IsPedSittingInVehicle(PlayerPedId(), targetVehicle) then -- Give keys to everyone in vehicle
                    local otherOccupants = GetOtherPlayersInVehicle(targetVehicle)
                    for p=1,#otherOccupants do
                        TriggerServerEvent('qb-vehiclekeys:server:GiveVehicleKeys', GetPlayerServerId(NetworkGetPlayerIndexFromPed(otherOccupants[p])), targetPlate)
                    end
                else -- Give keys to closest player
                    GiveKeys(GetPlayerServerId(QBCore.Functions.GetClosestPlayer()), targetPlate)
                end
            end
        else
            QBCore.Functions.Notify("You don't have keys to this vehicle.", 'error')
        end
    end
end)

RegisterNetEvent('moonshine:client:delivermoonshine', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"knock"})
    QBCore.Functions.Progressbar('knock_door', 'Knocking on the door', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
    QBCore.Functions.Notify('You delivered the moonshine. Go get paid ', 'primary', 7500)

    TriggerServerEvent('moonshine:server:delivermoonshine')
    end)
end)

RegisterNetEvent('moonshine:client:sellshine', function(itemName)
    local hasItem = QBCore.Functions.HasItem('moonshinejar')
    local playerPed = PlayerPedId()
    if hasItem then
        TriggerServerEvent("moonshine:server:sellproduct")
        --TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_ATM", 0, false)
    else
        QBCore.Functions.Notify('You dont have any moonshine jars', 'error', 5000)
    end
    ClearPedTasks(playerPed)
end)

RegisterNetEvent('moonshine:client:getpaid', function()
    local playerPed = PlayerPedId()
    local hasItem = QBCore.Functions.HasItem('deliveryreceipt')
    if hasItem then
        TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
        QBCore.Functions.Progressbar('cashing_ticket', 'Cashing order ticket ', 5000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
            QBCore.Functions.Notify('You have turned in your receipt and got paid ', 'success', 5000)

        TriggerServerEvent('moonshine:server:getpaid')
        end)
    else
        QBCore.Functions.Notify('You dont have a delivery receipt ', 'error', 5000)
    end
end)

exports['qb-target']:AddBoxZone("moonshinedelivery", vector3(2428.77, 4969.39, 42.35), 6.0, 6.0, {
	name = "moonshinedelivery",
	heading = 132.29,
	debugPoly = false,
	minZ = 1.77834,
	maxZ = 300.87834,
}, {
	options = {
		{
            type = "client",
            event = "moonshine:client:deliverymission",
			icon = "fas fa-sign-in-alt",
			label = "Moonshine Delivery",
            job = "moonshiner",
		},
	},
	distance = 2.5
})

exports['qb-target']:AddBoxZone("getpaid", vector3(2431.55, 4963.89, 42.35), 6.0, 6.0, {
	name = "getpaid",
	heading = 136.17,
	debugPoly = false,
	minZ = 1.77834,
	maxZ = 300.87834,
}, {
	options = {
		{
            type = "client",
            event = "moonshine:client:getpaid",
			icon = "fas fa-sign-in-alt",
			label = "Turn in order slip",
            job = "moonshiner",
		},
	},
	distance = 2.5
})

CreateThread(function()
    RequestModel(`g_m_m_armboss_01`)
      while not HasModelLoaded(`g_m_m_armboss_01`) do
      Wait(1)
    end
      MethLabsKeyPed = CreatePed(2, `g_m_m_armboss_01`, Config.PedLoc, false, false)
      SetPedFleeAttributes(MethLabsKeyPed, 0, 0)
      SetPedDiesWhenInjured(MethLabsKeyPed, false)
      TaskStartScenarioInPlace(MethLabsKeyPed, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)
      SetPedKeepTask(MethLabsKeyPed, true)
      SetBlockingOfNonTemporaryEvents(MethLabsKeyPed, true)
      SetEntityInvincible(MethLabsKeyPed, true)
      FreezeEntityPosition(MethLabsKeyPed, true)

    exports['qb-target']:AddBoxZone("Moonshinesellped", Config.PedTargetLoc, 1, 1, {
        name="Moonshinesellped",
        heading = 256.19,
        debugpoly = false,
    }, {
        options = {
            {
                type = "client",
                event = "moonshine:client:sellshine",
                icon = "fas fa-box",
                label = "Talk to this guy",
            },
        },
        distance = 1.5
    })
end)




--Delivery Locations Chance

function ExportDeliveryTarget()
    local prob = math.random(1, 10)

    if prob == 1 then
        SetNewWaypoint(Config.DeliveryLoc1)
        ExportDeliveryTarget1()
    elseif prob == 2 then
        SetNewWaypoint(Config.DeliveryLoc2)
        ExportDeliveryTarget2()
    elseif prob == 3 then
        SetNewWaypoint(Config.DeliveryLoc3)
        ExportDeliveryTarget3()
    elseif prob == 4 then
        SetNewWaypoint(Config.DeliveryLoc4)
        ExportDeliveryTarget4()
    elseif prob == 5 then
        SetNewWaypoint(Config.DeliveryLoc5)
        ExportDeliveryTarget5()
    elseif prob == 6 then
        SetNewWaypoint(Config.DeliveryLoc6)
        ExportDeliveryTarget6()
    elseif prob == 7 then
        SetNewWaypoint(Config.DeliveryLoc7)
        ExportDeliveryTarget7()
    elseif prob == 8 then
        SetNewWaypoint(Config.DeliveryLoc8)
        ExportDeliveryTarget8()
    elseif prob == 9 then
        SetNewWaypoint(Config.DeliveryLoc9)
        ExportDeliveryTarget9()
    elseif prob == 10 then
        SetNewWaypoint(Config.DeliveryLoc10)
        ExportDeliveryTarget10()
    end
end


--Target Exports

function ExportDeliveryTarget1()
    exports['qb-target']:AddBoxZone("delivery_box", Config.DeliveryLoc1, 1, 1, {
        name="delivery_box",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "moonshine:client:delivermoonshine",
            icon = "far fa-box",
            label = "Knock Door",
            item = "moonshinecase",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget2()
    exports['qb-target']:AddBoxZone("delivery_box", Config.DeliveryLoc2, 1, 1, {
        name="delivery_box",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "moonshine:client:delivermoonshine",
            icon = "far fa-box",
            label = "Knock Door",
            item = "moonshinecase",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget3()
    exports['qb-target']:AddBoxZone("delivery_box", Config.DeliveryLoc3, 1, 1, {
        name="delivery_box",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "moonshine:client:delivermoonshine",
            icon = "far fa-box",
            label = "Knock Door",
            item = "moonshinecase",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget4()
    exports['qb-target']:AddBoxZone("delivery_box", Config.DeliveryLoc4, 1, 1, {
        name="delivery_box",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "moonshine:client:delivermoonshine",
            icon = "far fa-box",
            label = "Knock Door",
            item = "moonshinecase",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget5()
    exports['qb-target']:AddBoxZone("delivery_box", Config.DeliveryLoc5, 1, 1, {
        name="delivery_box",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "moonshine:client:delivermoonshine",
            icon = "far fa-box",
            label = "Knock Door",
            item = "moonshinecase",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget6()
    exports['qb-target']:AddBoxZone("delivery_box", Config.DeliveryLoc6, 1, 1, {
        name="delivery_box",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "moonshine:client:delivermoonshine",
            icon = "far fa-box",
            label = "Knock Door",
            item = "moonshinecase",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget7()
    exports['qb-target']:AddBoxZone("delivery_box", Config.DeliveryLoc7, 1, 1, {
        name="delivery_box",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "moonshine:client:delivermoonshine",
            icon = "far fa-box",
            label = "Knock Door",
            item = "moonshinecase",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget8()
    exports['qb-target']:AddBoxZone("delivery_box", Config.DeliveryLoc8, 1, 1, {
        name="delivery_box",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "moonshine:client:delivermoonshine",
            icon = "far fa-box",
            label = "Knock Door",
            item = "moonshinecase",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget9()
    exports['qb-target']:AddBoxZone("delivery_box", Config.DeliveryLoc9, 1, 1, {
        name="delivery_box",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "moonshine:client:delivermoonshine",
            icon = "far fa-box",
            label = "Knock Door",
            item = "moonshinecase",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget10()
    exports['qb-target']:AddBoxZone("delivery_box", Config.DeliveryLoc10, 1, 1, {
        name="delivery_box",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "moonshine:client:delivermoonshine",
            icon = "far fa-box",
            label = "Knock Door",
            item = "moonshinecase",
            },
        },
        distance = 2.5
    })
end




RegisterNetEvent('mooneshine:client:receivepayment', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('get_paid', 'Cashing check... ', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()

        TriggerServerEvent('moonshine:server:getpaid')
    end)
end)



--Blips

CreateThread(function()
    local c = Config.Locations["moonshine"]
    local Blip = AddBlipForCoord(c.x, c.y, c.z)
    SetBlipSprite (Blip, 671)
	SetBlipAsFriendly(Blip, true)
    SetBlipDisplay(Blip, 2)
    SetBlipScale  (Blip, 0.7)
    SetBlipAsShortRange(Blip, true)
    SetBlipColour(Blip, 49)
    SetBlipAlpha(Blip, 0.7)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Moonshine Job")
    EndTextCommandSetBlipName(Blip)
end)