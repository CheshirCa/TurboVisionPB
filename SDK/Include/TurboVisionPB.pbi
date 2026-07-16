; TurboVisionPB 0.16.8
; (C) CheshirCa 2026
; Binary public SDK contract. No implementation is included.

#TV_VERSION_MAJOR = 0
#TV_VERSION_MINOR = 16
#TV_VERSION_PATCH = 8
#TV_VERSION_BUILD = 0
#TV_VERSION_STRING = "0.16.8"
#TV_API_VERSION = $00100800
#TV_COPYRIGHT = "(C) CheshirCa 2026"

Enumeration
  #TV_BACKEND_NONE
  #TV_BACKEND_WINDOWS_CONSOLE
  #TV_BACKEND_SERIAL_ESP
  #TV_BACKEND_ANSI
EndEnumeration

Enumeration
  #TV_CONSOLE_MODE_AUTO
  #TV_CONSOLE_MODE_CURRENT
  #TV_CONSOLE_MODE_NEW
EndEnumeration

Enumeration
  #TV_COLOR_BLACK
  #TV_COLOR_BLUE
  #TV_COLOR_GREEN
  #TV_COLOR_CYAN
  #TV_COLOR_RED
  #TV_COLOR_MAGENTA
  #TV_COLOR_BROWN
  #TV_COLOR_LIGHTGRAY
  #TV_COLOR_DARKGRAY
  #TV_COLOR_LIGHTBLUE
  #TV_COLOR_LIGHTGREEN
  #TV_COLOR_LIGHTCYAN
  #TV_COLOR_LIGHTRED
  #TV_COLOR_LIGHTMAGENTA
  #TV_COLOR_YELLOW
  #TV_COLOR_WHITE
EndEnumeration

Enumeration
  #TV_FRAME_ASCII
  #TV_FRAME_SINGLE
  #TV_FRAME_DOUBLE
EndEnumeration

Enumeration
  #TV_EVENT_NONE
  #TV_EVENT_KEY_DOWN
  #TV_EVENT_KEY_UP
  #TV_EVENT_CHAR
  #TV_EVENT_MOUSE_MOVE
  #TV_EVENT_MOUSE_DOWN
  #TV_EVENT_MOUSE_UP
  #TV_EVENT_MOUSE_WHEEL
  #TV_EVENT_TOUCH_DOWN
  #TV_EVENT_TOUCH_UP
  #TV_EVENT_TOUCH_MOVE
  #TV_EVENT_COMMAND
  #TV_EVENT_RESIZE
  #TV_EVENT_CONNECT
  #TV_EVENT_DISCONNECT
  #TV_EVENT_CLOSE
  #TV_EVENT_ERROR
EndEnumeration

#TV_MOD_SHIFT = 1
#TV_MOD_CTRL  = 2
#TV_MOD_ALT   = 4

Enumeration
  #TV_MOUSE_BUTTON_NONE
  #TV_MOUSE_BUTTON_LEFT
  #TV_MOUSE_BUTTON_RIGHT
  #TV_MOUSE_BUTTON_MIDDLE
EndEnumeration

#TV_KEY_ESCAPE = 27
#TV_KEY_ENTER  = 13
#TV_KEY_TAB    = 9
#TV_KEY_BACKSPACE = 8
#TV_KEY_SPACE = 32
#TV_KEY_PAGE_UP = $21
#TV_KEY_PAGE_DOWN = $22
#TV_KEY_END = $23
#TV_KEY_HOME = $24
#TV_KEY_LEFT = $25
#TV_KEY_UP = $26
#TV_KEY_RIGHT = $27
#TV_KEY_DOWN = $28
#TV_KEY_DELETE = $2E
#TV_KEY_F1 = $70
#TV_KEY_F2 = $71
#TV_KEY_F3 = $72
#TV_KEY_F4 = $73
#TV_KEY_F5 = $74
#TV_KEY_F6 = $75
#TV_KEY_F7 = $76
#TV_KEY_F8 = $77
#TV_KEY_F9 = $78
#TV_KEY_F10 = $79
#TV_KEY_F11 = $7A
#TV_KEY_F12 = $7B

