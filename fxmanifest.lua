fx_version 'cerulean'
game { 'gta5' }
lua54 'yes'

version '2.0.0'
description 'Combine Items for FiveM'
author 'TopicElite#0070'

escrow_ignore {
    'client.lua',
    'server.lua',
    'config.lua',
}

client_script 'client.lua'
server_script 'server.lua'
shared_script 'config.lua'