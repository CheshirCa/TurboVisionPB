; TurboVisionPB 0.16.9
; (C) CheshirCa 2026
; Binary SDK classic desktop demo.

EnableExplicit
XIncludeFile "..\Include\TurboVisionPB.pbi"

#CMD_EDITOR         = #TV_CMD_USER + 1100
#CMD_CALENDAR       = #TV_CMD_USER + 1101
#CMD_CALCULATOR     = #TV_CMD_USER + 1102
#CMD_CLOCK_DATETIME = #TV_CMD_USER + 1103
#CMD_EXIT           = #TV_CMD_USER + 1104

Global EditorWindow.i
Global EditorArea.i
Global CalendarWindow.i
Global CalculatorWindow.i

Procedure UpdateScreenStatus()
  Protected Width.i
  Protected Height.i

  If TV_GetScreenSize(@Width, @Height)
    TV_SetStatusBarRightText("Hello world!  " + Str(Width) + "x" + Str(Height))
  EndIf
EndProcedure

Procedure CreateEditor()
  If TV_IsWindowValid(EditorWindow): TV_ActivateWindow(EditorWindow): ProcedureReturn: EndIf
  EditorWindow = TV_CreateWindow(30, 2, 48, 18, "Editor - README.txt",
                                 #TV_WINDOW_VISIBLE | #TV_WINDOW_ENABLED | #TV_WINDOW_BORDER |
                                 #TV_WINDOW_TITLE | #TV_WINDOW_SHADOW | #TV_WINDOW_SYSTEM_MENU |
                                 #TV_WINDOW_ESC_CLOSE | #TV_WINDOW_MOVABLE | #TV_WINDOW_RESIZABLE)
  EditorArea = TV_CreateTextArea(EditorWindow, 1, 1, 44, 13, 4000)
  TV_SetTextAreaText(EditorArea, "TurboVisionPB binary SDK demo" + #LF$ + #LF$ +
    "Calendar and Calculator are ready-made library windows." + #LF$ +
    "They keep their fixed size during Cascade/Tile." + #LF$ +
    "Use Window/Cascade or Window/Tile to arrange the editor.")
EndProcedure

Procedure ShowCalendarWindow()
  If TV_IsWindowValid(CalendarWindow)
    TV_ActivateWindow(CalendarWindow)
  Else
    CalendarWindow = TV_ShowCalendar()
    TV_MoveWindow(CalendarWindow, 1, 2)
  EndIf
EndProcedure

Procedure ShowCalculatorWindow()
  If TV_IsWindowValid(CalculatorWindow)
    TV_ActivateWindow(CalculatorWindow)
  Else
    CalculatorWindow = TV_ShowCalculator()
    TV_MoveWindow(CalculatorWindow, 8, 6)
  EndIf
EndProcedure

Define Config.TV_Config
Define Event.TV_Event
Define MenuID.i
Define Width.i
Define Height.i
Define X.i
Define Y.i
Dim VersionBuffer.u(31)

Config\StructureSize = SizeOf(TV_Config)
Config\APIVersion = #TV_API_VERSION
Config\BackendType = #TV_BACKEND_WINDOWS_CONSOLE
Config\ConsoleMode = #TV_CONSOLE_MODE_CURRENT
TV_UseClassicTheme()
TV_ApplyThemeToConfig(@Config)
If TV_SelectBackend(Config\BackendType) = #False Or TV_Init(@Config) = #False: End 1: EndIf
TV_CopyVersionString(@VersionBuffer(), ArraySize(VersionBuffer()) + 1)
TV_SetTitle("TurboVisionPB " + PeekS(@VersionBuffer(), -1, #PB_Unicode) + " - binary SDK classic desktop demo")

MenuID = TV_CreateMenu("&File")
TV_AddMenuItem(MenuID, "&Editor", #CMD_EDITOR)
TV_AddMenuItem(MenuID, "&Calendar", #CMD_CALENDAR)
TV_AddMenuItem(MenuID, "C&alculator", #CMD_CALCULATOR)
TV_AddMenuSeparator(MenuID)
TV_AddMenuItem(MenuID, "E&xit", #CMD_EXIT, 'X', #TV_MOD_ALT)
MenuID = TV_CreateMenu("&Window")
TV_AddMenuItem(MenuID, "&Next", #TV_CMD_NEXT_WINDOW, #TV_KEY_F6, #TV_MOD_CTRL)
TV_AddMenuItem(MenuID, "&Cascade", #TV_CMD_CASCADE)
TV_AddMenuItem(MenuID, "&Tile", #TV_CMD_TILE)
MenuID = TV_CreateMenu("&Options")
TV_AddMenuItem(MenuID, "&Date + time", #CMD_CLOCK_DATETIME)

TV_AddStatusItem("&Alt-X Exit", #CMD_EXIT, 'X', #TV_MOD_ALT)
UpdateScreenStatus()
TV_SetDesktopClock(#TV_DESKTOP_CLOCK_TIME, #TV_DESKTOP_CLOCK_MENU)
TV_CreateDesktopText(2, 21, "Turbo Vision style desktop", #TV_COLOR_BLUE, Config\DesktopBackground)
CreateEditor()
ShowCalendarWindow()
ShowCalculatorWindow()

While TV_IsRunning()
  While TV_PollEvent(@Event)
    TV_DispatchEvent(@Event)
    If Event\Type = #TV_EVENT_RESIZE
      If Event\Source = 0
        UpdateScreenStatus()
      ElseIf Event\Source = EditorWindow
        If TV_GetWindowGeometry(EditorWindow, @X, @Y, @Width, @Height)
          TV_ResizeControl(EditorArea, 1, 1, Width - 4, Height - 4)
        EndIf
      EndIf
    ElseIf Event\Type = #TV_EVENT_COMMAND
      Select Event\Command
        Case #CMD_EDITOR: CreateEditor()
        Case #CMD_CALENDAR: ShowCalendarWindow()
        Case #CMD_CALCULATOR: ShowCalculatorWindow()
        Case #CMD_CLOCK_DATETIME
          TV_SetDesktopClock(#TV_DESKTOP_CLOCK_DATE_TIME, #TV_DESKTOP_CLOCK_MENU)
        Case #TV_CMD_CLOSE
          If Event\Source = EditorWindow And TV_IsWindowValid(EditorWindow)
            TV_CloseWindow(EditorWindow)
          EndIf
        Case #CMD_EXIT: TV_Stop()
      EndSelect
    EndIf
    If EditorWindow And TV_IsWindowValid(EditorWindow) = #False: EditorWindow = 0: EditorArea = 0: EndIf
    If CalendarWindow And TV_IsWindowValid(CalendarWindow) = #False: CalendarWindow = 0: EndIf
    If CalculatorWindow And TV_IsWindowValid(CalculatorWindow) = #False: CalculatorWindow = 0: EndIf
  Wend
  TV_Render()
  Delay(10)
Wend
TV_Shutdown()
