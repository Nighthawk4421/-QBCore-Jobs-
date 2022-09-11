fx_version 'cerulean'
game 'gta5'
author 'Nighthawk'
description 'White widow job created by Nighthawk'



ui_page 'html/index.html'

client_scripts {
    'client.lua',
    'main.lua'
}

server_scripts {
    'server.lua'
}

shared_scripts {
    'config.lua',
    'html/index.html',
    'html/style.css',
    'html/reset.css',
    'html/listener.js',
    'html/announce.js',
    'html/whitewidow.jpg'
}

escrow_ignore {
    'config.lua',
    'ReadMe.md',
    'html/index.html',
    'html/style.css',
    'html/reset.css',
    'html/listener.js',
    'html/whitewidow.jpg'
}

lua54 'yes'