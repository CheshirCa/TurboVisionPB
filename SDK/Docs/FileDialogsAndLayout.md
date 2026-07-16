<!-- TurboVisionPB 0.16.8 | (C) CheshirCa 2026 -->

# File dialogs и адаптивные controls

[English version](en/FileDialogsAndLayout.md)

Open/Save выполняются внутри TurboVisionPB:

```purebasic
DialogID = TV_ShowOpenFileDialog("Open", "", "*.txt")
```

После `TV_CMD_FILE_DIALOG_DONE` проверьте
`TV_GetFileDialogStatus(DialogID)`. Путь копируется двухпроходным вызовом
`TV_CopyFileDialogPath()`, после чего диалог освобождается через
`TV_CloseFileDialog()`.

`TV_ResizeControl(ControlID, X, Y, Width, Height)` изменяет геометрию внутри
client area. При resize/zoom/restore окна приходит `TV_EVENT_RESIZE`, где
`Source` — ID окна, `MouseX`/`MouseY` — новая ширина/высота. Событие изменения
console screen имеет `Source = 0`.

Вертикальный и горизонтальный scrollbar `TextArea` поддерживают перетаскивание
thumb левой кнопкой мыши, click по дорожке, стрелки, wheel и Shift+wheel.
