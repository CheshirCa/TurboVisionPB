<!-- TurboVisionPB 0.16.9 | (C) CheshirCa 2026 -->

![TurboVisionPB Demo](Images/TVPB_Demo.jpg)

# TurboVisionPB Binary SDK

**English** | [Русский](README.md)

TurboVisionPB is a text user interface library for PureBasic 6.40 on Windows
10/11 and Windows Server 2022. The public SDK contains only the binary DLL,
import library, public include, documentation, and examples. Implementation
source code is not distributed.

PureBasic x64 and x86 are supported. The application must use a DLL of the
same architecture. Place `TurboVisionPB.dll` next to the compiled EXE.

Start with `SDK/Docs/en/GettingStarted.md`. The complete signature catalog is
in `SDK/Docs/en/API.md`; Russian documentation and the extended programming
reference remain in `SDK/Docs`. Seven example sources are in `SDK/Examples`,
with self-contained executables in `SDK/Examples/Bin/x64` and `x86`.

Use is permitted for non-commercial purposes only. Any commercial use of the
library or any part of it requires a separate agreement with CheshirCa. See
`LICENSE.txt` for the complete terms.

The Serial backend, COM ports, and ESP32 support are under development and are
not included in this release. Other limits are one UI thread, one active
backend, single-cell basic Unicode characters, and no drag-and-drop controls.

The SDK includes persistent desktop text, raised and sunken bevel frames,
Calendar and Calculator windows, menu/status clocks, file dialogs, adaptive
controls, Cascade/Tile window layouts, mouse move/resize, and a multi-window
text editor example.

Packaged example EXEs are self-contained and do not import
`TurboVisionPB.dll`. Compiling the open `.pb` examples uses the regular DLL
SDK model. TUI examples 01, 02, 03, 06, and 07 use the Console subsystem;
examples 04 and 05 use the Windows GUI subsystem.

Bug reports and commercial licensing requests:
<https://t.me/cheshircanest>.
