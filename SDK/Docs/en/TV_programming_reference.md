<!-- TurboVisionPB 0.16.8 | (C) CheshirCa 2026 -->

# TurboVisionPB programmer's guide

[Русская версия](../TV_programming_reference.md)

This guide describes installation, initialization, event handling, ownership,
and the main public API contracts of TurboVisionPB 0.16.8. The library targets
PureBasic 6.40 Unicode on Windows 10/11 and Windows Server 2022. All UI calls
and the event loop must run on one thread.

The [complete API catalog](API.md) documents all 160 exported functions.

## 1. SDK layout and installation

The public Binary SDK contains:

- `Include/TurboVisionPB.pbi` — the only public include;
- `Lib/x64|x86/TurboVisionPB.lib` — import libraries;
- `Bin/x64|x86/TurboVisionPB.dll` — runtime DLLs;
- `Examples` — example source code;
- `Examples/Bin/x64|x86` — self-contained example executables;
- `Docs` and `Docs/en` — Russian and English documentation.

The compiler, import library, and DLL architectures must match. Preserve the
SDK directory structure and place the matching DLL next to your application
EXE. Packaged example EXEs are self-contained and need no DLL.

```purebasic
XIncludeFile "SDK/Include/TurboVisionPB.pbi"
```

## 2. Minimal application

```purebasic
EnableExplicit
XIncludeFile "SDK/Include/TurboVisionPB.pbi"

Define Config.TV_Config
Define Event.TV_Event
Define WindowID.i

Config\StructureSize = SizeOf(TV_Config)
Config\APIVersion = #TV_API_VERSION
Config\BackendType = #TV_BACKEND_WINDOWS_CONSOLE
Config\ConsoleMode = #TV_CONSOLE_MODE_CURRENT

TV_UseClassicTheme()
TV_ApplyThemeToConfig(@Config)
If TV_SelectBackend(Config\BackendType) = #False Or TV_Init(@Config) = #False
  End 1
EndIf

WindowID = TV_CreateWindow(0, 0, 50, 12, "Hello",
  #TV_WINDOW_VISIBLE | #TV_WINDOW_ENABLED | #TV_WINDOW_BORDER |
  #TV_WINDOW_TITLE | #TV_WINDOW_CENTERED)
TV_CreateButton(WindowID, 18, 7, 12, "Close", #TV_CMD_CLOSE)

While TV_IsRunning()
  While TV_PollEvent(@Event)
    TV_DispatchEvent(@Event)
    If Event\Type = #TV_EVENT_COMMAND And Event\Command = #TV_CMD_CLOSE
      TV_Stop()
    EndIf
  Wend
  TV_Render()
  Delay(10)
Wend
TV_Shutdown()
```

Build a console TUI with `/CONSOLE`. Build a normal GUI application without
that compiler option.

## 3. Configuration and backend

`TV_Config` must contain valid `StructureSize` and `APIVersion` fields. The
main options are `BackendType`, optional `ScreenWidth`/`ScreenHeight`, desktop
character and colors, `EnableMouse`, `EnablePartialUpdates`, `UserData`, and
`ConsoleMode`.

The recommended sequence is `TV_UseClassicTheme()`,
`TV_ApplyThemeToConfig(@Config)`, then application-specific overrides.

The public SDK implements the Windows Console backend. `CURRENT` uses the
current or parent console, `NEW` creates one, and `AUTO` tries both. See
[Backend guide](BackendGuide.md).

## 4. Event model

`TV_PollEvent()` is non-blocking; `TV_WaitEvent()` accepts a timeout. Pass each
event to `TV_DispatchEvent()` before application-level processing. The
dispatcher updates focus, controls, menus, dialogs, Calendar, and Calculator.

A control command arrives as `TV_EVENT_COMMAND`: `Command` is the command code
and `Source` is the ControlID. A screen resize uses `Source = 0`, with width in
`MouseX` and height in `MouseY`. A window resize uses its WindowID as `Source`.

See [Event model](EventModel.md) for modal routing, mouse transitions, and
global shortcuts.

## 5. Coordinates, IDs, and memory ownership

Window coordinates are screen-relative; control coordinates are relative to
the window client area. All IDs are opaque and become invalid after the object
is closed. Never interpret an ID as an address.

`TV_Copy*` functions write to caller-owned UTF-16 buffers and return the
required character capacity including the terminating null:

```purebasic
Dim Buffer.u(63)
Required = TV_CopyInputText(InputID, @Buffer(), ArraySize(Buffer()) + 1)
Text.s = PeekS(@Buffer(), -1, #PB_Unicode)
```

Call with a null buffer and zero capacity to query the required size. The DLL
does not return allocations that the application must free.

## 6. Errors and shutdown

Check returned Boolean values and IDs. After failure, use `TV_GetLastError()`
and `TV_CopyLastErrorText()`. Call `TV_Shutdown()` exactly once after successful
or partially successful initialization. See [Errors and diagnostics](ErrorHandling.md).

## 7. Windows, controls, and dialogs

Windows support visibility, enable state, modal operation, zoom/restore,
movement, mouse resize, Cascade, and Tile. Calendar and Calculator are
fixed-size ready-made windows. File dialogs are non-blocking and use the same
event loop.

Controls include labels, buttons, check boxes, radio buttons, group boxes,
inputs, ListBox, ComboBox, TextArea, NumberInput, hyperlinks, IPv4 input,
ProgressBar, TrackBar, switches, and bevel frames. Use `TV_ResizeControl()` to
adapt them after a window `TV_EVENT_RESIZE`.

Related guides:

- [File dialogs and adaptive controls](FileDialogsAndLayout.md)
- [Window layouts and mouse interaction](WindowLayouts.md)
- [Calendar, Calculator, and desktop indicators](TemplateWindows.md)
- [Desktop text and bevel frames](DesktopDecorations.md)
- [Binary compatibility](BinaryCompatibility.md)
- [Complete API catalog](API.md)
