local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('whitewidow:client:openStash')
AddEventHandler('whitewidow:client:openStash', function()
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Whitewidowjobstash", {maxweight = 1000000, slots = 150})
    TriggerEvent("inventory:client:SetCurrentStash", "Whitewidowjobstash")
end)

exports['qb-target']:AddBoxZone("Whitewidowjobstash", Config.Stash, 5.45, 5.35, {
	name = "Whitewidowjobstash",
	heading = 339.28,
	debugPoly = false,
	minZ = 1.77834,
	maxZ = 300.87834,
}, {
	options = {
		{
            type = "client",
            event = "whitewidow:client:openStash",
			icon = "fas fa-sign-in-alt",
			label = "Stash",
			job = "whitewidow",
		},
	},
	distance = 2.5
})

CreateThread(function()
    local c = Config.WhiteWidowLocation["whitewidow"]
    local Blip = AddBlipForCoord(c.x, c.y, c.z)
    SetBlipSprite(Blip, 675)
    SetBlipAsFriendly(Blip, true)
    SetBlipDisplay(Blip, 2)
    SetBlipScale(Blip, 0.7)
    SetBlipAsShortRange(Blip, true)
    SetBlipColour(Blip, 67)
    SetBlipAlpha(Blip, 0.7)
    BeginTextCommandSetBlipName("STRING")
    EndTextCommandSetBlipName(Blip)
end)

RegisterNetEvent("whitewidow:harvestwhitewidow")
AddEventHandler("whitewidow:harvestwhitewidow", function()
    local playerPed = PlayerPedId()
    local animDict = "anim@amb@business@weed@weed_inspecting_lo_med_hi@"
    local hasItem = QBCore.Functions.HasItem('trimmers')
    if hasItem then
        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do Wait(10) end
        Wait(10)
        TaskPlayAnim(playerPed, animDict, "weed_spraybottle_crouch_spraying_02_inspector", 8.0, 8.0, 1065353216, 0, 1, 0, 0, 0)
        Wait(15000)
        TriggerServerEvent("whitewidow:givewhitewidow")
        Wait(1000)
        gathering = false
    else
        QBCore.Functions.Notify('You dont have any trimmers bro ', 'error', 5000)
    end
end)

exports['qb-target']:AddBoxZone("harvestwhitewidow", vector3(171.14, -240.95, 50.07), 3.45, 5.35, {
	name = "harvestwhitewidow",
	heading = 170.05,
	debugPoly = false,
	minZ = 1.77834,
	maxZ = 300.87834,
}, {
	options = {
		{
            type = "client",
            event = "whitewidow:harvestwhitewidow",
			icon = "fas fa-sign-in-alt",
			label = "Harvest White Widow",
			job = "whitewidow",
		},
	},
	distance = 2.5
})

RegisterNetEvent("whitewidow:harvestbluedream")
AddEventHandler("whitewidow:harvestbluedream", function()
    local playerPed = PlayerPedId()
    local animDict = "anim@amb@business@weed@weed_inspecting_lo_med_hi@"
    local hasItem = QBCore.Functions.HasItem('trimmers')
    if hasItem then
        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do Wait(10) end
        Wait(10)
        TaskPlayAnim(playerPed, animDict, "weed_spraybottle_crouch_spraying_02_inspector", 8.0, 8.0, 1065353216, 0, 1, 0, 0, 0)
        QBCore.Functions.Progressbar("harvesting_bluedream", "Picking Blue Dream..", 8000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() --Done
            TriggerServerEvent("whitewidow:giveBlueDream")
        end, function() -- Cancel
            QBCore.Functions.Notify("Cancelled..", "error")
        end)
    else
        QBCore.Functions.Notify("You dont have trimmers or rolling_papers")
    end
end)

exports['qb-target']:AddBoxZone("harvestbluedream", vector3(164.18, -238.54, 50.06), 3.45, 5.35, {
	name = "harvestbluedream",
	heading = 159.69,
	debugPoly = false,
	minZ = 1.77834,
	maxZ = 300.87834,
}, {
	options = {
		{
            type = "client",
            event = "whitewidow:harvestbluedream",
			icon = "fas fa-sign-in-alt",
			label = "Harvest Blue Dream",
			job = "whitewidow",
		},
	},
	distance = 2.5
})


RegisterNetEvent("whitewidow:harvestsourapplediesel")
AddEventHandler("whitewidow:harvestsourapplediesel", function()
    local playerPed = PlayerPedId()
    local animDict = "anim@amb@business@weed@weed_inspecting_lo_med_hi@"
    local hasItem = QBCore.Functions.HasItem('trimmers')
    if hasItem then
        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do Wait(10) end
        Wait(10)
        TaskPlayAnim(playerPed, animDict, "weed_spraybottle_crouch_spraying_02_inspector", 8.0, 8.0, 1065353216, 0, 1, 0, 0, 0)
        Wait(15000)
        TriggerServerEvent("whitewidow:giveSourAppleDiesel")
        Wait(1000)
        gathering = false
    else
        QBCore.Functions.Notify('You dont have any trimmers bro ', 'error', 5000)
    end
end)

exports['qb-target']:AddBoxZone("harvestsourapplediesel", vector3(162.77, -245.02, 50.07), 5.45, 3.35, {
	name = "harvestsourapplediesel",
	heading = 160.44,
	debugPoly = false,
	minZ = 1.77834,
	maxZ = 300.87834,
}, {
	options = {
		{
            type = "client",
            event = "whitewidow:harvestsourapplediesel",
			icon = "fas fa-sign-in-alt",
			label = "Harvest Sour Apple Diesel",
			job = "whitewidow",
		},
	},
	distance = 2.5
})

RegisterNetEvent("whitewidow:harvestogkush")
AddEventHandler("whitewidow:harvestogkush", function()
    local playerPed = PlayerPedId()
    local animDict = "anim@amb@business@weed@weed_inspecting_lo_med_hi@"
    local hasItem = QBCore.Functions.HasItem('trimmers')
    if hasItem then
        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do Wait(10) end
        Wait(10)
        TaskPlayAnim(playerPed, animDict, "weed_spraybottle_crouch_spraying_02_inspector", 8.0, 8.0, 1065353216, 0, 1, 0, 0, 0)
        Wait(15000)
        TriggerServerEvent("whitewidow:giveogkush")
        Wait(1000)
        gathering = false
    else
        QBCore.Functions.Notify('You dont have any trimmers bro ', 'error', 5000)
    end
end)

