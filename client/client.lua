-----------------For support, scripts, and more----------------
--------------- https://discord.gg/VGYkkAYVv2  -------------
---------------------------------------------------------------

QBCore = nil
local currentRoom 
inMeetingRoom = false
inClassRoom = false
local duiObjmrpdmeeting = nil
local duiObjClassroom = nil
  
RegisterNetEvent("snipe-mrpdscreen:client:OpenUI")
AddEventHandler("snipe-mrpdscreen:client:OpenUI", function(room)
    currentRoom = room
    SendNUIMessage({
        action = "start"
    })
    SetNuiFocus(true, true)
end)

RegisterNUICallback('CloseDocument', function()
    SetNuiFocus(false, false)
end)

RegisterNUICallback('Invalid', function()
    SetNuiFocus(false, false)
    ShowNotification(Config.Locale["invalid"], "error")
end)

RegisterNUICallback('PrintDocument', function(data)
    SetNuiFocus(false, false)
    local url = data.url
    local width = data.width
    local height = data.height

    if Config.RestrictMode then
        local match = false 
        for k, v in pairs(Config.AllowedChannels) do 
            if string.find(data.url, v) ~= nil then
                match = true
                break
            end 
        end
        if not match then
            ShowNotification(Config.Locale["wrong_image"], 'error')
            return
        end
    end

    if currentRoom == "mrpdmeeting" then
        RemoveReplaceTexture("prop_planning_b1", "prop_base_white_01b")
        if duiObjmrpdmeeting then
            DestroyDui(duiObjmrpdmeeting)
        end
    elseif currentRoom == "classroom" then
        RemoveReplaceTexture("gabz_mm_screen", "script_rt_big_disp")
        if duiObjClassroom then
            DestroyDui(duiObjClassroom)
        end
    end
    TriggerServerEvent("snipe-mrpdscreen:server:synctextures", currentRoom, url, width, height)
end)

RegisterNetEvent("snipe-mrpdscreen:client:synctextures")
AddEventHandler("snipe-mrpdscreen:client:synctextures", function(room, url, width, height)
    if room == "mrpdmeeting" and inMeetingRoom then
        local txd = CreateRuntimeTxd('mrpd_meeting_txd')
        duiObjmrpdmeeting = CreateDui(url, width, height)
        local dui = GetDuiHandle(duiObjmrpdmeeting)
        local tx = CreateRuntimeTextureFromDuiHandle(txd, "doc_png", dui)
        AddReplaceTexture('prop_planning_b1', 'prop_base_white_01b', 'mrpd_meeting_txd', "doc_png")
    elseif room == "classroom" and inClassRoom then
        local txd = CreateRuntimeTxd('mrpd_meeting_txd')
        duiObjClassroom = CreateDui(url, width, height)
        local dui = GetDuiHandle(duiObjClassroom)
        local tx = CreateRuntimeTextureFromDuiHandle(txd, "doc_png", dui)
        AddReplaceTexture('gabz_mm_screen', 'script_rt_big_disp', 'mrpd_meeting_txd', "doc_png")
    end
end)


RegisterNetEvent("snipe-mrpdscreen:client:removeDUI")
AddEventHandler("snipe-mrpdscreen:client:removeDUI", function(room)
    TriggerServerEvent("snipe-mrpdscreen:server:removeTextures", room)
end)

RegisterNetEvent("snipe-mrpdscreen:client:removeTextures")
AddEventHandler("snipe-mrpdscreen:client:removeTextures", function(room)
    DestroySpawnedDui(room)
end)

function DestroySpawnedDui(room)
    if room == "mrpdmeeting" then
        if duiObjmrpdmeeting then
            DestroyDui(duiObjmrpdmeeting)
            duiObjmrpdmeeting = nil
            RemoveReplaceTexture("prop_planning_b1", "prop_base_white_01b")
        end
    elseif room == "classroom" then
        if duiObjClassroom then
            DestroyDui(duiObjClassroom)
            duiObjClassroom = nil
            RemoveReplaceTexture("gabz_mm_screen", "script_rt_big_disp")
        end
    end
end

function GetDui(room)
    QBCore.Functions.TriggerCallback("snipe-mrpdscreen:server:returnActiveTexture", function(data)
        if data then
            TriggerEvent("snipe-mrpdscreen:client:synctextures", room ,data.url, data.width, data.height)
        end
    end, room) 
end

-- events for bt-target

RegisterNetEvent("snipe-mrpdscreen:client:OpenUImrpdmeeting")
AddEventHandler("snipe-mrpdscreen:client:OpenUImrpdmeeting", function()
    currentRoom = "mrpdmeeting"
    SendNUIMessage({
        action = "start"
    })
    SetNuiFocus(true, true)
end)

RegisterNetEvent("snipe-mrpdscreen:client:OpenUIclassroom")
AddEventHandler("snipe-mrpdscreen:client:OpenUIclassroom", function()
    currentRoom = "classroom"
    SendNUIMessage({
        action = "start"
    })
    SetNuiFocus(true, true)
end)

RegisterNetEvent("snipe-mrpdscreen:client:removeDUImrpdmeeting")
AddEventHandler("snipe-mrpdscreen:client:removeDUImrpdmeeting", function()
    TriggerServerEvent("snipe-mrpdscreen:server:removeTextures", "mrpdmeeting")
end)

RegisterNetEvent("snipe-mrpdscreen:client:removeDUIclassroom")
AddEventHandler("snipe-mrpdscreen:client:removeDUIclassroom", function()
    TriggerServerEvent("snipe-mrpdscreen:server:removeTextures", "classroom")
end)
