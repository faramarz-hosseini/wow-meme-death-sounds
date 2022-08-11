local sounds = {
    "Interface\\Addons\\MemeDeathSounds\\only-funny-scream.mp3",
    "Interface\\Addons\\MemeDeathSounds\\roblox-death-sound-effect.mp3"
}

local enabled = true 

function Main()
    InitSlashCmds()
end

function InitSlashCmds()
    SLASH_ACTIVATE1 = "/memeActivate"

    SlashCmdList["ACTIVATE"] = ActivationHandler;
end

function ActivationHandler()
    if enabled
    then 
        enabled = false
        print("Meme Death sounds is now off");
    else 
        enabled = true
        print("Memee Death sounds is now on");
    end
end

local frame = CreateFrame("FRAME", "MemeDeathFrame")
frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
function TargetKillEventHandler(self, event, arg1, sub_event, arg2, arg3, arg4, arg5, destName)
    if not enabled then return end

    local sound = sounds[math.random(1, #sounds)]

    local targetName = UnitName("target");
    if sub_event == "UNIT_DIED" and destName == targetName
    then PlaySoundFile(sound);
    end
    
end
frame:SetScript("OnEvent", TargetKillEventHandler)


Main()