local QBCore = exports['qb-core']:GetCoreObject()

exports['qb-target']:AddBoxZone("Jackhammerzonepaleto", vector3(98.58, 6543.78, 31.66), 15.45, 15.35, {
	name = "Jackhammerzonepaleto",
	heading = 45.38,
	debugPoly = false,
	minZ = 1.77834,
	maxZ = 338.87834,
}, {
	options = {
		{
            type = "client",
            event = "constructionjob:client:jackHammer",
			icon = "fas fa-sign-in-alt",
			label = "Hammer nails ",
			--job = "construction",
		},
	},
	distance = 2.5
})

RegisterNetEvent('constructionjob:client:jackHammer', function()
    local ped = PlayerPedId()
    local hasItem = QBCore.Functions.HasItem('constructionid')
    if hasItem then
        TaskStartScenarioInPlace(ped, "WORLD_HUMAN_HAMMERING", 0, true)
        QBCore.Functions.Progressbar('truckerjob_delivery', 'Hammering Nails ', 60000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },  {
            --animDict = 'misscarsteal4@actor',
            --anim = 'actor_berating_loop',
            flags = 16,
        }, {}, {}, function()
            ClearPedTasks(PlayerPedId())
    
            --Wait(Config.Stockwait)
    
            QBCore.Functions.Notify('You have made some progress ', 'success', 10000)
            --TriggerServerEvent('truckerjob:server:warehousegetpaid')
            --TriggerServerEvent('truckerjob:server:removestoragelabel')
        end)
    else
        QBCore.Functions.Notify('You dont have a permit. Go get one from you supervisor', 'error', 7500)
    end
end)

RegisterNetEvent('constructionjob:client:inspectSite', function()
    local ped = PlayerPedId()
    local hasItem = QBCore.Functions.HasItem('stateinspectorid')
    local hasItem2 = QBCore.Functions.HasItem('stateconstructionpermit')
    local prob = math.random(1, 2)
    local hasItem3 = QBCore.Functions.HasItem('jobdetails')
    if prob == 1 or hasItem2 and hasItem3 then
        TriggerEvent('animations:client:EmoteCommandStart', {"clipboard"})
        QBCore.Functions.Progressbar('truckerjob_delivery', 'Inspecting the site ', 10000, false, true, {
            disableMovement = false,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },  {
            --animDict = 'misscarsteal4@actor',
            --anim = 'actor_berating_loop',
            flags = 16,
        }, {}, {}, function()
            ClearPedTasks(PlayerPedId())
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            QBCore.Functions.Notify('You pull out your tablet to document your findings ', 'primary', 5000)
            Wait(5000)
            TriggerEvent('animations:client:EmoteCommandStart', {"tablet2"})
    
            --Wait(Config.Stockwait)
            
            QBCore.Functions.Notify('Documenting the progress ', 'success', 30000)
            Wait(30000)
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            QBCore.Functions.Notify('Documentation updated in the system ', 'success', 7500)
            Wait(7500)
            QBCore.Functions.Notify('They have passed the state inspection ', 'success', 7500)
            --TriggerServerEvent('truckerjob:server:warehousegetpaid')
            --TriggerServerEvent('truckerjob:server:removestoragelabel')
        end)
    else
        TriggerEvent('animations:client:EmoteCommandStart', {"clipboard"})
        QBCore.Functions.Progressbar('truckerjob_delivery', 'Inspecting the site ', 10000, false, true, {
            disableMovement = false,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },  {
            --animDict = 'misscarsteal4@actor',
            --anim = 'actor_berating_loop',
            flags = 16,
        }, {}, {}, function()
            ClearPedTasks(PlayerPedId())
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            QBCore.Functions.Notify('You pull out your tablet to document your findings ', 'primary', 5000)
            TriggerEvent('animations:client:EmoteCommandStart', {"tablet2"})
            Wait(5000)
            --Wait(Config.Stockwait)
            
            QBCore.Functions.Notify('Documenting the progress ', 'success', 7500)
            Wait(7500)
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            QBCore.Functions.Notify('Documentation updated in the system ', 'success', 7500)
            Wait(7500)
            QBCore.Functions.Notify('They have failed the state inspection ', 'error', 7500)
            --TriggerServerEvent('truckerjob:server:warehousegetpaid')
            --TriggerServerEvent('truckerjob:server:removestoragelabel')
        end)
    end
end)