exports['qb-target']:AddBoxZone("harvestogkush", vector3(167.89, -246.82, 50.07), 5.45, 3.35, {
	name = "harvestogkush",
	heading = 162.28,
	debugPoly = false,
	minZ = 1.77834,
	maxZ = 300.87834,
}, {
	options = {
		{
            type = "client",
            event = "whitewidow:harvestogkush",
			icon = "fas fa-sign-in-alt",
			label = "Harvest OG Kush",
			job = "whitewidow",
		},
	},
	distance = 2.5
})

RegisterNetEvent("whitewidow:rollbluedreampremiumblunt")
AddEventHandler("whitewidow:rollbluedreampremiumblunt", function()
    local playerPed = PlayerPedId()
    local animDict = "anim@amb@business@weed@weed_inspecting_lo_med_hi@"
    local hasItem = QBCore.Functions.HasItem('bluedream')
    local hasItem2 = QBCore.Functions.HasItem('rolling_paper')
    if hasItem and hasItem2 then
        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do Wait(10) end
        Wait(10)
        TaskPlayAnim(playerPed, animDict, "weed_spraybottle_crouch_spraying_02_inspector", 8.0, 8.0, 1065353216, 0, 1, 0, 0, 0)
        Wait(15000)
        TriggerServerEvent("whitewidow:server:rollbluedreampremiumblunt")
        Wait(1000)
        gathering = false
    else
        QBCore.Functions.Notify('You dont have any trimmers or rolling paper ', 'error', 5000)
    end
end)

RegisterNetEvent("whitewidow:rollogkushpremiumblunt")
AddEventHandler("whitewidow:rollogkushpremiumblunt", function()
    local playerPed = PlayerPedId()
    local animDict = "anim@amb@business@weed@weed_inspecting_lo_med_hi@"
    local hasItem = QBCore.Functions.HasItem('ogkush')
    local hasItem2 = QBCore.Functions.HasItem('rolling_paper')
    if hasItem and hasItem2 then
        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do Wait(10) end
        Wait(10)
        TaskPlayAnim(playerPed, animDict, "weed_spraybottle_crouch_spraying_02_inspector", 8.0, 8.0, 1065353216, 0, 1, 0, 0, 0)
        Wait(15000)
        TriggerServerEvent("whitewidow:server:rollpremiumogkushblunt")
        Wait(1000)
        gathering = false
    else
        QBCore.Functions.Notify('You dont have any trimmers or rolling paper ', 'error', 5000)
    end
end)

RegisterNetEvent("whitewidow:rollpremiumsourappledieselblunt")
AddEventHandler("whitewidow:rollpremiumsourappledieselblunt", function()
    local playerPed = PlayerPedId()
    local animDict = "anim@amb@business@weed@weed_inspecting_lo_med_hi@"
    local hasItem = QBCore.Functions.HasItem('sourapplediesel')
    local hasItem2 = QBCore.Functions.HasItem('rolling_paper')
    if hasItem and hasItem2 then
        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do Wait(10) end
        Wait(10)
        TaskPlayAnim(playerPed, animDict, "weed_spraybottle_crouch_spraying_02_inspector", 8.0, 8.0, 1065353216, 0, 1, 0, 0, 0)
        Wait(15000)
        TriggerServerEvent("whitewidow:server:rollpremiumsourappledieselblunt")
        Wait(1000)
        gathering = false
    else
        QBCore.Functions.Notify('You dont have any trimmers or rolling paper ', 'error', 5000)
    end
end)

RegisterNetEvent("whitewidow:rollpremiumwhitewidowblunt")
AddEventHandler("whitewidow:rollpremiumwhitewidowblunt", function()
    local playerPed = PlayerPedId()
    local animDict = "anim@amb@business@weed@weed_inspecting_lo_med_hi@"
    local hasItem = QBCore.Functions.HasItem('whitewidow')
    local hasItem2 = QBCore.Functions.HasItem('rolling_paper')
    if hasItem and hasItem2 then
        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do Wait(10) end
        Wait(10)
        TaskPlayAnim(playerPed, animDict, "weed_spraybottle_crouch_spraying_02_inspector", 8.0, 8.0, 1065353216, 0, 1, 0, 0, 0)
        Wait(15000)
        TriggerServerEvent("whitewidow:server:rollpremiumwhitewidowblunt")
        Wait(1000)
        gathering = false
    else
        QBCore.Functions.Notify('You dont have any trimmers or rolling paper ', 'error', 5000)
    end
end)



exports['qb-target']:AddBoxZone("billplayer", vector3(188.0, -241.99, 54.07), 1.45, 3.35, {
	name = "billplayer",
	heading = 250.36,
	debugPoly = false,
	minZ = 1.77834,
	maxZ = 300.87834,
}, {
	options = {
		{
            type = "command",
            event = "billing",
			icon = "fas fa-sign-in-alt",
			label = "Bill players",
			job = "whitewidow",
		},
	},
	distance = 2.5
})


function BlueDreamEffect()
    local playerPed = PlayerPedId()
    --TaskPlayAnim('playerPed', 'amb@world_human_bum_standing@drunk@idle_a', 'idle_a', 8.0, 8.0, 15000, -1, 1.0, 0, 0, 1)
    --StartScreenEffect("DrugsDrivingIn", 6.0, true)
    --Wait(3000)
    --StartScreenEffect("ChopVision", 6.0, true)
    --Wait(3000)
	--StartScreenEffect("DeathFailMPDark", 6.0, true)
    --Wait(3000)
    --SetCamEffect(2)
    --SetPedMotionBlur(playerPed, true)
    AnimpostfxPlay('HeistCelebPass', 60, false)
    AnimpostfxPlay('DrugsTrevorClownsFightIn', 60, false)
    --Wait(3000)
    --ShakeCam(playerPed, 'FAMILY5_DRUG_TRIP_SHAKE', 9)
    --Wait(3000)
    --ShakeCam(playerPed, 'JOLT_SHAKE', 9)
    Wait(Config.HighTime)
    --SetPedMovementClipset(playerPed, "MOVE_M@DRUNK@VERYDRUNK", 5.0)
    --StartScreenEffect("PPPinkOut", 3.0, 0)
	StopScreenEffect("DrugsDrivingIn")
	StopScreenEffect("ChopVision")
	StopScreenEffect("DeathFailMPDark")
    StopScreenEffect("PPPinkOut")
    SetPedMotionBlur(playerPed, false)
    SetCamEffect(0)
    AnimpostfxStopAll()
