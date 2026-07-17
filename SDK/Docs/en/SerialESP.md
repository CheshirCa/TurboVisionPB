<!-- TurboVisionPB 0.16.9 | (C) CheshirCa 2026 -->

# Serial ESP

[Русская версия](../SerialESP.md)

Serial backend, COM-port, and ESP32 support is **under development**.

Public SDK 0.14.0 exports no Serial functions, opens no ports, and includes no
firmware. `#TV_BACKEND_SERIAL_ESP` is reserved for a future version; selecting
it currently produces an unsupported-backend error.

`Example04_SerialESP.pb` is only a compilable status notice and does not access
hardware. A future implementation will require a separate release and a
documented protocol version.
