; TurboVisionPB 0.16.8
; (C) CheshirCa 2026
; Minimal runtime-layout check for installers and wrappers.

EnableExplicit
XIncludeFile "..\Include\TurboVisionPB.pbi"

Dim VersionBuffer.u(31)

CompilerIf Defined(TV_STANDALONE_EXAMPLE, #PB_Constant) = #False
  Define RuntimePath.s = GetPathPart(ProgramFilename()) + "TurboVisionPB.dll"
  If FileSize(RuntimePath) < 0
    MessageRequester("TurboVisionPB SDK", "TurboVisionPB.dll must be installed beside the application.",
                     #PB_MessageRequester_Error)
    End 1
  EndIf
CompilerEndIf

TV_CopyVersionString(@VersionBuffer(), ArraySize(VersionBuffer()) + 1)
If ProgramParameter() = "--check": End 0: EndIf

CompilerIf Defined(TV_STANDALONE_EXAMPLE, #PB_Constant)
  MessageRequester("TurboVisionPB " + PeekS(@VersionBuffer(), -1, #PB_Unicode) + " SDK",
                   "Standalone example" + #LF$ +
                   "Version: " + PeekS(@VersionBuffer(), -1, #PB_Unicode))
CompilerElse
  MessageRequester("TurboVisionPB " + PeekS(@VersionBuffer(), -1, #PB_Unicode) + " SDK",
                   "Runtime found: " + RuntimePath + #LF$ +
                   "Version: " + PeekS(@VersionBuffer(), -1, #PB_Unicode))
CompilerEndIf
