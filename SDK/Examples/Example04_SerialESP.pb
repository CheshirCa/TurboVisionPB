; TurboVisionPB 0.16.8
; (C) CheshirCa 2026
; Serial ESP availability notice for the binary SDK.

EnableExplicit
XIncludeFile "..\Include\TurboVisionPB.pbi"

Dim VersionBuffer.u(31)
TV_CopyVersionString(@VersionBuffer(), ArraySize(VersionBuffer()) + 1)
MessageRequester("TurboVisionPB " + PeekS(@VersionBuffer(), -1, #PB_Unicode),
                 "Serial backend, COM ports and ESP32 support are in development." + #LF$ +
                 "No port is opened by this example.")