#TV_WINDOW_VISIBLE      = 1
#TV_WINDOW_ENABLED      = 2
#TV_WINDOW_BORDER       = 4
#TV_WINDOW_TITLE        = 8
#TV_WINDOW_SHADOW       = 16
#TV_WINDOW_MODAL        = 32
#TV_WINDOW_CLOSE_BUTTON = 64
#TV_WINDOW_CENTERED     = 128
#TV_WINDOW_ESC_CLOSE    = 256
#TV_WINDOW_DOUBLE_BORDER = 512
#TV_WINDOW_SYSTEM_MENU  = 1024
#TV_WINDOW_RESIZABLE    = 2048
#TV_WINDOW_MOVABLE      = 4096

Enumeration
  #TV_CONTROL_LABEL
  #TV_CONTROL_BUTTON
  #TV_CONTROL_INPUT
  #TV_CONTROL_CHECKBOX
  #TV_CONTROL_LISTBOX
  #TV_CONTROL_RADIOBUTTON
  #TV_CONTROL_GROUPBOX
  #TV_CONTROL_TEXTAREA
  #TV_CONTROL_NUMBERINPUT
  #TV_CONTROL_COMBOBOX
  #TV_CONTROL_HYPERLINK
  #TV_CONTROL_IPV4INPUT
  #TV_CONTROL_PROGRESSBAR
  #TV_CONTROL_TRACKBAR
  #TV_CONTROL_SWITCH
  #TV_CONTROL_BEVELFRAME
EndEnumeration

#TV_CONTROL_STYLE_RAISED  = 1
#TV_CONTROL_STYLE_FLAT    = 2
#TV_CONTROL_STYLE_DEFAULT = 4

#TV_BEVEL_RAISED = 1
#TV_BEVEL_SUNKEN = 2

Enumeration
  #TV_DESKTOP_CLOCK_OFF
  #TV_DESKTOP_CLOCK_TIME
  #TV_DESKTOP_CLOCK_DATE_TIME
EndEnumeration

Enumeration 1
  #TV_DESKTOP_CLOCK_MENU
  #TV_DESKTOP_CLOCK_STATUS
EndEnumeration

#TV_CONTROL_STATE_NONE = 0
#TV_CONTROL_STATE_CHECKED = 1

Enumeration
  #TV_CMD_NONE
  #TV_CMD_OK
  #TV_CMD_CANCEL
  #TV_CMD_CLOSE
  #TV_CMD_YES
  #TV_CMD_NO
  #TV_CMD_APPLY
  #TV_CMD_MENU
  #TV_CMD_NEXT_WINDOW
  #TV_CMD_ZOOM
  #TV_CMD_RESTORE
  #TV_CMD_FILE_DIALOG_DONE
  #TV_CMD_CASCADE
  #TV_CMD_TILE
EndEnumeration
#TV_CMD_USER = 1000

Enumeration
  #TV_FILE_DIALOG_OPEN
  #TV_FILE_DIALOG_SAVE
EndEnumeration

Enumeration
  #TV_FILE_DIALOG_PENDING
  #TV_FILE_DIALOG_ACCEPTED
  #TV_FILE_DIALOG_CANCELLED
EndEnumeration

Enumeration
  #TV_MSGBOX_OK
  #TV_MSGBOX_OK_CANCEL
  #TV_MSGBOX_YES_NO
  #TV_MSGBOX_YES_NO_CANCEL
EndEnumeration

Enumeration
  #TV_RESULT_NONE
  #TV_RESULT_OK
  #TV_RESULT_CANCEL
  #TV_RESULT_YES
  #TV_RESULT_NO
EndEnumeration

