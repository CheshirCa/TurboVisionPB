<!-- TurboVisionPB 0.16.8 | (C) CheshirCa 2026 -->

# Getting started

[Русская версия](../GettingStarted.md)

TurboVisionPB requires Windows 10/11 or Windows Server 2022 and PureBasic 6.40
x64 or x86. The application, `TurboVisionPB.lib`, and `TurboVisionPB.dll` must
use the same architecture.

Ready-to-run examples are in `SDK/Examples/Bin/x64` and `x86`. Each packaged
EXE is self-contained and needs no DLL. The instructions below apply when you
compile the open `.pb` examples or your own application with the regular DLL
SDK model.

Examples 01, 02, 03, 06, and 07 use the Console PE subsystem. Windows Explorer
opens a console for them, and cmd/PowerShell waits for completion. Examples 04
and 05 use the Windows GUI subsystem.

1. Preserve the `SDK/Include` and `SDK/Lib` directory structure.
2. Add `XIncludeFile "..\Include\TurboVisionPB.pbi"`.
3. After compilation, copy the DLL from `SDK/Bin/<architecture>` next to the
   EXE.
4. Set the required `StructureSize` and `APIVersion` fields.

```purebasic
Define Config.TV_Config
Define Event.TV_Event

Config\StructureSize = SizeOf(TV_Config)
Config\APIVersion = #TV_API_VERSION
Config\BackendType = #TV_BACKEND_WINDOWS_CONSOLE
Config\ConsoleMode = #TV_CONSOLE_MODE_CURRENT

TV_UseClassicTheme()
TV_ApplyThemeToConfig(@Config)
If TV_SelectBackend(Config\BackendType) And TV_Init(@Config)
  WindowID = TV_CreateWindow(0, 0, 50, 12, "Hello",
                             #TV_WINDOW_VISIBLE | #TV_WINDOW_ENABLED |
                             #TV_WINDOW_BORDER | #TV_WINDOW_TITLE |
                             #TV_WINDOW_CENTERED)
  TV_CreateButton(WindowID, 18, 7, 12, "Close", #TV_CMD_CLOSE)
  While TV_IsRunning()
    While TV_PollEvent(@Event)
      TV_DispatchEvent(@Event)
      If Event\Type = #TV_EVENT_COMMAND And Event\Command = #TV_CMD_CLOSE
        TV_Stop()
      EndIf
    Wend
    TV_Render()
  Wend
  TV_Shutdown()
EndIf
```

String results use a caller-owned UTF-16 buffer:

```purebasic
Dim Buffer.u(63)
Required = TV_CopyVersionString(@Buffer(), ArraySize(Buffer()) + 1)
Version.s = PeekS(@Buffer(), -1, #PB_Unicode)
```

`Required` includes the terminating null. A null pointer with capacity 0 lets
you query the required size first. The library is single-threaded; make all UI
calls and run the event loop from one thread.

For editors and adaptive forms, use `TV_ShowOpenFileDialog()`,
`TV_ShowSaveFileDialog()`, `TV_ResizeControl()`, and window
`TV_EVENT_RESIZE`. `Example06_TextEditor.pb` demonstrates file dialogs,
Cascade/Tile, title dragging, mouse resize, and adaptive `TextArea` controls.

Use `TV_CreateDesktopText()` for persistent desktop labels and
`TV_CreateBevelFrame()` with `#TV_BEVEL_RAISED` or `#TV_BEVEL_SUNKEN` for
window decorations. See `DesktopDecorations.md`.

Create ready-made Calendar and Calculator windows with `TV_ShowCalendar()` and
`TV_ShowCalculator()`. Configure clocks and right-aligned status text with
`TV_SetDesktopClock()` and `TV_SetStatusBarRightText()`. See
`TemplateWindows.md` and `Example07_TurboVisionDemo.pb`.
