-----------------For support, scripts, and more----------------
--------------- https://discord.gg/VGYkkAYVv2  -------------
---------------------------------------------------------------
if Config.OldQBCore then
    Citizen.CreateThread(function()
        while QBCore == nil do
            TriggerEvent(Config.Core..':GetObject', function(obj) QBCore = obj end)
            Citizen.Wait(200)
        end
    end)
else
    QBCore = exports[Config.CoreFolderName]:GetCoreObject()
end

RegisterNetEvent(Config.Core..':Client:OnPlayerUnload', function()
    ResetAll()
end)

function ResetAll()
    RemoveReplaceTexture("prop_planning_b1", "prop_base_white_01b")
    if duiObjmrpdmeeting then
        DestroyDui(duiObjmrpdmeeting)
    end
    RemoveReplaceTexture("gabz_mm_screen", "script_rt_big_disp")
    if duiObjClassroom then
        DestroyDui(duiObjClassroom)
    end
    currentRoom = nil
    inMeetingRoom = false
    inClassRoom = false
    duiObjmrpdmeeting = nil
    duiObjClassroom = nil
end

function ShowNotification(msg, type)
    if Config.Notify['QBCore'] then
        QBCore.Functions.Notify(msg, type)
    elseif Config.Notify['okokNotify'] then
        exports['okokNotify']:Alert(Config.OkOkNotifyTitle, msg, 5000, type)
    elseif Config.Notify['pNotify'] then
        exports.pNotify:SendNotification({text = msg, type = type, layout = Config.pNotifyLayout, timeout = 5000})
    end
end

AddEventHandler('onResourceStop', function(resName)
    if resName == "snipe-mrpdscreen" then
        RemoveReplaceTexture("prop_planning_b1", "prop_base_white_01b")
        RemoveReplaceTexture("gabz_mm_screen", "script_rt_big_disp")
        if duiObjClassroom then
            DestroyDui(duiObjClassroom)
        end
        if duiObjmrpdmeeting then
            DestroyDui(duiObjmrpdmeeting)
        end
    end
end)