Enumeration
  #TV_ERROR_NONE
  #TV_ERROR_NOT_INITIALIZED
  #TV_ERROR_ALREADY_INITIALIZED
  #TV_ERROR_INVALID_BACKEND
  #TV_ERROR_BACKEND_NOT_CONNECTED
  #TV_ERROR_INVALID_WINDOW
  #TV_ERROR_INVALID_CONTROL
  #TV_ERROR_INVALID_PARAMETER
  #TV_ERROR_CONSOLE_API
  #TV_ERROR_SERIAL_OPEN
  #TV_ERROR_SERIAL_WRITE
  #TV_ERROR_SERIAL_READ
  #TV_ERROR_SERIAL_TIMEOUT
  #TV_ERROR_PROTOCOL
  #TV_ERROR_CRC
  #TV_ERROR_UNSUPPORTED_PROTOCOL
  #TV_ERROR_OUT_OF_MEMORY
  #TV_ERROR_FILE_NOT_FOUND
EndEnumeration

#TV_MIN_SCREEN_WIDTH  = 40
#TV_MIN_SCREEN_HEIGHT = 15
#TV_DEFAULT_DESKTOP_CHARACTER = 32
#TV_DEFAULT_DESKTOP_FOREGROUND = #TV_COLOR_LIGHTGRAY
#TV_DEFAULT_DESKTOP_BACKGROUND = #TV_COLOR_BLUE

#TV_CHARSET_CP437 = 0
#TV_CHARSET_UTF8  = 1
Structure TV_Cell
  Character.u
  Foreground.a
  Background.a
  Attributes.a
EndStructure

Structure TV_Event
  Type.i
  KeyCode.i
  ScanCode.i
  Character.u
  Modifiers.i
  MouseX.i
  MouseY.i
  MouseButton.i
  MouseWheel.i
  Command.i
  Source.i
  Timestamp.q
EndStructure

Structure TV_Config
  StructureSize.i
  APIVersion.i
  BackendType.i
  ScreenWidth.i
  ScreenHeight.i
  DesktopCharacter.u
  DesktopForeground.a
  DesktopBackground.a
  EnableMouse.i
  EnablePartialUpdates.i
  UserData.i
  ConsoleMode.i
EndStructure

Structure TV_Theme
  Name.s
  DesktopCharacter.u
  DesktopForeground.a
  DesktopBackground.a
  WindowForeground.a
  WindowBackground.a
  ActiveFrameForeground.a
  ActiveFrameBackground.a
  InactiveFrameForeground.a
  InactiveFrameBackground.a
  TitleForeground.a
  TitleBackground.a
  ShadowCharacter.u
  ShadowForeground.a
  ShadowBackground.a
  ButtonForeground.a
  ButtonBackground.a
  ButtonFocusedForeground.a
  ButtonFocusedBackground.a
  ButtonShadowForeground.a
  ButtonShadowBackground.a
  InputForeground.a
  InputBackground.a
  SelectionForeground.a
  SelectionBackground.a
  MenuForeground.a
  MenuBackground.a
  MenuHotForeground.a
  StatusForeground.a
  StatusBackground.a
EndStructure

#TV_CONFIG_STRUCTURE_VERSION = 1

CompilerIf #PB_Compiler_OS <> #PB_OS_Windows
  CompilerError "TurboVisionPB 0.16.8 public SDK supports Windows only."
CompilerEndIf
CompilerIf #PB_Compiler_Processor = #PB_Processor_x64
  ImportC "..\Lib\x64\TurboVisionPB.lib"
CompilerElse
  ImportC "..\Lib\x86\TurboVisionPB.lib"
