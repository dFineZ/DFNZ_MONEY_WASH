fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'DFNZ'
description 'simple moneywash with some animations'
version '1.0.5'

shared_script {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua'
}

client_scripts {
    "config.lua",
    "client/client.lua",
}

server_scripts {
    "config.lua",
    "server/server.lua",
}