end

function GSCEffect()
    local playerPed = PlayerPedId()
    --TaskPlayAnim('playerPed', 'amb@world_human_bum_standing@drunk@idle_a', 'idle_a', 8.0, 8.0, 15000, -1, 1.0, 0, 0, 1)
    --StartScreenEffect("DrugsDrivingIn", 6.0, true)
    --Wait(3000)
    --StartScreenEffect("ChopVision", 6.0, true)
    --Wait(3000)
	--StartScreenEffect("DeathFailMPDark", 6.0, true)
    --Wait(3000)
    SetCamEffect(2)
    SetPedMotionBlur(playerPed, true)
    AnimpostfxPlay('HeistCelebPass', 60, false)
    AnimpostfxPlay('DrugsTrevorClownsFightIn', 60, false)
    --Wait(3000)
    ShakeCam(playerPed, 'FAMILY5_DRUG_TRIP_SHAKE', 9)
    --Wait(3000)
    --ShakeCam(playerPed, 'JOLT_SHAKE', 9)
    Wait(Config.HighTime)
    --SetPedMovementClipset(playerPed, "MOVE_M@DRUNK@VERYDRUNK", 5.0)
    --StartScreenEffect("PPPinkOut", 3.0, 0)
	StopScreenEffect("DrugsDrivingIn")
	StopScreenEffect("ChopVision")
	StopScreenEffect("DeathFailMPDark")
    StopScreenEffect("PPPinkOut")
    SetPedMotionBlur(playerPed, false)
    SetCamEffect(0)
    AnimpostfxStopAll()
end

RegisterNetEvent('whitewidow:client:smokeBlueDream', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed"})
    TriggerServerEvent("whitewidow:removebluedreamblunt")
    QBCore.Functions.Progressbar("smokeBlueDream", "Smoking blue dream..", 25000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() --Done
        BlueDreamEffect()
        --TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        --TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesAlcohol[itemName])
        weedSmell = weedSmell + 1
        if weedSmell > 1 and weedSmell < 2 then
            TriggerEvent("evidence:client:SetStatus", "weedsmell", 200)
        elseif weedSmell >= 2 then
            TriggerEvent("evidence:client:SetStatus", "weedsmell", 200)
        end
    end, function() -- Cancel
        --TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        QBCore.Functions.Notify("Cancelled..", "error")
    end)
    Wait(25000)
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
end)

RegisterNetEvent('whitewidow:client:smokepremiumogkushblunt', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed"})
    TriggerServerEvent("whitewidow:removepremiumogkushblunt")
    QBCore.Functions.Progressbar("smokeBlueDream", "Smoking og kush..", 25000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() --Done
        BlueDreamEffect()
        --TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        --TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesAlcohol[itemName])
        weedSmell = weedSmell + 1
        if weedSmell > 1 and weedSmell < 2 then
            TriggerEvent("evidence:client:SetStatus", "weedsmell", 200)
        elseif weedSmell >= 2 then
            TriggerEvent("evidence:client:SetStatus", "weedsmell", 200)
        end
    end, function() -- Cancel
        --TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        QBCore.Functions.Notify("Cancelled..", "error")
    end)
    Wait(25000)
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
end)

RegisterNetEvent('whitewidow:client:smokepremiumsourappledieselblunt', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed"})
    TriggerServerEvent("whitewidow:removepremiumsourappledieselblunt")
    QBCore.Functions.Progressbar("smokeBlueDream", "Smoking sour apple diesel..", 25000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() --Done
        BlueDreamEffect()
        --TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        --TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesAlcohol[itemName])
        weedSmell = weedSmell + 1
        if weedSmell > 1 and weedSmell < 2 then
            TriggerEvent("evidence:client:SetStatus", "weedsmell", 200)
        elseif weedSmell >= 2 then
            TriggerEvent("evidence:client:SetStatus", "weedsmell", 200)
        end
    end, function() -- Cancel
        --TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        QBCore.Functions.Notify("Cancelled..", "error")
    end)
    Wait(25000)
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
end)

RegisterNetEvent('whitewidow:client:smokepremiumwhitewidowblunt', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed"})
    TriggerServerEvent("whitewidow:removepremiumwhitewidowblunt")
    QBCore.Functions.Progressbar("smokeBlueDream", "Smoking white widow..", 25000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() --Done
        BlueDreamEffect()
        --TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        --TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesAlcohol[itemName])
        weedSmell = weedSmell + 1
        if weedSmell > 1 and weedSmell < 2 then
            TriggerEvent("evidence:client:SetStatus", "weedsmell", 200)
        elseif weedSmell >= 2 then
            TriggerEvent("evidence:client:SetStatus", "weedsmell", 200)
        end
    end, function() -- Cancel
        --TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        QBCore.Functions.Notify("Cancelled..", "error")
    end)
    Wait(25000)
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
end)

RegisterNetEvent('whitewidow:client:smokegscblunt', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed"})
    TriggerServerEvent("whitewidow:server:removegscblunt")
    QBCore.Functions.Progressbar("smokeBlueDream", "Smoking girl scout cookies", Config.SmokeTime, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() --Done
        GSCEffect()
        --TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        --TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesAlcohol[itemName])
        weedSmell = weedSmell + 1
        if weedSmell > 1 and weedSmell < 2 then
            TriggerEvent("evidence:client:SetStatus", "weedsmell", 200)
        elseif weedSmell >= 2 then
            TriggerEvent("evidence:client:SetStatus", "weedsmell", 200)
        end
    end, function() -- Cancel
        --TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        QBCore.Functions.Notify("Cancelled..", "error")
    end)
    Wait(25000)
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
end)

