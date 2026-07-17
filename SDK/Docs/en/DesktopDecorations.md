<!-- TurboVisionPB 0.16.9 | (C) CheshirCa 2026 -->

# Desktop text and bevel frames

[Русская версия](../DesktopDecorations.md)

`TV_CreateDesktopText(X, Y, Text, Foreground, Background)` creates persistent,
non-interactive text below all windows. It is drawn after the desktop is
cleared but before windows, the menu bar, and the status bar. Use
`TV_SetDesktopText()`, `TV_MoveDesktopText()`, `TV_ShowDesktopText()`,
`TV_RemoveDesktopText()`, and `TV_ClearDesktopTexts()` to manage it.

```purebasic
DesktopText = TV_CreateDesktopText(2, 2, "TurboVisionPB",
                                   #TV_COLOR_YELLOW, #TV_COLOR_BLUE)
```

`TV_CreateBevelFrame(WindowID, X, Y, Width, Height, Style)` creates a
non-focusable bevel frame in a window client area. Use `#TV_BEVEL_RAISED` or
`#TV_BEVEL_SUNKEN`. The minimum size is 2x2; the interior is not filled.
Resize the frame with `TV_ResizeControl()`.

```purebasic
TV_CreateBevelFrame(WindowID, 2, 2, 28, 5, #TV_BEVEL_RAISED)
TV_CreateBevelFrame(WindowID, 32, 2, 28, 5, #TV_BEVEL_SUNKEN)
```

Both features are backend-independent and do not use WinAPI. See
`SDK/Examples/Example02_Controls.pb` for a complete example.
