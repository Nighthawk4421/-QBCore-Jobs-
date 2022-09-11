local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('truckerjob:client:openStash')
AddEventHandler('truckerjob:client:openStash', function()
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "TruckerJobStash", {maxweight = 1000000, slots = 150})
    TriggerEvent("inventory:client:SetCurrentStash", "TruckerJobStash")
end)

exports['qb-target']:AddBoxZone("TruckerJobStash", vector3(72.23, 154.7, 80.53), 5.45, 5.35, {
	name = "TruckerJobStash",
	heading = 67.71,
	debugPoly = false,
	minZ = 1.77834,
	maxZ = 338.87834,
}, {
	options = {
		{
            type = "client",
            event = "truckerjob:client:openStash",
			icon = "fas fa-sign-in-alt",
			label = "Stash",
			job = "trucker",
		},
	},
	distance = 2.5
})

RegisterNetEvent('warehousejob:client:openStash')
AddEventHandler('warehousejob:client:openStash', function()
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "WarehouseJobStash", {maxweight = 1000000, slots = 150})
    TriggerEvent("inventory:client:SetCurrentStash", "WarehouseJobStash")
end)

exports['qb-target']:AddBoxZone("WarehouseJobStash", vector3(58.3, 156.08, 80.53), 5.45, 5.35, {
	name = "WarehouseJobStash",
	heading = 74.53,
	debugPoly = false,
	minZ = 1.77834,
	maxZ = 338.87834,
}, {
	options = {
		{
            type = "client",
            event = "warehousejob:client:openStash",
			icon = "fas fa-sign-in-alt",
			label = "Stash",
			job = "warehouse",
		},
	},
	distance = 2.5
})



CreateThread(function()
    local c = Config.WarehouseLocations["postop"]
    local Blip = AddBlipForCoord(c.x, c.y, c.z)
    SetBlipSprite (Blip, 615)
	SetBlipAsFriendly(Blip, true)
    SetBlipDisplay(Blip, 2)
    SetBlipScale  (Blip, 0.7)
    SetBlipAsShortRange(Blip, true)
    SetBlipColour(Blip, 67)
    SetBlipAlpha(Blip, 0.7)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Go Postal City Distribution Center")
    EndTextCommandSetBlipName(Blip)
end)

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

--Warehouse stocking Event

RegisterNetEvent('truckerjob:client:stackpackage', function()
    local ped = PlayerPedId()
    local hasItem = QBCore.Functions.HasItem('storagelabel')
    if hasItem then
        QBCore.Functions.Progressbar('truckerjob_delivery', 'Putting package on the shelf ', 10000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = true,
            disableCombat = true,
        },  {
            animDict = 'misscarsteal4@actor',
            anim = 'actor_berating_loop',
            flags = 16,
        }, {}, {}, function()
            ClearPedTasks(PlayerPedId())
    
            --Wait(Config.Stockwait)
    
            QBCore.Functions.Notify('You have stored the box ', 'success', 10000)
            TriggerServerEvent('truckerjob:server:warehousegetpaid')
            TriggerServerEvent('truckerjob:server:removestoragelabel')
        end)
    else
        QBCore.Functions.Notify('You dont have a storage label. Go get one from you supervisor', 'error', 7500)
    end
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
end)

RegisterNetEvent('truckerjob:client:warehousestock', function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    
    TriggerServerEvent('truckerjob:server:givestoragelabel')
    TriggerEvent('animations:client:EmoteCommandStart', {"box"})
    ExportStackTarget()
end)

CreateThread(function()
    RequestModel(`s_m_m_ups_01`) do
        while not HasModelLoaded(`s_m_m_ups_01`) do
            Wait(1)
        end
    end
    local WarehouseSupervisorPed = CreatePed(2, `s_m_m_ups_01`, Config.WarehousePedLoc, false, false)
    SetPedFleeAttributes(WarehouseSupervisorPed, 0, 0)
    SetPedDiesWhenInjured(WarehouseSupervisorPed, false)
    TaskStartScenarioInPlace(WarehouseSupervisorPed, "WORLD_HUMAN_CLIPBOARD", 0, true)
    SetPedKeepTask(WarehouseSupervisorPed, true)
    SetBlockingOfNonTemporaryEvents(WarehouseSupervisorPed, true)
    SetEntityInvincible(WarehouseSupervisorPed, true)
    FreezeEntityPosition(WarehouseSupervisorPed, true)
    
    exports['qb-target']:AddBoxZone("warehousesupervisorped", Config.WarehousePedLoc, 3, 3, {
        name = "warehousesupervisorped",
        heading = 157.12,
        debugpoly = false,
    }, {
        options = {
            {
                type = "client",
                event = "truckerjob:client:warehousestock",
                icon = "fas fa-box",
                label = "Get a package for stock ",
                job = "warehouse",
            },
        },
        distance = 1.5
    })
end)