RegisterNetEvent("whitewidow:client:buysoda")
AddEventHandler("whitewidow:client:buysoda", function()
    local playerPed = PlayerPedId()
    if playerPed then
        TriggerServerEvent("whitewidow:server:buysoda")
    else
        QBCore.Functions.Notify('Who are you??? ', 'error', 5000)
    end
end)



exports['qb-target']:AddBoxZone("sodamachine", vector3(195.9, -247.6, 54.07), 3.45, 3.35, {
	name = "sodamachine",
	heading = 160.62,
	debugPoly = false,
	minZ = 1.77834,
	maxZ = 300.87834,
}, {
	options = {
		{
            type = "client",
            event = "whitewidow:client:buysoda",
			icon = "fas fa-sign-in-alt",
			label = "Buy a coke",
		},
	},
	distance = 2.5
})

exports['qb-target']:AddBoxZone("clockin", vector3(180.99, -252.99, 54.07), 1.45, 3.35, {
	name = "clockin",
	heading = 137.85,
	debugPoly = false,
	minZ = 1.77834,
	maxZ = 300.87834,
}, {
	options = {
		{
            type = "server",
            event = "whitewidow:ToggleDuty",
			icon = "fas fa-sign-in-alt",
			label = "Clock In",
			job = "whitewidow",
		},
	},
	distance = 2.5
})

exports['qb-target']:AddBoxZone("getcoffee", vector3(186.27, -245.93, 54.07), 1.45, 1.35, {
	name = "getcoffee",
	heading = 250.51,
	debugPoly = false,
	minZ = 1.77834,
	maxZ = 300.87834,
}, {
	options = {
		{
            type = "server",
            event = "whitewidow:getcoffee",
			icon = "fas fa-sign-in-alt",
			label = "Get a cup of coffee",
			job = "whitewidow",
		},
	},
	distance = 2.5
})

exports['qb-target']:AddBoxZone("getsnacks", Config.SnacksLocation, 1.45, 3.35, {
	name = "getsnacks",
	heading = 68.47,
	debugPoly = false,
	minZ = 1.77834,
	maxZ = 300.87834,
}, {
	options = {
		{
            type = "server",
            event = "whitewidow:server:buysnikkels",
			icon = "fas fa-sign-in-alt",
			label = "Get a snikkels",
		},
        {
            type = "server",
            event = "whitewidow:server:buytwerks",
			icon = "fas fa-sign-in-alt",
			label = "Get a twerks",
		},
	},
	distance = 2.5
})

exports['qb-target']:AddBoxZone("rollblunts", vector3(185.92, -242.41, 54.07), 1.45, 3.35, {
	name = "rollblunts",
	heading = 71.59,
	debugPoly = false,
	minZ = 1.77834,
	maxZ = 300.87834,
}, {
	options = {
		{
            type = "client",
            event = "whitewidow:rollbluedreampremiumblunt",
			icon = "fas fa-sign-in-alt",
			label = "Roll blue dream blunts",
			job = "whitewidow",
		},
        {
            type = "client",
            event = "whitewidow:rollogkushpremiumblunt",
			icon = "fas fa-sign-in-alt",
			label = "Roll og kush blunts",
			job = "whitewidow",
		},
        {
            type = "client",
            event = "whitewidow:rollpremiumsourappledieselblunt",
			icon = "fas fa-sign-in-alt",
			label = "Roll sour apple diesel blunts",
			job = "whitewidow",
		},
        {
            type = "client",
            event = "whitewidow:rollpremiumwhitewidowblunt",
			icon = "fas fa-sign-in-alt",
			label = "Roll white widow blunts",
			job = "whitewidow",
		},
        {
            type = "client",
            event = "whitewidow:client:girlscoutcookies",
			icon = "fas fa-sign-in-alt",
			label = "Roll gsc blunts",
			job = "whitewidow",
		},
	},
	distance = 2.5
})

RegisterNetEvent('whitewidow:client:girlscoutcookies', function()
    local playerPed = PlayerPedId()
    local hasItem = QBCore.Functions.HasItem('sourapplediesel')
    local hasItem2 = QBCore.Functions.HasItem('ogkush')
    local hasItem3 = QBCore.Functions.HasItem('girlscoutcookiesseed')
    local animDict = "anim@amb@business@weed@weed_sorting_seated@"
    if hasItem and hasItem2 or hasItem3 then
        QBCore.Functions.Progressbar("smokeBlueDream", "Converting to gsc..", 5000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() --Done
            TaskPlayAnim(playerPed, animDict, "sorter_right_sort_v3_sorter02", 8.0, 8.0, 1065353216, 0, 1, 0, 0, 0)
            TriggerServerEvent('whitewidow:server:givegirlscoutcookies')
            Wait(5000)
            --TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            --TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesAlcohol[itemName])
            weedSmell = weedSmell + 1
            if weedSmell > 1 and weedSmell < 2 then
                TriggerEvent("evidence:client:SetStatus", "weedsmell", 200)
            elseif weedSmell >= 2 then
                TriggerEvent("evidence:client:SetStatus", "weedsmell", 200)
            end
        end, function() -- Cancel
            --TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            QBCore.Functions.Notify("Cancelled..", "error")
        end)
    end
end)

RegisterNetEvent('whitewidow:client:girlscoutcookies', function()
    local player = PlayerPedId()
    local hasItem = QBCore.Functions.HasItem('girlscoutcookies')

    if hasItem then
        QBCore.Functions.Progressbar("smokeBlueDream", "Rolling a fat gsc blunt..", 25000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() --Done
            TriggerServerEvent('whitewidow:server:givegirlscoutcookiesblunt')
            --TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            --TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesAlcohol[itemName])
            weedSmell = weedSmell + 1
            if weedSmell > 1 and weedSmell < 2 then
                TriggerEvent("evidence:client:SetStatus", "weedsmell", 200)
            elseif weedSmell >= 2 then
                TriggerEvent("evidence:client:SetStatus", "weedsmell", 200)
            end
        end, function() -- Cancel
            --TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            QBCore.Functions.Notify("Cancelled..", "error")
        end)
    end
