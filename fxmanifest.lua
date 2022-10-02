fx_version 'cerulean'
game 'gta5'

author 'Snipe'
description 'Script for Screen UI for mrpd with target'
version '1.1.0'

lua54 'yes'

ui_page "html/index.html"

shared_scripts{
	'config.lua',
}

server_scripts {
	'server/server.lua',
}

client_scripts {
	'@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
	'client/client.lua',
	'client/target.lua',
	'client/utils.lua',
	'client/zones.lua',
}

files {
    '*.lua',
    'html/*.html',
    'html/*.js',
    'html/*.css',
    'html/*.png',
}