exports['qb-target']:AddBoxZone("inspectSite", vector3(71.69, 6574.08, 28.45), 15.45, 15.35, {
	name = "inspectSite",
	heading = 310.3,
	debugPoly = false,
	minZ = 1.77834,
	maxZ = 338.87834,
}, {
	options = {
		{
            type = "client",
            event = "constructionjob:client:inspectSite",
			icon = "fas fa-sign-in-alt",
			label = "Inspect the site ",
			--job = "construction",
		},
	},
	distance = 2.5
})


--Blip creation

CreateThread(function()
    local c = Config.JobSiteLocations["paleto"]
    local Blip = AddBlipForCoord(c.x, c.y, c.z)
    SetBlipSprite (Blip, 615)
	SetBlipAsFriendly(Blip, true)
    SetBlipDisplay(Blip, 2)
    SetBlipScale  (Blip, 0.7)
    SetBlipAsShortRange(Blip, true)
    SetBlipColour(Blip, 67)
    SetBlipAlpha(Blip, 0.7)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Paleto Construction Site #1")
    EndTextCommandSetBlipName(Blip)
end)


--Site Choice 

function ExportBuildSiteTarget()
    local prob = 1

    if prob == 1 then
        SetNewWaypoint(Config.BuildSiteLoc1)
        ExportDeliveryTarget1()
    end
end

function ExportDeliveryTarget1()
    exports['qb-target']:AddBoxZone("delivery_box", vector3(36.05, 6549.17, 31.43), 3, 3, {
        name="delivery_box",
        heading = 0,
        debugpoly = false,
        minZ = 1.77834,
	    maxZ = 300.87834,
    }, {
        options = {
            {
                type = "server",
                event = "construction:ToggleDuty",
                icon = "far fa-box",
                label = "Clock in for work",
                --item = 'constructionid',
            },
        },
        distance = 2.5
    })
end

function ExportSellTarget()
    local prob = 1

    if prob == 1 then
        SetNewWaypoint(Config.SellLoc1)
        ExportSellTarget1()
    end
end

function ExportSellTarget1()
    exports['qb-target']:AddBoxZone("delivery_box", vector3(2768.98, 1391.45, 24.54), 3, 3, {
        name="delivery_box",
        heading = 269.86,
        debugpoly = false,
        minZ = 1.77834,
	    maxZ = 300.87834,
    }, {
        options = {
            {
                type = "server",
                event = "constructionjob:server:sellIronPoles",
                icon = "far fa-box",
                label = "Sell iron poles ",
                item = 'ironpoles',
            },
        },
        distance = 2.5
    })
end

RegisterNetEvent('constructionjob:client:getIronSellLocation', function()
    local ped = PlayerPedId()
    local hasItem = QBCore.Functions.HasItem('ironpoles')
    
    if hasItem then
        QBCore.Functions.Notify('Getting the sell location ', 'primary', 5000)
        Wait(5000)
        QBCore.Functions.Notify('The delivery location has been marked on your map ', 'success', 5000)
        ExportSellTarget()
    else
        QBCore.Functions.Notify('You dont have iron poles to sell ', 'error', 5000)
    end
end)

CreateThread(function()
    RequestModel(`s_m_y_construct_01`) do
        while not HasModelLoaded(`s_m_y_construct_01`) do
            Wait(1)
        end
    end
    local IronPedSellLoc = CreatePed(2, `s_m_y_construct_01`, Config.IronPedSellLoc, false, false)
    SetPedFleeAttributes(IronPedSellLoc, 0, 0)
    SetPedDiesWhenInjured(IronPedSellLoc, false)
    TaskStartScenarioInPlace(IronPedSellLoc, "WORLD_HUMAN_CLIPBOARD", 0, true)
    SetPedKeepTask(IronPedSellLoc, true)
    SetBlockingOfNonTemporaryEvents(IronPedSellLoc, true)
    SetEntityInvincible(IronPedSellLoc, true)
    FreezeEntityPosition(IronPedSellLoc, true)
    
    exports['qb-target']:AddBoxZone("IronPedSellLoc", Config.IronPedSellLoc,  3, 3, {
        name = "IronPedSellLoc",
        heading = 89.68,
        debugpoly = false,
    }, {
        options = {
            {
                type = "client",
                event = "constructionjob:client:getIronSellLocation",
                icon = "fas fa-box",
                label = "Sell iron to the railroad industry ",
                
            },
        },
        distance = 3.5
    })
end)