CompilerEndIf
    TV_CheckAPIVersion.i(ExpectedVersion.i)
    TV_Init.i(*Config.TV_Config)
    TV_InitEx.i(*Config.TV_Config, ExpectedAPIVersion.i)
    TV_ApplyThemeToConfig.i(*Config.TV_Config)
    TV_ActivateNextWindow.i()
    TV_ActivateWindow.i(WindowID.i)
    TV_AddMenuItem.i(MenuID.i, Text.s, Command.i, ShortcutKey.i = 0, Modifiers.i = 0, Enabled.i = #True)
    TV_AddMenuSeparator.i(MenuID.i)
    TV_AddStatusItem.i(Text.s, Command.i, ShortcutKey.i = 0, Modifiers.i = 0, Enabled.i = #True)
    TV_BackendGetScreenSize.i(*Width.Integer, *Height.Integer)
    TV_BackendIsConnected.i()
    TV_BackendRequestFullRedraw()
    TV_CascadeWindows.i()
    TV_Clear.i(Character.i, Foreground.i, Background.i)
    TV_ClearDesktopTexts()
    TV_ClearMenus()
    TV_ClearStatusItems()
    TV_CloseFileDialog.i(DialogID.i)
    TV_CloseWindow.i(WindowID.i)
    TV_ComboBoxAddItem.i(ControlID.i, Text.s)
    TV_ComboBoxClear.i(ControlID.i)
    TV_ComboBoxDeleteItem.i(ControlID.i, Index.i)
    TV_ComboBoxGetCurrent.i(ControlID.i)
    TV_ComboBoxGetItemCount.i(ControlID.i)
    TV_ComboBoxIsOpen.i(ControlID.i)
    TV_ComboBoxSetCurrent.i(ControlID.i, Index.i)
    TV_CreateBevelFrame.i(WindowID.i, X.i, Y.i, Width.i, Height.i, Style.i)
    TV_CreateButton.i(WindowID.i, X.i, Y.i, Width.i, Text.s, Command.i)
    TV_CreateCheckBox.i(WindowID.i, X.i, Y.i, Text.s, Checked.i)
    TV_CreateComboBox.i(WindowID.i, X.i, Y.i, Width.i, DropDownHeight.i, Command.i = #TV_CMD_NONE)
    TV_CreateDesktopText.i(X.i, Y.i, Text.s, Foreground.i, Background.i)
    TV_CreateGroupBox.i(WindowID.i, X.i, Y.i, Width.i, Height.i, Text.s)
    TV_CreateHyperlink.i(WindowID.i, X.i, Y.i, Text.s, Command.i)
    TV_CreateInput.i(WindowID.i, X.i, Y.i, Width.i, MaxLength.i)
    TV_CreateIPv4Input.i(WindowID.i, X.i, Y.i, Address.s = "0.0.0.0", ReadOnly.i = #False)
    TV_CreateLabel.i(WindowID.i, X.i, Y.i, Text.s)
    TV_CreateListBox.i(WindowID.i, X.i, Y.i, Width.i, Height.i)
    TV_CreateMenu.i(Title.s)
    TV_CreateNumberInput.i(WindowID.i, X.i, Y.i, Width.i, Minimum.q, Maximum.q, Value.q, StepValue.q = 1)
    TV_CreateProgressBar.i(WindowID.i, X.i, Y.i, Width.i, Minimum.q, Maximum.q, Value.q)
    TV_CreateRadioButton.i(WindowID.i, X.i, Y.i, Text.s, GroupID.i, Selected.i)
    TV_CreateSwitch.i(WindowID.i, X.i, Y.i, Text.s, Checked.i, Command.i = #TV_CMD_NONE)
    TV_CreateTextArea.i(WindowID.i, X.i, Y.i, Width.i, Height.i, MaxLength.i = 0)
    TV_CreateTrackBar.i(WindowID.i, X.i, Y.i, Width.i, Minimum.q, Maximum.q, Value.q, StepValue.q = 1, Command.i = #TV_CMD_NONE)
    TV_CreateWindow.i(X.i, Y.i, Width.i, Height.i, Title.s, Flags.i)
    TV_DispatchEvent.i(*Event.TV_Event)
    TV_DrawFrame.i(X.i, Y.i, Width.i, Height.i, Style.i, Foreground.i, Background.i)
    TV_DrawShadow.i(X.i, Y.i, Width.i, Height.i)
    TV_DrawText.i(X.i, Y.i, Text.s, Foreground.i, Background.i)
    TV_EnableControl.i(ControlID.i, Enabled.i)
    TV_EnableMenuItem.i(ItemID.i, Enabled.i)
    TV_EnableStatusItem.i(ItemID.i, Enabled.i)
    TV_EnableWindow.i(WindowID.i, Enabled.i)
    TV_EndModal.i(WindowID.i, Result.i)
    TV_FillRect.i(X.i, Y.i, Width.i, Height.i, Character.i, Foreground.i, Background.i)
    TV_GetActiveWindow.i()
    TV_GetAPIVersion.i()
    TV_GetBackendType.i()
    TV_GetCalendarDate.q(WindowID.i)
    TV_GetCell.i(X.i, Y.i, *Cell.TV_Cell)
    TV_GetCheckBoxState.i(ControlID.i)
    TV_GetControlGeometry.i(ControlID.i, *X.Integer, *Y.Integer, *Width.Integer, *Height.Integer)
    TV_GetFileDialogStatus.i(DialogID.i)
    TV_GetLastError.i()
    TV_GetModalResult.i(WindowID.i)
    TV_GetNumberInputValue.q(ControlID.i)
    TV_GetProgressBarValue.q(ControlID.i)
    TV_GetRadioButtonState.i(ControlID.i)
    TV_GetScreenSize.i(*Width.Integer, *Height.Integer)
    TV_GetSwitchState.i(ControlID.i)
    TV_GetTheme.i(*Theme.TV_Theme)
    TV_GetTrackBarValue.q(ControlID.i)
    TV_GetVersionMajor.i()
    TV_GetVersionMinor.i()
    TV_GetVersionPatch.i()
    TV_GetWindowGeometry.i(WindowID.i, *X.Integer, *Y.Integer, *Width.Integer, *Height.Integer)
    TV_HideWindow.i(WindowID.i)
    TV_IsControlEnabled.i(ControlID.i)
    TV_IsControlVisible.i(ControlID.i)
    TV_IsIPv4ReadOnly.i(ControlID.i)
    TV_IsRunning.i()
    TV_IsWindowValid.i(WindowID.i)
    TV_IsWindowZoomed.i(WindowID.i)
    TV_ListBoxAddItem.i(ControlID.i, Text.s)
    TV_ListBoxClear.i(ControlID.i)
    TV_ListBoxDeleteItem.i(ControlID.i, Index.i)
    TV_ListBoxGetCurrent.i(ControlID.i)
    TV_ListBoxGetItemCount.i(ControlID.i)
    TV_ListBoxSetCurrent.i(ControlID.i, Index.i)
    TV_MoveDesktopText.i(DesktopTextID.i, X.i, Y.i)
    TV_MoveWindow.i(WindowID.i, X.i, Y.i)
    TV_PollEvent.i(*Event.TV_Event)
    TV_RemoveDesktopText.i(DesktopTextID.i)
    TV_Render.i()
    TV_ResizeControl.i(ControlID.i, X.i, Y.i, Width.i, Height.i)
    TV_ResizeWindow.i(WindowID.i, Width.i, Height.i)
    TV_RestoreWindow.i(WindowID.i)
    TV_SelectBackend.i(BackendType.i)
    TV_SetCalendarMonth.i(WindowID.i, Year.i, Month.i)
    TV_SetCell.i(X.i, Y.i, Character.i, Foreground.i, Background.i)
    TV_SetCheckBoxState.i(ControlID.i, Checked.i)
    TV_SetControlCommand.i(ControlID.i, Command.i)
    TV_SetControlStyle.i(ControlID.i, Style.i)
    TV_SetDefaultButton.i(WindowID.i, ControlID.i)
    TV_SetDesktopClock.i(Mode.i, Location.i)
    TV_SetDesktopText.i(DesktopTextID.i, Text.s)
    TV_SetHyperlinkText.i(ControlID.i, Text.s)
    TV_SetInputReadOnly.i(ControlID.i, ReadOnly.i)
    TV_SetInputText.i(ControlID.i, Text.s)
    TV_SetIPv4Address.i(ControlID.i, Address.s)
    TV_SetIPv4ReadOnly.i(ControlID.i, ReadOnly.i)
    TV_SetMenuBar(Text.s)
    TV_SetNumberInputRange.i(ControlID.i, Minimum.q, Maximum.q)
    TV_SetNumberInputReadOnly.i(ControlID.i, ReadOnly.i)
    TV_SetNumberInputValue.i(ControlID.i, Value.q)
    TV_SetProgressBarRange.i(ControlID.i, Minimum.q, Maximum.q)
    TV_SetProgressBarValue.i(ControlID.i, Value.q)
    TV_SetRadioButtonState.i(ControlID.i, Selected.i)
    TV_SetStatusBar(Text.s)
    TV_SetStatusBarRightText(Text.s)
    TV_SetSwitchState.i(ControlID.i, Checked.i)
    TV_SetTextAreaReadOnly.i(ControlID.i, ReadOnly.i)
    TV_SetTextAreaText.i(ControlID.i, Text.s)
    TV_SetTheme.i(*Theme.TV_Theme)
    TV_SetTitle.i(Title.s)
    TV_SetTrackBarRange.i(ControlID.i, Minimum.q, Maximum.q)
    TV_SetTrackBarValue.i(ControlID.i, Value.q)
    TV_SetWindowColors.i(WindowID.i, Foreground.i, Background.i)
    TV_SetWindowTitle.i(WindowID.i, Title.s)
    TV_ShowCalculator.i()
    TV_ShowCalendar.i(Year.i = 0, Month.i = 0)
    TV_ShowControl.i(ControlID.i, Visible.i)
    TV_ShowDesktopText.i(DesktopTextID.i, Visible.i)
    TV_ShowMessageBox.i(Title.s, Text.s, Buttons.i, Flags.i)
    TV_ShowModal.i(WindowID.i)
    TV_ShowOpenFileDialog.i(Title.s, InitialPath.s = "", Pattern.s = "*.*")
    TV_ShowSaveFileDialog.i(Title.s, InitialPath.s = "", Pattern.s = "*.*")
    TV_ShowWindow.i(WindowID.i)
    TV_ShowWindowSystemMenu.i(WindowID.i = 0)
    TV_Shutdown()
    TV_Stop()
    TV_TileWindows.i()
    TV_UseClassicTheme()
    TV_WaitEvent.i(*Event.TV_Event, Timeout.i)
    TV_WindowsConsoleGetMode.i()
    TV_WindowsConsoleUsesNewWindow.i()
    TV_ZoomWindow.i(WindowID.i)
    TV_CopyComboBoxGetItemText.i(ControlID.i, Index.i, *Buffer, BufferCharacters.i)
    TV_CopyBackendName.i(*Buffer, BufferCharacters.i)
    TV_CopyCalculatorDisplay.i(WindowID.i, *Buffer, BufferCharacters.i)
    TV_CopyCopyright.i(*Buffer, BufferCharacters.i)
    TV_CopyFileDialogPath.i(DialogID.i, *Buffer, BufferCharacters.i)
    TV_CopyHyperlinkText.i(ControlID.i, *Buffer, BufferCharacters.i)
    TV_CopyInputText.i(ControlID.i, *Buffer, BufferCharacters.i)
    TV_CopyIPv4Address.i(ControlID.i, *Buffer, BufferCharacters.i)
    TV_CopyLastErrorText.i(*Buffer, BufferCharacters.i)
    TV_CopyTextAreaText.i(ControlID.i, *Buffer, BufferCharacters.i)
    TV_CopyVersion.i(*Buffer, BufferCharacters.i)
    TV_CopyVersionString.i(*Buffer, BufferCharacters.i)
    TV_CopyListBoxGetItemText.i(ControlID.i, Index.i, *Buffer, BufferCharacters.i)
  EndImport
