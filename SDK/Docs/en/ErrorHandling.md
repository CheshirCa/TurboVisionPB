<!-- TurboVisionPB 0.16.8 | (C) CheshirCa 2026 -->

# Errors and diagnostics

[Русская версия](../ErrorHandling.md)

Most functions return `#False` or ID 0 on failure. Read the error code with
`TV_GetLastError()` and copy its text with
`TV_CopyLastErrorText(*Buffer, BufferCharacters)`.

Typical causes are an invalid parameter, a call before initialization, an
unsupported backend, no real console handle, or a terminal that is too small.
Public DLL messages do not expose source paths or internal object addresses.

It is safe to call `TV_Shutdown()` after a partially successful `TV_Init()`.
Initialization without an intervening shutdown is rejected. Public 0.14.0 has
no built-in TRACE facility or logging callback.