CreateThread(function()
    RequestModel(`s_m_y_construct_01`) do
        while not HasModelLoaded(`s_m_y_construct_01`) do
            Wait(1)
        end
    end
    local SupervisorPedLoc = CreatePed(2, `s_m_y_construct_01`, Config.SupervisorPedLoc, false, false)
    SetPedFleeAttributes(SupervisorPedLoc, 0, 0)
    SetPedDiesWhenInjured(SupervisorPedLoc, false)
    TaskStartScenarioInPlace(SupervisorPedLoc, "WORLD_HUMAN_CLIPBOARD", 0, true)
    SetPedKeepTask(SupervisorPedLoc, true)
    SetBlockingOfNonTemporaryEvents(SupervisorPedLoc, true)
    SetEntityInvincible(SupervisorPedLoc, true)
    FreezeEntityPosition(SupervisorPedLoc, true)
    
    exports['qb-target']:AddBoxZone("SupervisorPedLoc", Config.SupervisorPedLoc,  3, 3, {
        name = "SupervisorPedLoc",
        heading = 89.68,
        debugpoly = false,
    }, {
        options = {
            {
                type = "client",
                event = "constructionjob:client:getJob",
                icon = "fas fa-box",
                label = "Get your job for the day ",
                
            },
        },
        distance = 1.5
    })
end)

RegisterNetEvent('constructionjob:client:getJob', function()
    local ped = PlayerPedId()
    
    if ped then
        QBCore.Functions.Notify('Receiving job for the day ', 'primary', 5000)
        Wait(5000)
        QBCore.Functions.Notify('You have been assigned to the Paleto Job Site dont forget to grab a work truck and dumptruck ', 'success', 5000)
        ExportBuildSiteTarget()
        TriggerServerEvent('constructionjob:server:giveJobDetails')
    else
        QBCore.Functions.Notify('Who the fuck are you ', 'error', 5000)
    end
end)


--Give ids for work


CreateThread(function()
    RequestModel(`s_m_y_construct_01`) do
        while not HasModelLoaded(`s_m_y_construct_01`) do
            Wait(1)
        end
    end
    local PaletoPedLoc = CreatePed(2, `s_m_y_construct_01`, Config.PaletoPedLoc, false, false)
    SetPedFleeAttributes(PaletoPedLoc, 0, 0)
    SetPedDiesWhenInjured(PaletoPedLoc, false)
    TaskStartScenarioInPlace(PaletoPedLoc, "WORLD_HUMAN_CLIPBOARD", 0, true)
    SetPedKeepTask(PaletoPedLoc, true)
    SetBlockingOfNonTemporaryEvents(PaletoPedLoc, true)
    SetEntityInvincible(PaletoPedLoc, true)
    FreezeEntityPosition(PaletoPedLoc, true)
    
    exports['qb-target']:AddBoxZone("PaletoPedLoc", Config.PaletoPedLoc,  3, 3, {
        name = "PaletoPedLoc",
        heading = 252.5,
        debugpoly = false,
    }, {
        options = {
            {
                type = "client",
                event = "constructionjob:client:giveID",
                icon = "fas fa-box",
                label = "Get your workers ID ",
                job = "construction",
                
            },
        },
        distance = 1.5
    })
end)

RegisterNetEvent('constructionjob:client:giveID', function()
    local ped = PlayerPedId()
    local hasItem2 = QBCore.Functions.HasItem('jobdetails')

    if hasItem2 then
        TriggerServerEvent('constructionjob:server:giveID')
    else
        QBCore.Functions.Notify('You are not authorized to do this ', 'error', 5000)
    end
end)

