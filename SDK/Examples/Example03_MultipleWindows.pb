; TurboVisionPB 0.16.8
; (C) CheshirCa 2026
; Binary SDK multiple-window example.

EnableExplicit
XIncludeFile "..\Include\TurboVisionPB.pbi"

Define Config.TV_Config
Define Event.TV_Event
Define First.i
Define Second.i
Dim VersionBuffer.u(31)

Config\StructureSize = SizeOf(TV_Config)
Config\APIVersion = #TV_API_VERSION
Config\BackendType = #TV_BACKEND_WINDOWS_CONSOLE
Config\ConsoleMode = #TV_CONSOLE_MODE_CURRENT
TV_UseClassicTheme()
TV_ApplyThemeToConfig(@Config)
If TV_SelectBackend(Config\BackendType) = #False Or TV_Init(@Config) = #False: End 1: EndIf
TV_CopyVersionString(@VersionBuffer(), ArraySize(VersionBuffer()) + 1)
TV_SetTitle("TurboVisionPB " + PeekS(@VersionBuffer(), -1, #PB_Unicode) + " - binary SDK windows")

First = TV_CreateWindow(4, 3, 38, 10, "First",
                        #TV_WINDOW_VISIBLE | #TV_WINDOW_ENABLED | #TV_WINDOW_BORDER |
                        #TV_WINDOW_TITLE | #TV_WINDOW_SHADOW | #TV_WINDOW_SYSTEM_MENU)
TV_CreateLabel(First, 2, 3, "Ctrl+F6 selects the next window.")
Second = TV_CreateWindow(24, 7, 40, 11, "Second",
                         #TV_WINDOW_VISIBLE | #TV_WINDOW_ENABLED | #TV_WINDOW_BORDER |
                         #TV_WINDOW_TITLE | #TV_WINDOW_SHADOW | #TV_WINDOW_SYSTEM_MENU)
TV_CreateLabel(Second, 2, 3, "Alt+F5 toggles Zoom / Restore.")
TV_CreateButton(Second, 14, 7, 12, "Close", #TV_CMD_CLOSE)

While TV_IsRunning()
  While TV_PollEvent(@Event)
    TV_DispatchEvent(@Event)
    If Event\Type = #TV_EVENT_COMMAND And Event\Command = #TV_CMD_CLOSE
      If TV_IsWindowValid(Event\Source): TV_CloseWindow(Event\Source): Else: TV_Stop(): EndIf
      If TV_GetActiveWindow() = 0: TV_Stop(): EndIf
    EndIf
  Wend
  TV_Render()
  Delay(10)
Wend
TV_Shutdown()
