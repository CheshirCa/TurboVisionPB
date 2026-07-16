<!-- TurboVisionPB 0.16.8 | (C) CheshirCa 2026 -->

# File dialogs and adaptive controls

[Русская версия](../FileDialogsAndLayout.md)

Open and Save dialogs run inside TurboVisionPB:

```purebasic
DialogID = TV_ShowOpenFileDialog("Open", "", "*.txt")
```

After `TV_CMD_FILE_DIALOG_DONE`, inspect `TV_GetFileDialogStatus(DialogID)`.
Copy the selected path with the two-pass `TV_CopyFileDialogPath()` API, then
release the dialog with `TV_CloseFileDialog()`.

`TV_ResizeControl(ControlID, X, Y, Width, Height)` changes geometry inside the
client area. Window resize, zoom, and restore emit `TV_EVENT_RESIZE`, where
`Source` is the WindowID and `MouseX`/`MouseY` are the new width and height. A
console-screen resize uses `Source = 0`.

The vertical and horizontal `TextArea` scrollbars support left-button thumb
dragging, track clicks, arrows, the mouse wheel, and Shift+wheel.
