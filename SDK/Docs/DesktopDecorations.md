<!-- TurboVisionPB 0.16.9 | (C) CheshirCa 2026 -->

# Фоновый текст и объёмные рамки

[English version](en/DesktopDecorations.md)

`TV_CreateDesktopText(X, Y, Text, Foreground, Background)` создаёт постоянную
неинтерактивную надпись под всеми окнами. Она рисуется после очистки desktop,
но до окон, menu bar и status bar. Доступны `TV_SetDesktopText()`,
`TV_MoveDesktopText()`, `TV_ShowDesktopText()`, `TV_RemoveDesktopText()` и
`TV_ClearDesktopTexts()`.

```purebasic
DesktopText = TV_CreateDesktopText(2, 2, "TurboVisionPB",
                                   #TV_COLOR_YELLOW, #TV_COLOR_BLUE)
```

`TV_CreateBevelFrame(WindowID, X, Y, Width, Height, Style)` создаёт
нефокусируемую объёмную рамку в клиентской области окна. Используйте
`#TV_BEVEL_RAISED` для выпуклой и `#TV_BEVEL_SUNKEN` для вдавленной рамки.
Минимальный размер — 2x2. Внутренняя область не заполняется, а геометрия
меняется общей функцией `TV_ResizeControl()`.

```purebasic
TV_CreateBevelFrame(WindowID, 2, 2, 28, 5, #TV_BEVEL_RAISED)
TV_CreateBevelFrame(WindowID, 32, 2, 28, 5, #TV_BEVEL_SUNKEN)
```

Оба элемента backend-независимы и не используют WinAPI. Полный пример находится
в `SDK/Examples/Example02_Controls.pb`.