function ExportStackTarget1()
    exports['qb-target']:AddBoxZone("delivery_box", Config.StackLoc1, 3, 3, {
        name="delivery_box",
        heading=0,
        debugpoly = true,
        minZ = 1.77834,
	    maxZ = 300.87834,
    }, {
        options = {
            {
            event = "truckerjob:client:stackpackage",
            icon = "far fa-box",
            label = "Stack Box",
            item = 'storagelabel',
            job = "warehouse",
            },
        },
        distance = 2.5
    })
end

function ExportStackTarget2()
    exports['qb-target']:AddBoxZone("delivery_box", Config.StackLoc2, 3, 3, {
        name="delivery_box",
        heading=0,
        debugpoly = true,
        minZ = 1.77834,
	    maxZ = 300.87834,
    }, {
        options = {
            {
            event = "truckerjob:client:stackpackage",
            icon = "far fa-box",
            label = "Stack Box",
            item = 'storagelabel',
            job = "warehouse",
            },
        },
        distance = 2.5
    })
end

function ExportStackTarget3()
    exports['qb-target']:AddBoxZone("delivery_box", Config.StackLoc3, 3, 3, {
        name="delivery_box",
        heading=0,
        debugpoly = true,
        minZ = 1.77834,
	    maxZ = 300.87834,
    }, {
        options = {
            {
            event = "truckerjob:client:stackpackage",
            icon = "far fa-box",
            label = "Stack Box",
            item = 'storagelabel',
            job = "warehouse",
            },
        },
        distance = 2.5
    })
end

function ExportStackTarget4()
    exports['qb-target']:AddBoxZone("delivery_box", Config.StackLoc4, 3, 3, {
        name="delivery_box",
        heading=0,
        debugpoly = true,
        minZ = 1.77834,
	    maxZ = 300.87834,
    }, {
        options = {
            {
            event = "truckerjob:client:stackpackage",
            icon = "far fa-box",
            label = "Stack Box",
            item = 'storagelabel',
            job = "warehouse",
            },
        },
        distance = 2.5
    })
end

function ExportStackTarget5()
    exports['qb-target']:AddBoxZone("delivery_box", Config.StackLoc5, 3, 3, {
        name="delivery_box",
        heading=0,
        debugpoly = true,
        minZ = 1.77834,
	    maxZ = 300.87834,
    }, {
        options = {
            {
            event = "truckerjob:client:stackpackage",
            icon = "far fa-box",
            label = "Stack Box",
            item = 'storagelabel',
            job = "warehouse",
            },
        },
        distance = 2.5
    })
end

function ExportStackTarget6()
    exports['qb-target']:AddBoxZone("delivery_box", Config.StackLoc6, 3, 3, {
        name="delivery_box",
        heading=0,
        debugpoly = true,
        minZ = 1.77834,
	    maxZ = 300.87834,
    }, {
        options = {
            {
            event = "truckerjob:client:stackpackage",
            icon = "far fa-box",
            label = "Stack Box",
            item = 'storagelabel',
            job = "warehouse",
            },
        },
        distance = 2.5
    })
end

function ExportStackTarget7()
    exports['qb-target']:AddBoxZone("delivery_box", Config.StackLoc7, 3, 3, {
        name="delivery_box",
        heading=0,
        debugpoly = true,
        minZ = 1.77834,
	    maxZ = 300.87834,
    }, {
        options = {
            {
            event = "truckerjob:client:stackpackage",
            icon = "far fa-box",
            label = "Stack Box",
            item = 'storagelabel',
            job = "warehouse",
            },
        },
        distance = 2.5
    })