end)

exports['qb-target']:AddBoxZone("openmenu", vector3(188.63, -241.89, 56.97), 1.45, 8.35, {
	name = "openmenu",
	heading = 70.23,
	debugPoly = false,
	minZ = 55.50,
	maxZ = 300.87834,
}, {
	options = {
		{
            type = "command",
            event = "on",
			icon = "fas fa-sign-in-alt",
			label = "Open the menu",
		},
        {
            type = "command",
            event = "off",
			icon = "fas fa-sign-in-alt",
			label = "Close the menu",
		},
	},
	distance = 12.5
})










exports['qb-target']:AddBoxZone("getsupplies", vector3(194.92, -234.36, 54.07), 3.45, 3.35, {
	name = "getsupplies",
	heading = 342.05,
	debugPoly = false,
	minZ = 1.50,
	maxZ = 300.87834,
}, {
	options = {
		{
            type = "server",
            event = "whitewidow:server:getscale",
			icon = "fas fa-sign-in-alt",
			label = "Grab a scale",
            job = "whitewidow"
		},
        {
            type = "server",
            event = "whitewidow:server:gettrimmers",
			icon = "fas fa-sign-in-alt",
			label = "Grab a set of trimmers",
            job = "whitewidow"
		},
        {
            type = "server",
            event = "whitewidow:server:getpapers",
			icon = "fas fa-sign-in-alt",
			label = "Grab some papers",
            job = "whitewidow"
		},
	},
	distance = 3.5
})


--Smoking at tables
--Table 1
exports['qb-target']:AddBoxZone("smoketables1", vector3(188.1, -252.65, 54.52), 3.45, 3.35, {
	name = "smoketables1",
	heading = 215.79,
	debugPoly = false,
	minZ = 1.50,
	maxZ = 300.87834,
}, {
	options = {
		{
            type = "client",
            event = "whitewidow:client:smokeBlueDreambong",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some blue dream",
		},
        {
            type = "client",
            event = "whitewidow:client:smokewhitewidowbong",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some white widow",
		},
        {
            type = "client",
            event = "whitewidow:client:smokesourappledieselbong",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some sour apple diesel",
		},
        {
            type = "client",
            event = "whitewidow:client:smokeogkushbong",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some og kush",
		},
        {
            type = "client",
            event = "whitewidow:client:smokegirlscoutcookies",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some girl scout cookies",
		},
	},
	distance = 3.5
})

--Table 2
exports['qb-target']:AddBoxZone("smoketables2", vector3(185.99, -258.39, 54.66), 3.45, 3.35, {
	name = "smoketables2",
	heading = 215.79,
	debugPoly = false,
	minZ = 1.50,
	maxZ = 300.87834,
}, {
	options = {
		{
            type = "client",
            event = "whitewidow:client:smokeBlueDreambong",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some blue dream",
		},
        {
            type = "client",
            event = "whitewidow:client:smokewhitewidowbong",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some white widow",
		},
        {
            type = "client",
            event = "whitewidow:client:smokesourappledieselbong",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some sour apple diesel",
		},
        {
            type = "client",
            event = "whitewidow:client:smokeogkushbong",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some og kush",
		},
        {
            type = "client",
            event = "whitewidow:client:smokegirlscoutcookies",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some girl scout cookies",
		},
	},
	distance = 3.5
})

--Table 3
exports['qb-target']:AddBoxZone("smoketables3", vector3(183.75, -264.73, 54.52), 3.45, 3.35, {
	name = "smoketables3",
	heading = 215.79,
	debugPoly = false,
	minZ = 1.50,
	maxZ = 300.87834,
}, {
	options = {
		{
            type = "client",
            event = "whitewidow:client:smokeBlueDreambong",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some blue dream",
		},
        {
            type = "client",
            event = "whitewidow:client:smokewhitewidowbong",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some white widow",
		},
        {
            type = "client",
            event = "whitewidow:client:smokesourappledieselbong",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some sour apple diesel",
		},
        {
            type = "client",
            event = "whitewidow:client:smokeogkushbong",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some og kush",
		},
        {
            type = "client",
            event = "whitewidow:client:smokegirlscoutcookies",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some girl scout cookies",
		},
	},
	distance = 3.5
})

--Table 4
exports['qb-target']:AddBoxZone("smoketables4", vector3(191.93, -267.77, 54.67), 3.45, 3.35, {
	name = "smoketables4",
	heading = 215.79,
	debugPoly = false,
	minZ = 1.50,
	maxZ = 300.87834,
}, {
	options = {
		{
            type = "client",
            event = "whitewidow:client:smokeBlueDreambong",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some blue dream",
		},
        {
            type = "client",
            event = "whitewidow:client:smokewhitewidowbong",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some white widow",
		},
        {
            type = "client",
            event = "whitewidow:client:smokesourappledieselbong",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some sour apple diesel",
		},
        {
            type = "client",
            event = "whitewidow:client:smokeogkushbong",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some og kush",
		},
        {
            type = "client",
            event = "whitewidow:client:smokegirlscoutcookies",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some girl scout cookies",
		},
	},
	distance = 3.5
})

--Table 5
exports['qb-target']:AddBoxZone("smoketables5", vector3(193.69, -263.44, 54.56), 3.45, 3.35, {
	name = "smoketables5",
	heading = 215.79,
	debugPoly = false,
	minZ = 1.50,
	maxZ = 300.87834,
}, {
	options = {
		{
            type = "client",
            event = "whitewidow:client:smokeBlueDreambong",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some blue dream",
		},
        {
            type = "client",
            event = "whitewidow:client:smokewhitewidowbong",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some white widow",
		},
        {
            type = "client",
            event = "whitewidow:client:smokesourappledieselbong",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some sour apple diesel",
		},
        {
            type = "client",
            event = "whitewidow:client:smokeogkushbong",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some og kush",
		},
        {
            type = "client",
            event = "whitewidow:client:smokegirlscoutcookies",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some girl scout cookies",
		},
	},
	distance = 3.5
})

