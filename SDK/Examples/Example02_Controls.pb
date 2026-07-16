; TurboVisionPB 0.16.8
; (C) CheshirCa 2026
; Binary SDK controls example.

EnableExplicit
XIncludeFile "..\Include\TurboVisionPB.pbi"

#CMD_SHOW = #TV_CMD_USER + 1

Define Config.TV_Config
Define Event.TV_Event
Define WindowID.i
Define InputID.i
Define ComboID.i
Define IPv4ID.i
Define TrackID.i
Define ProgressID.i
Define DesktopTextID.i
Dim VersionBuffer.u(31)

Config\StructureSize = SizeOf(TV_Config)
Config\APIVersion = #TV_API_VERSION
Config\BackendType = #TV_BACKEND_WINDOWS_CONSOLE
Config\ConsoleMode = #TV_CONSOLE_MODE_CURRENT
TV_UseClassicTheme()
TV_ApplyThemeToConfig(@Config)
If TV_SelectBackend(Config\BackendType) = #False Or TV_Init(@Config) = #False: End 1: EndIf
TV_CopyVersionString(@VersionBuffer(), ArraySize(VersionBuffer()) + 1)
TV_SetTitle("TurboVisionPB " + PeekS(@VersionBuffer(), -1, #PB_Unicode) + " - binary SDK controls")

DesktopTextID = TV_CreateDesktopText(2, 2, "Static desktop text",
                                     #TV_COLOR_BLUE, Config\DesktopBackground)

WindowID = TV_CreateWindow(0, 0, 70, 22, "Controls",
                           #TV_WINDOW_VISIBLE | #TV_WINDOW_ENABLED | #TV_WINDOW_BORDER |
                           #TV_WINDOW_TITLE | #TV_WINDOW_SHADOW | #TV_WINDOW_CENTERED |
                           #TV_WINDOW_ESC_CLOSE)
TV_CreateLabel(WindowID, 2, 2, "Name:")
InputID = TV_CreateInput(WindowID, 10, 2, 24, 60)
TV_SetInputText(InputID, "SDK user")
TV_CreateCheckBox(WindowID, 2, 4, "Enabled", #True)
ComboID = TV_CreateComboBox(WindowID, 22, 4, 25, 4)
TV_ComboBoxAddItem(ComboID, "Windows Console")
TV_ComboBoxAddItem(ComboID, "Serial - in development")
TV_CreateLabel(WindowID, 2, 7, "IPv4:")
IPv4ID = TV_CreateIPv4Input(WindowID, 10, 7, "192.168.1.10")
TV_CreateSwitch(WindowID, 30, 7, "Edit address", #True)
ProgressID = TV_CreateProgressBar(WindowID, 2, 10, 28, 0, 100, 50)
TrackID = TV_CreateTrackBar(WindowID, 34, 10, 28, 0, 100, 50, 5)
TV_CreateHyperlink(WindowID, 2, 13, "Show information", #CMD_SHOW)
TV_CreateButton(WindowID, 45, 13, 12, "Close", #TV_CMD_CLOSE)
TV_CreateBevelFrame(WindowID, 2, 15, 28, 3, #TV_BEVEL_RAISED)
TV_CreateLabel(WindowID, 4, 16, "Raised frame")
TV_CreateBevelFrame(WindowID, 34, 15, 28, 3, #TV_BEVEL_SUNKEN)
TV_CreateLabel(WindowID, 36, 16, "Sunken frame")

While TV_IsRunning()
  While TV_PollEvent(@Event)
    TV_DispatchEvent(@Event)
    If Event\Type = #TV_EVENT_COMMAND
      Select Event\Command
        Case #CMD_SHOW
          TV_ShowMessageBox("Public SDK", "All controls are provided by the binary DLL.", #TV_MSGBOX_OK, 0)
        Case #TV_CMD_CLOSE
          TV_Stop()
      EndSelect
    EndIf
    TV_SetProgressBarValue(ProgressID, TV_GetTrackBarValue(TrackID))
  Wend
  TV_Render()
  Delay(10)
Wend
TV_Shutdown()