end

function ExportStackTarget8()
    exports['qb-target']:AddBoxZone("delivery_box", Config.StackLoc8, 3, 3, {
        name="delivery_box",
        heading=0,
        debugpoly = true,
        minZ = 1.77834,
	    maxZ = 300.87834,
    }, {
        options = {
            {
            event = "truckerjob:client:stackpackage",
            icon = "far fa-box",
            label = "Stack Box",
            item = 'storagelabel',
            job = "warehouse",
            },
        },
        distance = 2.5
    })
end

function ExportStackTarget9()
    exports['qb-target']:AddBoxZone("delivery_box", Config.StackLoc9, 3, 3, {
        name="delivery_box",
        heading=0,
        debugpoly = true,
        minZ = 1.77834,
	    maxZ = 300.87834,
    }, {
        options = {
            {
            event = "truckerjob:client:stackpackage",
            icon = "far fa-box",
            label = "Stack Box",
            item = 'storagelabel',
            job = "warehouse",
            },
        },
        distance = 2.5
    })
end

function ExportStackTarget10()
    exports['qb-target']:AddBoxZone("delivery_box", Config.StackLoc10, 3, 3, {
        name="delivery_box",
        heading=0,
        debugpoly = true,
        minZ = 1.77834,
	    maxZ = 300.87834,
    }, {
        options = {
            {
            event = "truckerjob:client:stackpackage",
            icon = "far fa-box",
            label = "Stack Box",
            item = 'storagelabel',
            job = "warehouse",
            },
        },
        distance = 2.5
    })
end

function ExportStackTarget()
    local prob = math.random(1, 10)

    if prob == 1 then
        SetNewWaypoint(Config.StackLoc1)
        ExportStackTarget1()
    elseif prob == 2 then
        SetNewWaypoint(Config.StackLoc2)
        ExportStackTarget2()
    elseif prob == 3 then
        SetNewWaypoint(Config.StackLoc3)
        ExportStackTarget3()
    elseif prob == 4 then
        SetNewWaypoint(Config.StackLoc4)
        ExportStackTarget4()
    elseif prob == 5 then
        SetNewWaypoint(Config.StackLoc5)
        ExportStackTarget5()
    elseif prob == 6 then
        SetNewWaypoint(Config.StackLoc6)
        ExportStackTarget6()
    elseif prob == 7 then
        SetNewWaypoint(Config.StackLoc7)
        ExportStackTarget7()
    elseif prob == 8 then
        SetNewWaypoint(Config.StackLoc8)
        ExportStackTarget8()
    elseif prob == 9 then
        SetNewWaypoint(Config.StackLoc9)
        ExportStackTarget9()
    elseif prob == 10 then
        SetNewWaypoint(Config.StackLoc10)
        ExportStackTarget10()
    end
end
--Delivery Mission Event

RegisterNetEvent('truckerjob:client:deliveryjob', function()
    local vehicle = 'boxville2'
    local model = 'boxville2'
    local player = PlayerPedId()

    TriggerEvent('animations:client:EmoteCommandStart', {"tablet2"})
    QBCore.Functions.Progressbar('truckerjob_delivery', 'Receiving order from dispatch ', 10000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = true,
        disableCombat = true,
    },  {
        animDict = 'misscarsteal4@actor',
        anim = 'actor_berating_loop',
        flags = 16,
    }, {}, {}, function()

        Wait(Config.DeliveryWait)

        QBCore.Functions.Notify('Dispatch has sent you a new order. Go to the location marked on the instructions on your map and deliver the product', 'primary', 10000)
        TriggerServerEvent('truckerjob:server:additem')
        ExportDeliveryTarget()
    end)
    Wait(10000)
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    
    QBCore.Functions.SpawnVehicle(model, function(vehicle)
        SetEntityHeading(vehicle, 163.08)
        TaskWarpPedIntoVehicle(player, vehicle, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
        SetVehicleEngineOn(vehicle, true, true)
        SpawnVehicle = true
    end, vector4(66.83, 123.77, 79.16, 163.08), true)
end)


