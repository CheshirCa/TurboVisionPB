; TurboVisionPB 0.16.9
; (C) CheshirCa 2026
; Binary SDK multi-window editor with layouts and mouse resize.

EnableExplicit

XIncludeFile "..\Include\TurboVisionPB.pbi"

#CMD_NEW = #TV_CMD_USER + 100
#CMD_OPEN = #TV_CMD_USER + 101
#CMD_SAVE = #TV_CMD_USER + 102
#CMD_SAVE_AS = #TV_CMD_USER + 103
#CMD_CLOSE_DOCUMENT = #TV_CMD_USER + 104
#CMD_EXIT = #TV_CMD_USER + 105

Structure EditorDocument
  WindowID.i
  TextAreaID.i
  Path.s
EndStructure

Global NewMap Documents.EditorDocument()
Global NextUntitled.i = 1
Global DialogMode.i
Global DialogTargetWindow.i

Procedure.s CopyDialogPath(DialogID.i)
  Protected Required.i = TV_CopyFileDialogPath(DialogID, #Null, 0)
  Protected Result.s
  If Required <= 1: ProcedureReturn "": EndIf
  Result = Space(Required - 1)
  TV_CopyFileDialogPath(DialogID, @Result, Required)
  ProcedureReturn Result
EndProcedure

Procedure.s CopyEditorText(ControlID.i)
  Protected Required.i = TV_CopyTextAreaText(ControlID, #Null, 0)
  Protected Result.s
  If Required <= 1: ProcedureReturn "": EndIf
  Result = Space(Required - 1)
  TV_CopyTextAreaText(ControlID, @Result, Required)
  ProcedureReturn Result
EndProcedure

Procedure.s LoadTextFile(Path.s)
  Protected FileID.i = ReadFile(#PB_Any, Path)
  Protected Text.s
  If FileID = 0: ProcedureReturn "": EndIf
  While Eof(FileID) = 0
    If Text <> "": Text + #LF$: EndIf
    Text + ReadString(FileID)
  Wend
  CloseFile(FileID)
  ProcedureReturn Text
EndProcedure

Procedure.i SaveTextFile(Path.s, Text.s)
  Protected FileID.i = CreateFile(#PB_Any, Path)
  If FileID = 0: ProcedureReturn #False: EndIf
  WriteString(FileID, Text, #PB_UTF8)
  CloseFile(FileID)
  ProcedureReturn #True
EndProcedure

Procedure.i GetDocument(WindowID.i)
  If FindMapElement(Documents(), Str(WindowID)): ProcedureReturn @Documents(): EndIf
  ProcedureReturn #Null
EndProcedure

Procedure.i CreateDocument(Path.s, Text.s)
  Protected ScreenWidth.i
  Protected ScreenHeight.i
  Protected Width.i
  Protected Height.i
  Protected Offset.i = MapSize(Documents()) * 2
  Protected Title.s
  Protected WindowID.i
  Protected *Document.EditorDocument

  TV_GetScreenSize(@ScreenWidth, @ScreenHeight)
  Width = 62: If Width > ScreenWidth - 4: Width = ScreenWidth - 4: EndIf
  Height = 18: If Height > ScreenHeight - 4: Height = ScreenHeight - 4: EndIf
  If Path = "": Title = "Untitled " + Str(NextUntitled): NextUntitled + 1: Else: Title = GetFilePart(Path): EndIf
  WindowID = TV_CreateWindow(2 + Offset, 2 + Offset, Width, Height, Title,
                             #TV_WINDOW_VISIBLE | #TV_WINDOW_ENABLED | #TV_WINDOW_BORDER |
                             #TV_WINDOW_TITLE | #TV_WINDOW_SHADOW | #TV_WINDOW_SYSTEM_MENU |
                             #TV_WINDOW_CLOSE_BUTTON | #TV_WINDOW_RESIZABLE | #TV_WINDOW_MOVABLE)
  If WindowID = 0: ProcedureReturn 0: EndIf
  AddMapElement(Documents(), Str(WindowID))
  *Document = @Documents()
  *Document\WindowID = WindowID
  *Document\Path = Path
  *Document\TextAreaID = TV_CreateTextArea(WindowID, 1, 1, Width - 4, Height - 4, 0)
  TV_SetTextAreaText(*Document\TextAreaID, Text)
  ProcedureReturn WindowID
EndProcedure

Procedure ResizeDocument(WindowID.i, Width.i, Height.i)
  Protected *Document.EditorDocument = GetDocument(WindowID)
  If *Document And Width >= 6 And Height >= 6
    TV_ResizeControl(*Document\TextAreaID, 1, 1, Width - 4, Height - 4)
  EndIf
EndProcedure

Procedure CloseDocument(WindowID.i)
  If FindMapElement(Documents(), Str(WindowID))
    TV_CloseWindow(WindowID)
    FindMapElement(Documents(), Str(WindowID))
    DeleteMapElement(Documents())
  EndIf
EndProcedure

Procedure SaveDocument(WindowID.i, ForceDialog.i)
  Protected *Document.EditorDocument = GetDocument(WindowID)
  If *Document = #Null: ProcedureReturn: EndIf
  If *Document\Path = "" Or ForceDialog
    DialogMode = #TV_FILE_DIALOG_SAVE
    DialogTargetWindow = WindowID
    TV_ShowSaveFileDialog("Save text file", *Document\Path, "*.txt")
  ElseIf SaveTextFile(*Document\Path, CopyEditorText(*Document\TextAreaID))
    TV_SetWindowTitle(WindowID, GetFilePart(*Document\Path))
  EndIf
EndProcedure

Procedure CompleteFileDialog(DialogID.i)
  Protected Path.s
  Protected *Document.EditorDocument
  If TV_GetFileDialogStatus(DialogID) = #TV_FILE_DIALOG_ACCEPTED
    Path = CopyDialogPath(DialogID)
    If DialogMode = #TV_FILE_DIALOG_OPEN
      TV_CloseFileDialog(DialogID)
      CreateDocument(Path, LoadTextFile(Path))
      ProcedureReturn
    EndIf
    *Document = GetDocument(DialogTargetWindow)
    If *Document And SaveTextFile(Path, CopyEditorText(*Document\TextAreaID))
      *Document\Path = Path
      TV_SetWindowTitle(*Document\WindowID, GetFilePart(Path))
    EndIf
  EndIf
  TV_CloseFileDialog(DialogID)
EndProcedure

Define Config.TV_Config
Dim VersionBuffer.u(31)
Define Event.TV_Event
Define FileMenu.i
Define WindowMenu.i

Config\StructureSize = SizeOf(TV_Config)
Config\APIVersion = #TV_API_VERSION
Config\BackendType = #TV_BACKEND_WINDOWS_CONSOLE
Config\ConsoleMode = #TV_CONSOLE_MODE_CURRENT
TV_UseClassicTheme()
TV_ApplyThemeToConfig(@Config)
If TV_SelectBackend(Config\BackendType) = #False Or TV_Init(@Config) = #False: End 1: EndIf
TV_CopyVersionString(@VersionBuffer(), ArraySize(VersionBuffer()) + 1)
TV_SetTitle("TurboVisionPB " + PeekS(@VersionBuffer(), -1, #PB_Unicode) + " - binary SDK text editor")

FileMenu = TV_CreateMenu("&File")
TV_AddMenuItem(FileMenu, "&New", #CMD_NEW)
TV_AddMenuItem(FileMenu, "&Open", #CMD_OPEN)
TV_AddMenuItem(FileMenu, "&Save", #CMD_SAVE)
TV_AddMenuItem(FileMenu, "Save &As", #CMD_SAVE_AS)
TV_AddMenuSeparator(FileMenu)
TV_AddMenuItem(FileMenu, "&Close", #CMD_CLOSE_DOCUMENT)
TV_AddMenuItem(FileMenu, "E&xit", #CMD_EXIT)
WindowMenu = TV_CreateMenu("&Window")
TV_AddMenuItem(WindowMenu, "&Cascade", #TV_CMD_CASCADE)
TV_AddMenuItem(WindowMenu, "&Tile", #TV_CMD_TILE)
TV_AddMenuSeparator(WindowMenu)
TV_AddMenuItem(WindowMenu, "&Next", #TV_CMD_NEXT_WINDOW, #TV_KEY_F6, #TV_MOD_CTRL)

CreateDocument("", "First document" + #LF$ + "Drag the lower-right corner to resize.")
CreateDocument("", "Second document" + #LF$ + "Use Window/Cascade or Window/Tile.")
CreateDocument("", "Third document" + #LF$ + "Ctrl+F6 activates the next document.")
TV_CascadeWindows()

While TV_IsRunning()
  While TV_PollEvent(@Event)
    TV_DispatchEvent(@Event)
    If Event\Type = #TV_EVENT_RESIZE And Event\Source > 0
      ResizeDocument(Event\Source, Event\MouseX, Event\MouseY)
    ElseIf Event\Type = #TV_EVENT_COMMAND
      Select Event\Command
        Case #CMD_NEW: CreateDocument("", "")
        Case #CMD_OPEN
          DialogMode = #TV_FILE_DIALOG_OPEN
          DialogTargetWindow = TV_GetActiveWindow()
          TV_ShowOpenFileDialog("Open text file", "", "*.txt")
        Case #CMD_SAVE: SaveDocument(TV_GetActiveWindow(), #False)
        Case #CMD_SAVE_AS: SaveDocument(TV_GetActiveWindow(), #True)
        Case #CMD_CLOSE_DOCUMENT: CloseDocument(TV_GetActiveWindow())
        Case #TV_CMD_FILE_DIALOG_DONE: CompleteFileDialog(Event\Source)
        Case #TV_CMD_CLOSE: CloseDocument(Event\Source)
        Case #CMD_EXIT: TV_Stop()
      EndSelect
    EndIf
  Wend
  TV_Render()
  Delay(10)
Wend
TV_Shutdown()
