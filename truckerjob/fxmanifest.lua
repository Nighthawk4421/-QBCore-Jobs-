fx_version 'cerulean'
game 'gta5'
author 'Nighthawk'
description 'Trucker Job by Nighthawk'

client_scripts {
    'client.lua',
}

shared_scripts {
    'config.lua',
}

server_scripts {
    'server.lua',
}



--[[
    ['trucker'] = {
        label = 'trucker',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Entry Level Warehouse',
                payment = 650
            },
            ['1'] = {
                name = 'Warehouse Inventory',
                payment = 800
            },
            ['2'] = {
                name = 'Driver',
                payment = 1500
            },
            ['3'] = {
                name = 'Boss',
                isboss = true,
                payment = 3500
            }
        }
    },
]]