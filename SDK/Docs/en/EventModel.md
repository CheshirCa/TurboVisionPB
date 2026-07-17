<!-- TurboVisionPB 0.16.9 | (C) CheshirCa 2026 -->

# Event model

[Русская версия](../EventModel.md)

`TV_PollEvent()` retrieves one event without blocking; `TV_WaitEvent()` accepts
a timeout. Call `TV_DispatchEvent()` before application-level processing. It
routes input to windows and controls and may convert an event into
`TV_EVENT_COMMAND`.

`Command` contains the operation code and `Source` is a numeric control or
window ID. Alt+F3, Alt+F5, and Ctrl+F6 use the same command model. A modal
window blocks input to lower windows. The caller owns `TV_Event`; the DLL does
not retain its pointer after returning.

For a screen `TV_EVENT_RESIZE`, `Source` is zero, `MouseX` is the new width,
and `MouseY` is the new height. `TV_GetScreenSize()` already reports the new
geometry, both virtual buffers have been recreated, and the next render is a
full frame. A nonzero resize `Source` is a WindowID.

The desktop menu and a window system menu are mutually exclusive. Global
menu/status shortcuts remain available while another popup is open.

Windows Console may combine movement and a mouse-button transition in one
record. The SDK returns `MOUSE_DOWN` or `MOUSE_UP`; a pure `MOUSE_MOVE` is
created only when no transition occurred.

The library is single-threaded. Do not run event loops in parallel or pass one
`TV_Event` to multiple threads.
