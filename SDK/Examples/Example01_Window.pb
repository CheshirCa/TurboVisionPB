; TurboVisionPB 0.16.8
; (C) CheshirCa 2026
; Binary SDK window example.

EnableExplicit
XIncludeFile "..\Include\TurboVisionPB.pbi"

Define Config.TV_Config
Define Event.TV_Event
Define WindowID.i
Dim VersionBuffer.u(31)

Config\StructureSize = SizeOf(TV_Config)
Config\APIVersion = #TV_API_VERSION
Config\BackendType = #TV_BACKEND_WINDOWS_CONSOLE
Config\ConsoleMode = #TV_CONSOLE_MODE_CURRENT
TV_UseClassicTheme()
TV_ApplyThemeToConfig(@Config)

If TV_SelectBackend(Config\BackendType) = #False Or TV_Init(@Config) = #False: End 1: EndIf
TV_CopyVersionString(@VersionBuffer(), ArraySize(VersionBuffer()) + 1)
TV_SetTitle("TurboVisionPB " + PeekS(@VersionBuffer(), -1, #PB_Unicode) + " - binary SDK window")
WindowID = TV_CreateWindow(0, 0, 50, 12, "Public SDK",
                           #TV_WINDOW_VISIBLE | #TV_WINDOW_ENABLED | #TV_WINDOW_BORDER |
                           #TV_WINDOW_TITLE | #TV_WINDOW_SHADOW | #TV_WINDOW_CENTERED |
                           #TV_WINDOW_SYSTEM_MENU | #TV_WINDOW_ESC_CLOSE)
CompilerIf Defined(TV_STANDALONE_EXAMPLE, #PB_Constant)
  TV_CreateLabel(WindowID, 3, 3, "This packaged example is a standalone executable.")
CompilerElse
  TV_CreateLabel(WindowID, 3, 3, "The SDK source example uses TurboVisionPB.dll.")
CompilerEndIf
TV_CreateButton(WindowID, 18, 7, 12, "Close", #TV_CMD_CLOSE)

While TV_IsRunning()
  While TV_PollEvent(@Event)
    TV_DispatchEvent(@Event)
    If Event\Type = #TV_EVENT_COMMAND And Event\Command = #TV_CMD_CLOSE: TV_Stop(): EndIf
  Wend
  TV_Render()
  Delay(10)
Wend
TV_Shutdown()