--Table 6
exports['qb-target']:AddBoxZone("smoketables6", vector3(195.72, -257.4, 54.52), 3.45, 3.35, {
	name = "smoketables6",
	heading = 215.79,
	debugPoly = false,
	minZ = 1.50,
	maxZ = 300.87834,
}, {
	options = {
		{
            type = "client",
            event = "whitewidow:client:smokeBlueDreambong",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some blue dream",
		},
        {
            type = "client",
            event = "whitewidow:client:smokewhitewidowbong",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some white widow",
		},
        {
            type = "client",
            event = "whitewidow:client:smokesourappledieselbong",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some sour apple diesel",
		},
        {
            type = "client",
            event = "whitewidow:client:smokeogkushbong",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some og kush",
		},
        {
            type = "client",
            event = "whitewidow:client:smokegirlscoutcookies",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some girl scout cookies",
		},
	},
	distance = 3.5
})

--Table 7
exports['qb-target']:AddBoxZone("smoketables7", vector3(197.17, -253.19, 54.53), 3.45, 3.35, {
	name = "smoketables7",
	heading = 215.79,
	debugPoly = false,
	minZ = 1.50,
	maxZ = 300.87834,
}, {
	options = {
		{
            type = "client",
            event = "whitewidow:client:smokeBlueDreambong",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some blue dream",
		},
        {
            type = "client",
            event = "whitewidow:client:smokewhitewidowbong",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some white widow",
		},
        {
            type = "client",
            event = "whitewidow:client:smokesourappledieselbong",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some sour apple diesel",
		},
        {
            type = "client",
            event = "whitewidow:client:smokeogkushbong",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some og kush",
		},
        {
            type = "client",
            event = "whitewidow:client:smokegirlscoutcookies",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some girl scout cookies",
		},
	},
	distance = 3.5
})

--Table 8
exports['qb-target']:AddBoxZone("smoketables8", vector3(199.31, -247.05, 54.52), 3.45, 3.35, {
	name = "smoketables8",
	heading = 215.79,
	debugPoly = false,
	minZ = 1.50,
	maxZ = 300.87834,
}, {
	options = {
		{
            type = "client",
            event = "whitewidow:client:smokeBlueDreambong",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some blue dream",
		},
        {
            type = "client",
            event = "whitewidow:client:smokewhitewidowbong",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some white widow",
		},
        {
            type = "client",
            event = "whitewidow:client:smokesourappledieselbong",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some sour apple diesel",
		},
        {
            type = "client",
            event = "whitewidow:client:smokeogkushbong",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some og kush",
		},
        {
            type = "client",
            event = "whitewidow:client:smokegirlscoutcookies",
			icon = "fas fa-sign-in-alt",
			label = "Smoke some girl scout cookies",
		},
	},
	distance = 3.5
})

RegisterNetEvent('whitewidow:client:smokeBlueDreambong', function(itemName)
    local hasItem = QBCore.Functions.HasItem('bluedream')
    local hasItem2 = QBCore.Functions.HasItem('lighter')
    local hasItem3 = QBCore.Functions.HasItem('grinder')
    if hasItem and hasItem2 and hasItem3 then
        TriggerEvent('animations:client:EmoteCommandStart', {"bong"})
        TriggerServerEvent("whitewidow:removebluedream")
        QBCore.Functions.Progressbar("smokeBlueDream", "Smoking blue dream..", 12000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() --Done
            BlueDreamBongEffect()
            --TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            --TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesAlcohol[itemName])
            weedSmell = weedSmell + 1
            if weedSmell > 1 and weedSmell < 2 then
                TriggerEvent("evidence:client:SetStatus", "weedsmell", 200)
            elseif weedSmell >= 2 then
                TriggerEvent("evidence:client:SetStatus", "weedsmell", 200)
            end
        end, function() -- Cancel
            --TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            QBCore.Functions.Notify("Cancelled..", "error")
        end)
        Wait(12000)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end
end)

function BlueDreamBongEffect()
    local playerPed = PlayerPedId()
    --TaskPlayAnim('playerPed', 'amb@world_human_bum_standing@drunk@idle_a', 'idle_a', 8.0, 8.0, 15000, -1, 1.0, 0, 0, 1)
    --StartScreenEffect("DrugsDrivingIn", 6.0, true)
    --Wait(3000)
    AnimpostfxPlay("ChopVision", 6.0, true)
    --Wait(3000)
	--StartScreenEffect("DeathFailMPDark", 6.0, true)
    --Wait(3000)
    --SetCamEffect(2)
    SetPedMotionBlur(playerPed, true)
    SetGameplayCamShakeAmplitude(3.0)
    AnimpostfxPlay('HeistCelebPass', 60, false)
    AnimpostfxPlay('DrugsTrevorClownsFightIn', 60, false)
    AnimpostfxPlay('DrugsTrevorClownsFight', 60, false)
    AnimpostfxPlay('DrugsTrevorClownsFightOut', 60, false)
    --Wait(3000)
    ShakeCam(playerPed, 'FAMILY5_DRUG_TRIP_SHAKE', 9)
    --Wait(3000)
    --ShakeCam(playerPed, 'JOLT_SHAKE', 9)
    Wait(Config.HighTime)
    --SetPedMovementClipset(playerPed, "MOVE_M@DRUNK@VERYDRUNK", 5.0)
    --StartScreenEffect("PPPinkOut", 3.0, 0)
	StopScreenEffect("DrugsDrivingIn")
	StopScreenEffect("ChopVision")
	StopScreenEffect("DeathFailMPDark")
    StopScreenEffect("PPPinkOut")
    SetPedMotionBlur(playerPed, false)
    SetCamEffect(0)
    AnimpostfxStopAll()
end

