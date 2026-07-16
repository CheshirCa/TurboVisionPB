<!-- TurboVisionPB 0.16.8 | (C) CheshirCa 2026 -->

# Calendar, Calculator, and desktop indicators

[Русская версия](../TemplateWindows.md)

`TV_ShowCalendar(Year, Month)` creates a ready-to-use non-modal calendar.
Zero Year/Month selects the current month. Use `TV_SetCalendarMonth()` and
`TV_GetCalendarDate()` for programmatic control. The window can move but has
fixed geometry: mouse resize, `TV_ResizeWindow()`, Zoom/Alt+F5, and
Cascade/Tile do not resize it. Its system menu has no Zoom/Restore item.

`TV_ShowCalculator()` creates a four-operation calculator with percent, sign
change, clear, and Backspace. It supports mouse and keyboard input. Read the
display with `TV_CopyCalculatorDisplay(WindowID, *Buffer, BufferCharacters)`.
The window can move and close but cannot resize or participate in Cascade/Tile.

Both functions return a normal WindowID and are fully serviced by
`TV_DispatchEvent()`. System-menu Close and Alt+F3 close these standard windows
without an application `TV_CMD_CLOSE` handler.

Enable the clock with `TV_SetDesktopClock()` and one of
`#TV_DESKTOP_CLOCK_OFF`, `#TV_DESKTOP_CLOCK_TIME`, or
`#TV_DESKTOP_CLOCK_DATE_TIME`. Select the menu or status bar with
`#TV_DESKTOP_CLOCK_MENU` or `#TV_DESKTOP_CLOCK_STATUS`.
`TV_SetStatusBarRightText()` adds persistent right-aligned status text.

See `SDK/Examples/Example07_TurboVisionDemo.pb` for the complete scenario.