RegisterNetEvent('constructionjob:client:renttruck', function()
    local workTruck = Config.RentWorkTruck
    local model = Config.RentWorkTruck
    local workTruck2 = Config.ScrapTruck
    local model2 = Config.ScrapTruck
    local player = PlayerPedId()
    local hasItem = QBCore.Functions.HasItem('jobdetails')
    if hasItem then
        TriggerEvent('animations:client:EmoteCommandStart', {"tablet2"})
        QBCore.Functions.Progressbar('truckerjob_delivery', 'Renting workTrucks for the day ', 10000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },  {
            flags = 16,
        }, {}, {}, function()

            QBCore.Functions.Notify('Your truck rental has been approved ', 'primary', 10000)
        end)
        Wait(10000)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        
        QBCore.Functions.SpawnVehicle(model, function(workTruck)
            SetEntityHeading(workTruck, 297.68)
            --TaskWarpPedIntoVehicle(player, workTruck, -1)
            TriggerEvent("workTruckkeys:client:SetOwner", GetVehicleNumberPlateText(workTruck))
            SetVehicleEngineOn(workTruck, true, true)
            SetVehicleExtra(workTruck, 2, 1)
            SetVehicleExtra(workTruck, 3, 1)
            SetVehicleExtra(workTruck, 4, 1)
            exports['LegacyFuel']:SetFuel(veh, 100)
            SpawnVehicle = true
        end, vector4(-98.97, -1028.01, 27.27, 297.68), true)
        QBCore.Functions.SpawnVehicle(model2, function(workTruck2)
            SetEntityHeading(workTruck2, 316.42)
            --TaskWarpPedIntoVehicle(player, workTruck, -1)
            TriggerEvent("workTruckkeys:client:SetOwner", GetVehicleNumberPlateText(workTruck2))
            SetVehicleEngineOn(workTruck2, true, true)
            exports['LegacyFuel']:SetFuel(veh, 100)
            SpawnVehicle = true
        end, vector4(-111.67, -1046.62, 27.27, 316.42), true)
    else
        QBCore.Functions.Notify('You dont have job details... ', 'error', 5000)
    end
end)

exports['qb-target']:AddBoxZone("rentVehicle", vector3(-97.05, -1013.57, 27.28), 7.45, 7.35, {
	name = "rentVehicle",
	heading = 340.4,
	debugPoly = false,
	minZ = 1.77834,
	maxZ = 338.87834,
}, {
	options = {
		{
            type = "client",
            event = "constructionjob:client:renttruck",
			icon = "fas fa-sign-in-alt",
			label = "Rent a truck for the day ",
			job = "construction",
		},
	},
	distance = 1.5
})


exports['qb-target']:AddBoxZone("rebar2", vector3(72.16, 6529.19, 31.57), 1.45, 1.35, {
	name = "rebar2",
	heading = 340.4,
	debugPoly = false,
	minZ = 1.77834,
	maxZ = 338.87834,
}, {
	options = {
		{
            type = "client",
            event = "constructionjob:client:weldRebar",
			icon = "fas fa-sign-in-alt",
			label = "Weld the rebar ",
			job = "construction",
		},
	},
	distance = 1.5
})

exports['qb-target']:AddBoxZone("rebar", vector3(66.39, 6523.32, 31.57), 1.45, 1.35, {
	name = "rebar",
	heading = 340.4,
	debugPoly = false,
	minZ = 1.77834,
	maxZ = 338.87834,
}, {
	options = {
		{
            type = "client",
            event = "constructionjob:client:weldRebar",
			icon = "fas fa-sign-in-alt",
			label = "Weld the rebar ",
			job = "construction",
		},
	},
	distance = 2.5
})


RegisterNetEvent('constructionjob:client:weldRebar', function()
    local ped = PlayerPedId()
    local hasItem = QBCore.Functions.HasItem('constructionid')
    if hasItem then
        TriggerEvent('animations:client:EmoteCommandStart', {"weld"})
        QBCore.Functions.Progressbar('truckerjob_delivery', 'Welding the rebar ', Config.WeldTime, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },  {
            --animDict = 'misscarsteal4@actor',
            --anim = 'actor_berating_loop',
            flags = 16,
        }, {}, {}, function()
    
            --Wait(Config.Stockwait)
    
            QBCore.Functions.Notify('You have made some progress ', 'success', 5000)
            --TriggerServerEvent('truckerjob:server:warehousegetpaid')
            --TriggerServerEvent('truckerjob:server:removestoragelabel')
        end)
    else
        QBCore.Functions.Notify('You dont have a permit. Go get one from you supervisor', 'error', 7500)
    end