RegisterNetEvent('whitewidow:client:smokewhitewidowbong', function(itemName)
    local hasItem = QBCore.Functions.HasItem('whitewidow')
    local hasItem2 = QBCore.Functions.HasItem('lighter')
    local hasItem3 = QBCore.Functions.HasItem('grinder')
    if hasItem and hasItem2 and hasItem3 then
        TriggerEvent('animations:client:EmoteCommandStart', {"bong"})
        TriggerServerEvent("whitewidow:removewhitewidow")
        QBCore.Functions.Progressbar("smokeBlueDream", "Smoking white widow..", 12000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() --Done
            WhiteWidowBongEffect()
            --TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            --TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesAlcohol[itemName])
            weedSmell = weedSmell + 1
            if weedSmell > 1 and weedSmell < 2 then
                TriggerEvent("evidence:client:SetStatus", "weedsmell", 200)
            elseif weedSmell >= 2 then
                TriggerEvent("evidence:client:SetStatus", "weedsmell", 200)
            end
        end, function() -- Cancel
            --TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            QBCore.Functions.Notify("Cancelled..", "error")
        end)
        Wait(12000)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end
end)

function WhiteWidowBongEffect()
    local playerPed = PlayerPedId()
    --TaskPlayAnim('playerPed', 'amb@world_human_bum_standing@drunk@idle_a', 'idle_a', 8.0, 8.0, 15000, -1, 1.0, 0, 0, 1)
    StartScreenEffect("DrugsDrivingIn", 6.0, true)
    --Wait(3000)
    AnimpostfxPlay("ChopVision", 6.0, true)
    --Wait(3000)
	--StartScreenEffect("DeathFailMPDark", 6.0, true)
    --Wait(3000)
    --SetCamEffect(2)
    SetPedMotionBlur(playerPed, true)
    SetGameplayCamShakeAmplitude(3.0)
    --AnimpostfxPlay('HeistCelebPass', 60, false)
    AnimpostfxPlay('DrugsTrevorClownsFightIn', 60, false)
    AnimpostfxPlay('DrugsTrevorClownsFight', 60, false)
    --AnimpostfxPlay('DrugsTrevorClownsFightOut', 60, false)
    --Wait(3000)
    ShakeCam(playerPed, 'FAMILY5_DRUG_TRIP_SHAKE', 9)
    --Wait(3000)
    --ShakeCam(playerPed, 'JOLT_SHAKE', 9)
    Wait(Config.HighTime)
    --SetPedMovementClipset(playerPed, "MOVE_M@DRUNK@VERYDRUNK", 5.0)
    --StartScreenEffect("PPPinkOut", 3.0, 0)
	StopScreenEffect("DrugsDrivingIn")
	StopScreenEffect("ChopVision")
	StopScreenEffect("DeathFailMPDark")
    StopScreenEffect("PPPinkOut")
    SetPedMotionBlur(playerPed, false)
    SetCamEffect(0)
    AnimpostfxStopAll()
end

RegisterNetEvent('whitewidow:client:smokesourappledieselbong', function(itemName)
    local hasItem = QBCore.Functions.HasItem('sourapplediesel')
    local hasItem2 = QBCore.Functions.HasItem('lighter')
    local hasItem3 = QBCore.Functions.HasItem('grinder')
    if hasItem and hasItem2 and hasItem3 then
        TriggerEvent('animations:client:EmoteCommandStart', {"bong"})
        TriggerServerEvent("whitewidow:removesourapplediesel")
        QBCore.Functions.Progressbar("smokeBlueDream", "Smoking sour apple diesel..", 12000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() --Done
            SourAppleDieselBongEffect()
            --TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            --TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesAlcohol[itemName])
            weedSmell = weedSmell + 1
            if weedSmell > 1 and weedSmell < 2 then
                TriggerEvent("evidence:client:SetStatus", "weedsmell", 200)
            elseif weedSmell >= 2 then
                TriggerEvent("evidence:client:SetStatus", "weedsmell", 200)
            end
        end, function() -- Cancel
            --TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            QBCore.Functions.Notify("Cancelled..", "error")
        end)
        Wait(12000)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end
end)

function SourAppleDieselBongEffect()
    local playerPed = PlayerPedId()
    --TaskPlayAnim('playerPed', 'amb@world_human_bum_standing@drunk@idle_a', 'idle_a', 8.0, 8.0, 15000, -1, 1.0, 0, 0, 1)
    StartScreenEffect("DrugsDrivingIn", 6.0, true)
    --Wait(3000)
    AnimpostfxPlay("ChopVision", 6.0, true)
    --Wait(3000)
	AnimpostfxPlay("DeathFailMPDark", 6.0, true)
    --Wait(3000)
    SetCamEffect(2)
    SetPedMotionBlur(playerPed, true)
    SetGameplayCamShakeAmplitude(3.0)
    AnimpostfxPlay('HeistCelebPass', 60, false)
    AnimpostfxPlay('DrugsTrevorClownsFightIn', 60, false)
    AnimpostfxPlay('DrugsTrevorClownsFight', 60, false)
    AnimpostfxPlay('DrugsTrevorClownsFightOut', 60, false)
    --Wait(3000)
    ShakeCam(playerPed, 'FAMILY5_DRUG_TRIP_SHAKE', 9)
    --Wait(3000)
    ShakeCam(playerPed, 'JOLT_SHAKE', 9)
    Wait(Config.HighTime)
    --SetPedMovementClipset(playerPed, "MOVE_M@DRUNK@VERYDRUNK", 5.0)
    AnimpostfxPlay("PPPinkOut", 3.0, 0)
	StopScreenEffect("DrugsDrivingIn")
	StopScreenEffect("ChopVision")
	StopScreenEffect("DeathFailMPDark")
    StopScreenEffect("PPPinkOut")
    SetPedMotionBlur(playerPed, false)
    SetCamEffect(0)
    AnimpostfxStopAll()
end

