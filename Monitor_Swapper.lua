local Swap = function()
    local newMonitor = GetCVar("gxMonitor") + 1
    if newMonitor >= GetMonitorCount() then
        newMonitor = 1
    end
    SetCVar('gxMonitor', newMonitor)

    C_VideoOptions.SetGameWindowSize(0, 0)
    UpdateWindow()
end

local LDB = LibStub and LibStub("LibDataBroker-1.1", true)
if LDB then
    MonitorSwapper = LDB:NewDataObject("Monitor_Swapper", {
        type = "launcher",
        label = "Monitor Swapper",
        icon = "Interface\\QuestFrame\\UI-QuestLog-BookIcon",
        OnClick = Swap
    })
end

SLASH_MONITORSWAP1 = "/monswap"
SlashCmdList["MONITORSWAP"] = Swap