end)

RegisterNetEvent('constructionjob:client:sortIronPoles', function()
    local ped = PlayerPedId()
    local hasItem = QBCore.Functions.HasItem('constructionid')
    if hasItem then
        TriggerEvent('animations:client:EmoteCommandStart', {"medic"})
        QBCore.Functions.Progressbar('truckerjob_delivery', 'Gathering Iron Poles ', 30000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },  {
            --animDict = 'misscarsteal4@actor',
            --anim = 'actor_berating_loop',
            flags = 16,
        }, {}, {}, function()
    
            --Wait(Config.Stockwait)
    
            QBCore.Functions.Notify('You get iron poles from the stack. Now go load them in the truck ', 'success', 5000)
            TriggerServerEvent('constructionjob:server:giveIronPoles')
        end)
    else
        QBCore.Functions.Notify('You dont have a permit. Go get one from you supervisor', 'error', 7500)
    end
end)

exports['qb-target']:AddBoxZone("ironpoles", vector3(87.37, 6531.06, 30.0), 3.45, 7.35, {
	name = "ironpoles",
	heading = 224.13,
	debugPoly = false,
	minZ = 1.77834,
	maxZ = 338.87834,
}, {
	options = {
		{
            type = "client",
            event = "constructionjob:client:sortIronPoles",
			icon = "fas fa-sign-in-alt",
			label = "Gather the iron poles for delivery ",
			job = "construction",
		},
	},
	distance = 2.5
})

RegisterNetEvent('constructionjob:client:rentpaletotruck', function()
    local workTruck = Config.ScrapTruck
    local model = Config.ScrapTruck
    local player = PlayerPedId()

    TriggerEvent('animations:client:EmoteCommandStart', {"tablet2"})
    QBCore.Functions.Progressbar('truckerjob_delivery', 'Renting workTruck for delivery ', 10000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    },  {
        flags = 16,
    }, {}, {}, function()

        QBCore.Functions.Notify('Your truck rental has been approved ', 'primary', 10000)
    end)
    Wait(10000)
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    
    QBCore.Functions.SpawnVehicle(model, function(workTruck)
        SetEntityHeading(workTruck, 143.99)
        TaskWarpPedIntoVehicle(player, workTruck, -1)
        TriggerEvent("workTruckkeys:client:SetOwner", GetVehicleNumberPlateText(workTruck))
        SetVehicleEngineOn(workTruck, true, true)
        SetVehicleExtra(workTruck, 2, 1)
        SetVehicleExtra(workTruck, 3, 1)
        SetVehicleExtra(workTruck, 4, 1)
        exports['LegacyFuel']:SetFuel(veh, 100)
        SpawnVehicle = true
    end, vector4(44.89, 6539.91, 31.39, 143.99), true)
end)

CreateThread(function()
    RequestModel(`s_m_y_construct_01`) do
        while not HasModelLoaded(`s_m_y_construct_01`) do
            Wait(1)
        end
    end
    local PaletoPedTruckLoc = CreatePed(2, `s_m_y_construct_01`, Config.PaletoPedTruckLoc, false, false)
    SetPedFleeAttributes(PaletoPedTruckLoc, 0, 0)
    SetPedDiesWhenInjured(PaletoPedTruckLoc, false)
    TaskStartScenarioInPlace(PaletoPedTruckLoc, "WORLD_HUMAN_CLIPBOARD", 0, true)
    SetPedKeepTask(PaletoPedTruckLoc, true)
    SetBlockingOfNonTemporaryEvents(PaletoPedTruckLoc, true)
    SetEntityInvincible(PaletoPedTruckLoc, true)
    FreezeEntityPosition(PaletoPedTruckLoc, true)
    
    exports['qb-target']:AddBoxZone("PaletoPedTruckLoc", Config.PaletoPedTruckLoc,  3, 3, {
        name = "PaletoPedTruckLoc",
        heading = 252.5,
        debugpoly = false,
    }, {
        options = {
            {
                type = "client",
                event = "constructionjob:client:rentpaletotruck",
                icon = "fas fa-box",
                label = "Take the truck down to the delivery site ",
                job = "construction",
                
            },
        },
        distance = 1.5
    })
end)