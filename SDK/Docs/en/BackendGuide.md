<!-- TurboVisionPB 0.16.9 | (C) CheshirCa 2026 -->

# Backend guide

[Русская версия](../BackendGuide.md)

The Binary SDK currently implements only `#TV_BACKEND_WINDOWS_CONSOLE`.
Select it with `TV_SelectBackend()` before calling `TV_Init()`.

Console modes:

- `CURRENT` uses the current or parent console;
- `NEW` creates a separate console;
- `AUTO` prefers the current console and falls back to a new one.

On `TV_Shutdown()`, the backend restores console modes, viewport, contents,
title, and cursor. TUI output cannot be redirected to a pipe or file.

If a console input record combines mouse movement with a button transition,
the SDK emits the press/release event first. This prevents a delayed phantom
click from reaching a lower window.

Window shadows use full cells and need no font detection. A shadow preserves
the glyph already present in each cell and, in the Classic theme, renders it
dark gray on black, so text from a lower window remains visible but dimmed.
Glyph coverage is
checked only for the `◢` resize handle; if it is unavailable, the SDK uses the
OEM-compatible `▓`. CP866/1251 is not used as a capability test because frames
are written through `WriteConsoleOutputW()`.

A window shadow occupies two full cells on the right and one full row below.
A raised-button shadow uses the standard `▄` and `▀` characters.

Custom backend registration is not part of the closed ABI because it would
expose internal buffer structures. Serial/ESP and COM support is under
development.