RegisterNetEvent('truckerjob:client:deliverpackage', function()
    local playerPed = PlayerPedId()
    local animDict = 'amb@code_human_in_bus_passenger_idles@female@tablet@idle_a'
    QBCore.Functions.Notify('Recording your stop in the system', 'primary', 5000)
    TriggerEvent('animations:client:EmoteCommandStart', {"tablet2"})
    QBCore.Functions.Notify('Scanning packages in ', 'primary', 5000)
    TaskStartScenarioInPlace(playerPed, "prop_cs_tablet", 0, false)
    QBCore.Functions.Progressbar('deliver_package', 'Delivering the freight ', 10000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
    QBCore.Functions.Notify('You have delivered the freight. Please report back to your supervisor to get paid', 'primary', 7500)
    TriggerServerEvent('truckerjob:server:deliverpackage')
    QBCore.Functions.Notify('You have delivered the packages successfully ', 'success', 5000)
    SetNewWaypoint(Config.WarehouseGPSLocations)

    end)
    Wait(10000)
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
end)


RegisterNetEvent('truckerjob:client:getpaid', function()
    local playerPed = PlayerPedId()
    local hasItem = QBCore.Functions.HasItem('deliveryreceipt')
    
    if hasItem then
        TriggerEvent('animations:client:EmoteCommandStart', {"tablet2"})
        QBCore.Functions.Progressbar('name_here', 'Turning in your delivery slip ', 10000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
            QBCore.Functions.Notify('You have turned in your slip and got your paycheck ', 'success', 9000)
            TriggerServerEvent('truckerjob:server:getpaid')
        end)
    else
        QBCore.Functions.Notify('You dont have a delivery slip to turn in', 'error', 9000)
    end
    Wait(10000)
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
end)




--Supervisor spawn ped thread


CreateThread(function()
    RequestModel(`s_m_m_ups_01`) do
        while not HasModelLoaded(`s_m_m_ups_01`) do
            Wait(1)
        end
    end
    local DeliveryTruckSupervisorPed = CreatePed(2, `s_m_m_ups_01`, Config.DeliveryPedLoc, false, false)
    SetPedFleeAttributes(DeliveryTruckSupervisorPed, 0, 0)
    SetPedDiesWhenInjured(DeliveryTruckSupervisorPed, false)
    TaskStartScenarioInPlace(DeliveryTruckSupervisorPed, "WORLD_HUMAN_CLIPBOARD", 0, true)
    SetPedKeepTask(DeliveryTruckSupervisorPed, true)
    SetBlockingOfNonTemporaryEvents(DeliveryTruckSupervisorPed, true)
    SetEntityInvincible(DeliveryTruckSupervisorPed, true)
    FreezeEntityPosition(DeliveryTruckSupervisorPed, true)
    
    exports['qb-target']:AddBoxZone("Truckerjobsupervisorped", Config.DeliveryPedLoc,  3, 3, {
        name = "truckdeliverysupervisor",
        heading = 149.28,
        debugpoly = false,
    }, {
        options = {
            {
                type = "client",
                event = "truckerjob:client:getpaid",
                icon = "fas fa-box",
                label = "Turn in slip to supervisor",
                job = "trucker",
            },
        },
        distance = 1.5
    })
end)





--Target interactions for delivery points

function ExportDeliveryTarget1()
    exports['qb-target']:AddBoxZone("delivery_box", Config.DeliveryLoc1, 3, 3, {
        name = "delivery_box",
        heading = 28.68,
        debugpoly = true,
    }, {
        options = {
            {
            event = "truckerjob:client:deliverpackage",
            icon = "far fa-box",
            label = "Knock Door",
            item = "deliverypackages",
            job = "trucker",
            },
        },
        distance = 4.5
    })
end

