resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

description 'Lux:HUD'

server_scripts {
	"config.lua",
	"server/money.lua",
	"server/main.lua",
}

client_scripts {
	"config.lua",
	"client/ui.lua",
	"client/money.lua",
	"client/main.lua",
}

ui_page {
	'html/ui.html',	
}

exports {
	'SetSeatbelt',
}

files {
	'html/*.png',
	'html/*.svg',
	'html/*.html',
	'html/ui.html',
	"html/img/*.svg",
	'html/css/main.css',
	'html/css/pricedown_bl-webfont.ttf',
	'html/css/pricedown_bl-webfont.woff',
	'html/css/pricedown_bl-webfont.woff2',
	'html/css/gta-ui.ttf',
	'html/js/app.js',
	'html/js/*.js',
	'html/css/pdown.ttf',
	'html/css/*.css',
	'html/css/*.ttf',
	'html/css/*.woff',
	'html/css/*.woff2',
}