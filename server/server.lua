-----------------For support, scripts, and more----------------
--------------- https://discord.gg/VGYkkAYVv2  -------------
---------------------------------------------------------------
QBCore = nil
local ScreenInfo = {}

if Config.OldQBCore then
    TriggerEvent(Config.Core..':GetObject', function(obj) QBCore = obj end)
else
    QBCore = exports[Config.CoreFolderName]:GetCoreObject()
end

RegisterServerEvent("snipe-mrpdscreen:server:synctextures")
AddEventHandler("snipe-mrpdscreen:server:synctextures", function(room, url, width, height)
    local source = source
    local info = {}
    info.url = url
    info.width = width
    info.height = height
    ScreenInfo[room] = info
    TriggerClientEvent("snipe-mrpdscreen:client:synctextures", -1, room, url, width, height)
end)

RegisterServerEvent("snipe-mrpdscreen:server:removeTextures")
AddEventHandler("snipe-mrpdscreen:server:removeTextures", function(room)
    ScreenInfo[room] = nil
    TriggerClientEvent("snipe-mrpdscreen:client:removeTextures", -1, room)
end)

QBCore.Functions.CreateCallback('snipe-mrpdscreen:server:returnActiveTexture', function(source, cb, room)
	cb(ScreenInfo[room])
end)