RegisterNetEvent('whitewidow:client:smokeogkushbong', function(itemName)
    local hasItem = QBCore.Functions.HasItem('ogkush')
    local hasItem2 = QBCore.Functions.HasItem('lighter')
    local hasItem3 = QBCore.Functions.HasItem('grinder')
    if hasItem and hasItem2 and hasItem3 then
        TriggerEvent('animations:client:EmoteCommandStart', {"bong"})
        TriggerServerEvent("whitewidow:removeogkush")
        QBCore.Functions.Progressbar("smokeBlueDream", "Smoking og kush..", 12000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() --Done
            OGKushBongEffect()
            --TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            --TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesAlcohol[itemName])
            weedSmell = weedSmell + 1
            if weedSmell > 1 and weedSmell < 2 then
                TriggerEvent("evidence:client:SetStatus", "weedsmell", 200)
            elseif weedSmell >= 2 then
                TriggerEvent("evidence:client:SetStatus", "weedsmell", 200)
            end
        end, function() -- Cancel
            --TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            QBCore.Functions.Notify("Cancelled..", "error")
        end)
        Wait(12000)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end
end)

function OGKushBongEffect()
    local playerPed = PlayerPedId()
    --TaskPlayAnim('playerPed', 'amb@world_human_bum_standing@drunk@idle_a', 'idle_a', 8.0, 8.0, 15000, -1, 1.0, 0, 0, 1)
    StartScreenEffect("DrugsDrivingIn", 6.0, true)
    --Wait(3000)
    --AnimpostfxPlay("ChopVision", 6.0, true)
    --Wait(3000)
	AnimpostfxPlay("DeathFailMPDark", 6.0, true)
    --Wait(3000)
    SetCamEffect(2)
    SetPedMotionBlur(playerPed, true)
    SetGameplayCamShakeAmplitude(3.0)
    AnimpostfxPlay('HeistCelebPass', 60, false)
    AnimpostfxPlay('DrugsTrevorClownsFightIn', 60, false)
    AnimpostfxPlay('DrugsTrevorClownsFight', 60, false)
    --AnimpostfxPlay('DrugsTrevorClownsFightOut', 60, false)
    --Wait(3000)
    ShakeCam(playerPed, 'FAMILY5_DRUG_TRIP_SHAKE', 9)
    --Wait(3000)
    --ShakeCam(playerPed, 'JOLT_SHAKE', 9)
    Wait(Config.HighTime)
    --SetPedMovementClipset(playerPed, "MOVE_M@DRUNK@VERYDRUNK", 5.0)
    --AnimpostfxPlay("PPPinkOut", 3.0, 0)
	StopScreenEffect("DrugsDrivingIn")
	StopScreenEffect("ChopVision")
	StopScreenEffect("DeathFailMPDark")
    StopScreenEffect("PPPinkOut")
    SetPedMotionBlur(playerPed, false)
    SetCamEffect(0)
    AnimpostfxStopAll()
end

RegisterNetEvent('whitewidow:client:smokegirlscoutcookies', function(itemName)
    local hasItem = QBCore.Functions.HasItem('girlscoutcookies')
    local hasItem2 = QBCore.Functions.HasItem('lighter')
    local hasItem3 = QBCore.Functions.HasItem('grinder')
    if hasItem and hasItem2 and hasItem3 then
        TriggerEvent('animations:client:EmoteCommandStart', {"bong"})
        TriggerServerEvent("whitewidow:removegirlscoutcookies")
        QBCore.Functions.Progressbar("smokeBlueDream", "Smoking girl scout cookies..", 12000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() --Done
            GirlScoutCookiesBongEffect()
            --TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            --TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesAlcohol[itemName])
            weedSmell = weedSmell + 1
            if weedSmell > 1 and weedSmell < 2 then
                TriggerEvent("evidence:client:SetStatus", "weedsmell", 200)
            elseif weedSmell >= 2 then
                TriggerEvent("evidence:client:SetStatus", "weedsmell", 200)
            end
        end, function() -- Cancel
            --TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            QBCore.Functions.Notify("Cancelled..", "error")
        end)
        Wait(12000)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end
end)

function GirlScoutCookiesBongEffect()
    local playerPed = PlayerPedId()
    --TaskPlayAnim('playerPed', 'amb@world_human_bum_standing@drunk@idle_a', 'idle_a', 8.0, 8.0, 15000, -1, 1.0, 0, 0, 1)
    StartScreenEffect("DrugsDrivingIn", 6.0, true)
    --Wait(3000)
    --AnimpostfxPlay("ChopVision", 6.0, true)
    --Wait(3000)
	AnimpostfxPlay("DeathFailMPDark", 6.0, true)
    --Wait(3000)
    SetCamEffect(2)
    SetPedMotionBlur(playerPed, true)
    SetGameplayCamShakeAmplitude(3.0)
    AnimpostfxPlay('HeistCelebPass', 60, false)
    AnimpostfxPlay('MinigameEndTrevor', 60, false)
    AnimpostfxPlay('DrugsMichaelAliensFightIn', 60, false)
    AnimpostfxPlay('DrugsMichaelAliensFight', 60, false)
    AnimpostfxPlay('DrugsMichaelAliensFightOut', 60, false)
    AnimpostfxPlay('DrugsTrevorClownsFightIn', 60, false)
    AnimpostfxPlay('DrugsTrevorClownsFight', 60, false)
    AnimpostfxPlay('PeyoteEndOut', 60, false)
    AnimpostfxPlay('PeyoteEndIn', 60, false)
    AnimpostfxPlay('PeyoteIn', 60, false)
    AnimpostfxPlay('PeyoteOut', 60, false)
    AnimpostfxPlay('DeathFailOut', 60, false)
    AnimpostfxPlay('DeathFailNeutralIn', 60, false)
    --Wait(3000)
    ShakeCam(playerPed, 'FAMILY5_DRUG_TRIP_SHAKE', 9)
    --Wait(3000)
    --ShakeCam(playerPed, 'JOLT_SHAKE', 9)
    Wait(Config.HighTime)
    --SetPedMovementClipset(playerPed, "MOVE_M@DRUNK@VERYDRUNK", 5.0)
    --AnimpostfxPlay("PPPinkOut", 3.0, 0)
	StopScreenEffect("DrugsDrivingIn")
	StopScreenEffect("ChopVision")
	StopScreenEffect("DeathFailMPDark")
    StopScreenEffect("PPPinkOut")
    SetPedMotionBlur(playerPed, false)
    SetCamEffect(0)
    AnimpostfxStopAll()
end