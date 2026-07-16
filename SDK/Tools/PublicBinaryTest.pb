; TurboVisionPB 0.16.8
; (C) CheshirCa 2026
; Non-interactive installation and ABI test.

EnableExplicit
XIncludeFile "..\Include\TurboVisionPB.pbi"

Dim Buffer.u(63)
If TV_CheckAPIVersion(#TV_API_VERSION) = #False: End 10: EndIf
If TV_GetAPIVersion() <> #TV_API_VERSION: End 11: EndIf
If TV_CopyVersionString(@Buffer(), ArraySize(Buffer()) + 1) <> Len(#TV_VERSION_STRING) + 1: End 12: EndIf
If PeekS(@Buffer(), -1, #PB_Unicode) <> #TV_VERSION_STRING: End 13: EndIf
End 0