function ExportDeliveryTarget2()
    exports['qb-target']:AddBoxZone("delivery_box", Config.DeliveryLoc2, 3, 3, {
        name = "delivery_box",
        heading = 138.48,
        debugpoly = true,
    }, {
        options = {
            {
            event = "truckerjob:client:deliverpackage",
            icon = "far fa-box",
            label = "Knock Door",
            item = "deliverypackages",
            job = "trucker",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget3()
    exports['qb-target']:AddBoxZone("delivery_box", Config.DeliveryLoc3, 3, 3, {
        name = "delivery_box",
        heading = 159.27,
        debugpoly = true,
    }, {
        options = {
            {
            event = "truckerjob:client:deliverpackage",
            icon = "far fa-box",
            label = "Knock Door",
            item = "deliverypackages",
            job = "trucker",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget4()
    exports['qb-target']:AddBoxZone("delivery_box", Config.DeliveryLoc4, 1, 1, {
        name="delivery_box",
        heading=0,
        debugpoly = true,
    }, {
        options = {
            {
            event = "truckerjob:client:deliverpackage",
            icon = "far fa-box",
            label = "Knock Door",
            item = "deliverypackages",
            job = "trucker",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget5()
    exports['qb-target']:AddBoxZone("delivery_box", Config.DeliveryLoc5, 1, 1, {
        name="delivery_box",
        heading=0,
        debugpoly = true,
    }, {
        options = {
            {
            event = "truckerjob:client:deliverpackage",
            icon = "far fa-box",
            label = "Knock Door",
            item = "deliverypackages",
            job = "trucker",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget6()
    exports['qb-target']:AddBoxZone("delivery_box", Config.DeliveryLoc6, 1, 1, {
        name="delivery_box",
        heading=0,
        debugpoly = true,
    }, {
        options = {
            {
            event = "truckerjob:client:deliverpackage",
            icon = "far fa-box",
            label = "Knock Door",
            item = "deliverypackages",
            job = "trucker",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget7()
    exports['qb-target']:AddBoxZone("delivery_box", Config.DeliveryLoc7, 1, 1, {
        name="delivery_box",
        heading=0,
        debugpoly = true,
    }, {
        options = {
            {
            event = "truckerjob:client:deliverpackage",
            icon = "far fa-box",
            label = "Knock Door",
            item = "deliverypackages",
            job = "trucker",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget8()
    exports['qb-target']:AddBoxZone("delivery_box", Config.DeliveryLoc8, 1, 1, {
        name="delivery_box",
        heading=0,
        debugpoly = true,
    }, {
        options = {
            {
            event = "truckerjob:client:deliverpackage",
            icon = "far fa-box",
            label = "Knock Door",
            item = "deliverypackages",
            job = "trucker",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget9()
    exports['qb-target']:AddBoxZone("delivery_box", Config.DeliveryLoc9, 1, 1, {
        name="delivery_box",
        heading=0,
        debugpoly = true,
    }, {
        options = {
            {
            event = "truckerjob:client:deliverpackage",
            icon = "far fa-box",
            label = "Knock Door",
            item = "deliverypackages",
            job = "trucker",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget10()
    exports['qb-target']:AddBoxZone("delivery_box", Config.DeliveryLoc10, 1, 1, {
        name="delivery_box",
        heading=0,
        debugpoly = true,
    }, {
        options = {
            {
            event = "truckerjob:client:deliverpackage",
            icon = "far fa-box",
            label = "Knock Door",
            item = "deliverypackages",
            job = "trucker",
            },
        },
        distance = 2.5
    })
end



--Target Export for delivery Mission

exports['qb-target']:AddBoxZone("truckerjobdelivery", vector3(77.57, 153.61, 80.53), 2.0, 2.0, {
	name = "truckerjobdelivery",
	heading = 246.92,
	debugPoly = false,
	minZ = 1.77834,
	maxZ = 300.87834,
}, {
	options = {
		{
            type = "client",
            event = "truckerjob:client:deliveryjob",
			icon = "fas fa-sign-in-alt",
			label = "Dispatching System",
            job = "trucker", 
		},
	},
	distance = 2.5
})

--Clock in exports

exports['qb-target']:AddBoxZone("truckerjobclockin", vector3(81.54, 134.6, 80.53), 6.0, 6.0, {
	name = "truckerjobclockin",
	heading = 253.32,
	debugPoly = false,
	minZ = 1.77834,
	maxZ = 301.87834,
}, {
	options = {
		{
            type = "server",
            event = "truckerjob:ToggleDuty",
			icon = "fas fa-sign-in-alt",
			label = "Clock in for work",
            job = "trucker",
		},
	},
	distance = 2.5
})

CreateThread(function()
    RequestModel(`s_m_m_postal_02`) do
        while not HasModelLoaded(`s_m_m_postal_02`) do
            Wait(1)
        end
    end
    local WarehouseClockInSupervisorPed = CreatePed(2, `s_m_m_postal_02`, Config.WarehouseClockInPedLoc, false, false)
    SetPedFleeAttributes(WarehouseClockInSupervisorPed, 0, 0)
    SetPedDiesWhenInjured(WarehouseClockInSupervisorPed, false)
    TaskStartScenarioInPlace(WarehouseClockInSupervisorPed, "WORLD_HUMAN_CLIPBOARD", 0, true)
    SetPedKeepTask(WarehouseClockInSupervisorPed, true)
    SetBlockingOfNonTemporaryEvents(WarehouseClockInSupervisorPed, true)
    SetEntityInvincible(WarehouseClockInSupervisorPed, true)
    FreezeEntityPosition(WarehouseClockInSupervisorPed, true)
    
    exports['qb-target']:AddBoxZone("warehousejobclockin", Config.WarehouseClockInPedLoc,  3, 3, {
        name = "warehousejobclockin",
        heading = 65.51,
        debugpoly = false,
    }, {
        options = {
            {
                type = "server",
                event = "warehousejob:ToggleDuty",
                icon = "fas fa-sign-in-alt",
                label = "Clock in for work",
                job = "warehouse",
            },
        },
        distance = 5.5
    })
end)




--Garage
CreateThread(function()
    RequestModel(`s_m_m_postal_02`) do
        while not HasModelLoaded(`s_m_m_postal_02`) do
            Wait(1)
        end
    end
    local TruckerRentalPedLoc = CreatePed(2, `s_m_m_postal_02`, Config.TruckerRentalPedLoc, false, false)
    SetPedFleeAttributes(TruckerRentalPedLoc, 0, 0)
    SetPedDiesWhenInjured(TruckerRentalPedLoc, false)
    TaskStartScenarioInPlace(TruckerRentalPedLoc, "WORLD_HUMAN_CLIPBOARD", 0, true)
    SetPedKeepTask(TruckerRentalPedLoc, true)
    SetBlockingOfNonTemporaryEvents(TruckerRentalPedLoc, true)
    SetEntityInvincible(TruckerRentalPedLoc, true)
    FreezeEntityPosition(TruckerRentalPedLoc, true)
    
    exports['qb-target']:AddBoxZone("TruckerRentalPedLoc", Config.TruckerRentalPedLoc,  3, 3, {
        name = "TruckerRentalPedLoc",
        heading = 216.25,
        debugpoly = false,
    }, {
        options = {
            {
                type = "client",
                event = "truckerjob:client:renttruck",
                icon = "fas fa-sign-in-alt",
                label = "Check out a truck ",
                job = "trucker",
            },
        },
        distance = 5.5
    })
end)

RegisterNetEvent('truckerjob:client:renttruck', function()
    local vehicle = 'boxville2'
    local model = 'boxville2'
    local player = PlayerPedId()

    TriggerEvent('animations:client:EmoteCommandStart', {"tablet2"})
    ClearAreaOfVehicles(65.59, 120.18, 79.11, 10, false, false, false, false, false)
    QBCore.Functions.Progressbar('truckerjob_delivery', 'Logging vehicle info for the system ', 10000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = true,
        disableCombat = true,
    },  {
        animDict = 'misscarsteal4@actor',
        anim = 'actor_berating_loop',
        flags = 16,
    }, {}, {}, function()

        Wait(Config.ApprovalWait)

        QBCore.Functions.Notify('Your truck rental has been approved ', 'primary', 10000)
        TriggerServerEvent('truckerjob:server:additem')
        ExportDeliveryTarget()
    end)
    Wait(10000)
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    
    QBCore.Functions.SpawnVehicle(model, function(vehicle)
        SetEntityHeading(vehicle, 163.08)
        TaskWarpPedIntoVehicle(player, vehicle, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
        SetVehicleEngineOn(vehicle, true, true)
        SpawnVehicle = true
    end, vector4(65.59, 120.18, 79.11, 161.02), true)
    --ClearAreaOfVehicles(65.59, 120.18, 79.11, 10, false, false, false, false, false)
end)