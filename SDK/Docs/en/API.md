<!-- TurboVisionPB 0.16.9 | (C) CheshirCa 2026 -->

# API Binary SDK

[Русская версия](../API.md)

All functions use cdecl, are not thread-safe, and must be called from one UI thread. Numeric IDs are opaque. Unless explicitly documented otherwise, the DLL does not retain pointers to temporary parameters after a function returns.

For `TV_Copy*` functions, `*Buffer` is owned by the caller, `BufferCharacters` specifies the UTF-16 capacity in characters, and the result includes the terminating null. Other functions do not transfer memory that the caller must free.

## Backend

### TV_BackendGetScreenSize

- Signature: TV_BackendGetScreenSize.i(*Width.Integer, *Height.Integer)
- Purpose: Performs a public Binary SDK operation.
- Parameters: *Width.Integer, *Height.Integer; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_BackendGetScreenSize(...); use actual parameters from the SDK examples.

### TV_BackendIsConnected

- Signature: TV_BackendIsConnected.i()
- Purpose: Performs a public Binary SDK operation.
- Parameters: none.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_BackendIsConnected(...); use actual parameters from the SDK examples.

### TV_BackendRequestFullRedraw

- Signature: TV_BackendRequestFullRedraw()
- Purpose: Performs a public Binary SDK operation.
- Parameters: none.
- Returns: No return value.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_BackendRequestFullRedraw(...); use actual parameters from the SDK examples.

### TV_GetBackendType

- Signature: TV_GetBackendType.i()
- Purpose: Returns the current state or value.
- Parameters: none.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_GetBackendType(...); use actual parameters from the SDK examples.

### TV_SelectBackend

- Signature: TV_SelectBackend.i(BackendType.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: BackendType.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): Yes.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_SelectBackend(...); use actual parameters from the SDK examples.

### TV_WindowsConsoleGetMode

- Signature: TV_WindowsConsoleGetMode.i()
- Purpose: Performs a public Binary SDK operation.
- Parameters: none.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_WindowsConsoleGetMode(...); use actual parameters from the SDK examples.

### TV_WindowsConsoleUsesNewWindow

- Signature: TV_WindowsConsoleUsesNewWindow.i()
- Purpose: Performs a public Binary SDK operation.
- Parameters: none.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_WindowsConsoleUsesNewWindow(...); use actual parameters from the SDK examples.

## Controls and screen

### TV_ComboBoxAddItem

- Signature: TV_ComboBoxAddItem.i(ControlID.i, Text.s)
- Purpose: Performs a public Binary SDK operation.
- Parameters: ControlID.i, Text.s; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_ComboBoxAddItem(...); use actual parameters from the SDK examples.

### TV_ComboBoxClear

- Signature: TV_ComboBoxClear.i(ControlID.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: ControlID.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_ComboBoxClear(...); use actual parameters from the SDK examples.

### TV_ComboBoxDeleteItem

- Signature: TV_ComboBoxDeleteItem.i(ControlID.i, Index.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: ControlID.i, Index.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_ComboBoxDeleteItem(...); use actual parameters from the SDK examples.

### TV_ComboBoxGetCurrent

- Signature: TV_ComboBoxGetCurrent.i(ControlID.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: ControlID.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_ComboBoxGetCurrent(...); use actual parameters from the SDK examples.

### TV_ComboBoxGetItemCount

- Signature: TV_ComboBoxGetItemCount.i(ControlID.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: ControlID.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_ComboBoxGetItemCount(...); use actual parameters from the SDK examples.

### TV_ComboBoxIsOpen

- Signature: TV_ComboBoxIsOpen.i(ControlID.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: ControlID.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_ComboBoxIsOpen(...); use actual parameters from the SDK examples.

### TV_ComboBoxSetCurrent

- Signature: TV_ComboBoxSetCurrent.i(ControlID.i, Index.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: ControlID.i, Index.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_ComboBoxSetCurrent(...); use actual parameters from the SDK examples.

### TV_CopyBackendName

- Signature: TV_CopyBackendName.i(*Buffer, BufferCharacters.i)
- Purpose: Copies a string result to a caller-owned UTF-16 buffer.
- Parameters: *Buffer, BufferCharacters.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CopyBackendName(...); use actual parameters from the SDK examples.

### TV_CopyCalculatorDisplay

- Signature: TV_CopyCalculatorDisplay.i(WindowID.i, *Buffer, BufferCharacters.i)
- Purpose: Copies a string result to a caller-owned UTF-16 buffer.
- Parameters: WindowID.i, *Buffer, BufferCharacters.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CopyCalculatorDisplay(...); use actual parameters from the SDK examples.

### TV_CopyComboBoxGetItemText

- Signature: TV_CopyComboBoxGetItemText.i(ControlID.i, Index.i, *Buffer, BufferCharacters.i)
- Purpose: Copies a string result to a caller-owned UTF-16 buffer.
- Parameters: ControlID.i, Index.i, *Buffer, BufferCharacters.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CopyComboBoxGetItemText(...); use actual parameters from the SDK examples.

### TV_CopyHyperlinkText

- Signature: TV_CopyHyperlinkText.i(ControlID.i, *Buffer, BufferCharacters.i)
- Purpose: Copies a string result to a caller-owned UTF-16 buffer.
- Parameters: ControlID.i, *Buffer, BufferCharacters.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CopyHyperlinkText(...); use actual parameters from the SDK examples.

### TV_CopyInputText

- Signature: TV_CopyInputText.i(ControlID.i, *Buffer, BufferCharacters.i)
- Purpose: Copies a string result to a caller-owned UTF-16 buffer.
- Parameters: ControlID.i, *Buffer, BufferCharacters.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CopyInputText(...); use actual parameters from the SDK examples.

### TV_CopyIPv4Address

- Signature: TV_CopyIPv4Address.i(ControlID.i, *Buffer, BufferCharacters.i)
- Purpose: Copies a string result to a caller-owned UTF-16 buffer.
- Parameters: ControlID.i, *Buffer, BufferCharacters.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CopyIPv4Address(...); use actual parameters from the SDK examples.

### TV_CopyListBoxGetItemText

- Signature: TV_CopyListBoxGetItemText.i(ControlID.i, Index.i, *Buffer, BufferCharacters.i)
- Purpose: Copies a string result to a caller-owned UTF-16 buffer.
- Parameters: ControlID.i, Index.i, *Buffer, BufferCharacters.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CopyListBoxGetItemText(...); use actual parameters from the SDK examples.

### TV_CopyTextAreaText

- Signature: TV_CopyTextAreaText.i(ControlID.i, *Buffer, BufferCharacters.i)
- Purpose: Copies a string result to a caller-owned UTF-16 buffer.
- Parameters: ControlID.i, *Buffer, BufferCharacters.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CopyTextAreaText(...); use actual parameters from the SDK examples.

### TV_CreateBevelFrame

- Signature: TV_CreateBevelFrame.i(WindowID.i, X.i, Y.i, Width.i, Height.i, Style.i)
- Purpose: Creates an object and returns its opaque numeric ID.
- Parameters: WindowID.i, X.i, Y.i, Width.i, Height.i, Style.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CreateBevelFrame(...); use actual parameters from the SDK examples.

### TV_CreateButton

- Signature: TV_CreateButton.i(WindowID.i, X.i, Y.i, Width.i, Text.s, Command.i)
- Purpose: Creates an object and returns its opaque numeric ID.
- Parameters: WindowID.i, X.i, Y.i, Width.i, Text.s, Command.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CreateButton(...); use actual parameters from the SDK examples.

### TV_CreateCheckBox

- Signature: TV_CreateCheckBox.i(WindowID.i, X.i, Y.i, Text.s, Checked.i)
- Purpose: Creates an object and returns its opaque numeric ID.
- Parameters: WindowID.i, X.i, Y.i, Text.s, Checked.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CreateCheckBox(...); use actual parameters from the SDK examples.

### TV_CreateComboBox

- Signature: TV_CreateComboBox.i(WindowID.i, X.i, Y.i, Width.i, DropDownHeight.i, Command.i = #TV_CMD_NONE)
- Purpose: Creates an object and returns its opaque numeric ID.
- Parameters: WindowID.i, X.i, Y.i, Width.i, DropDownHeight.i, Command.i = #TV_CMD_NONE; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CreateComboBox(...); use actual parameters from the SDK examples.

### TV_CreateDesktopText

- Signature: TV_CreateDesktopText.i(X.i, Y.i, Text.s, Foreground.i, Background.i)
- Purpose: Creates an object and returns its opaque numeric ID.
- Parameters: X.i, Y.i, Text.s, Foreground.i, Background.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CreateDesktopText(...); use actual parameters from the SDK examples.

### TV_CreateGroupBox

- Signature: TV_CreateGroupBox.i(WindowID.i, X.i, Y.i, Width.i, Height.i, Text.s)
- Purpose: Creates an object and returns its opaque numeric ID.
- Parameters: WindowID.i, X.i, Y.i, Width.i, Height.i, Text.s; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CreateGroupBox(...); use actual parameters from the SDK examples.

### TV_CreateHyperlink

- Signature: TV_CreateHyperlink.i(WindowID.i, X.i, Y.i, Text.s, Command.i)
- Purpose: Creates an object and returns its opaque numeric ID.
- Parameters: WindowID.i, X.i, Y.i, Text.s, Command.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CreateHyperlink(...); use actual parameters from the SDK examples.

### TV_CreateInput

- Signature: TV_CreateInput.i(WindowID.i, X.i, Y.i, Width.i, MaxLength.i)
- Purpose: Creates an object and returns its opaque numeric ID.
- Parameters: WindowID.i, X.i, Y.i, Width.i, MaxLength.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CreateInput(...); use actual parameters from the SDK examples.

### TV_CreateIPv4Input

- Signature: TV_CreateIPv4Input.i(WindowID.i, X.i, Y.i, Address.s = "0.0.0.0", ReadOnly.i = #False)
- Purpose: Creates an object and returns its opaque numeric ID.
- Parameters: WindowID.i, X.i, Y.i, Address.s = "0.0.0.0", ReadOnly.i = #False; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CreateIPv4Input(...); use actual parameters from the SDK examples.

### TV_CreateLabel

- Signature: TV_CreateLabel.i(WindowID.i, X.i, Y.i, Text.s)
- Purpose: Creates an object and returns its opaque numeric ID.
- Parameters: WindowID.i, X.i, Y.i, Text.s; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CreateLabel(...); use actual parameters from the SDK examples.

### TV_CreateListBox

- Signature: TV_CreateListBox.i(WindowID.i, X.i, Y.i, Width.i, Height.i)
- Purpose: Creates an object and returns its opaque numeric ID.
- Parameters: WindowID.i, X.i, Y.i, Width.i, Height.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CreateListBox(...); use actual parameters from the SDK examples.

### TV_CreateMenu

- Signature: TV_CreateMenu.i(Title.s)
- Purpose: Creates an object and returns its opaque numeric ID.
- Parameters: Title.s; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CreateMenu(...); use actual parameters from the SDK examples.

### TV_CreateNumberInput

- Signature: TV_CreateNumberInput.i(WindowID.i, X.i, Y.i, Width.i, Minimum.q, Maximum.q, Value.q, StepValue.q = 1)
- Purpose: Creates an object and returns its opaque numeric ID.
- Parameters: WindowID.i, X.i, Y.i, Width.i, Minimum.q, Maximum.q, Value.q, StepValue.q = 1; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CreateNumberInput(...); use actual parameters from the SDK examples.

### TV_CreateProgressBar

- Signature: TV_CreateProgressBar.i(WindowID.i, X.i, Y.i, Width.i, Minimum.q, Maximum.q, Value.q)
- Purpose: Creates an object and returns its opaque numeric ID.
- Parameters: WindowID.i, X.i, Y.i, Width.i, Minimum.q, Maximum.q, Value.q; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CreateProgressBar(...); use actual parameters from the SDK examples.

### TV_CreateRadioButton

- Signature: TV_CreateRadioButton.i(WindowID.i, X.i, Y.i, Text.s, GroupID.i, Selected.i)
- Purpose: Creates an object and returns its opaque numeric ID.
- Parameters: WindowID.i, X.i, Y.i, Text.s, GroupID.i, Selected.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CreateRadioButton(...); use actual parameters from the SDK examples.

### TV_CreateSwitch

- Signature: TV_CreateSwitch.i(WindowID.i, X.i, Y.i, Text.s, Checked.i, Command.i = #TV_CMD_NONE)
- Purpose: Creates an object and returns its opaque numeric ID.
- Parameters: WindowID.i, X.i, Y.i, Text.s, Checked.i, Command.i = #TV_CMD_NONE; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CreateSwitch(...); use actual parameters from the SDK examples.

### TV_CreateTextArea

- Signature: TV_CreateTextArea.i(WindowID.i, X.i, Y.i, Width.i, Height.i, MaxLength.i = 0)
- Purpose: Creates an object and returns its opaque numeric ID.
- Parameters: WindowID.i, X.i, Y.i, Width.i, Height.i, MaxLength.i = 0; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CreateTextArea(...); use actual parameters from the SDK examples.

### TV_CreateTrackBar

- Signature: TV_CreateTrackBar.i(WindowID.i, X.i, Y.i, Width.i, Minimum.q, Maximum.q, Value.q, StepValue.q = 1, Command.i = #TV_CMD_NONE)
- Purpose: Creates an object and returns its opaque numeric ID.
- Parameters: WindowID.i, X.i, Y.i, Width.i, Minimum.q, Maximum.q, Value.q, StepValue.q = 1, Command.i = #TV_CMD_NONE; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CreateTrackBar(...); use actual parameters from the SDK examples.

### TV_EnableControl

- Signature: TV_EnableControl.i(ControlID.i, Enabled.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: ControlID.i, Enabled.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_EnableControl(...); use actual parameters from the SDK examples.

### TV_GetCalendarDate

- Signature: TV_GetCalendarDate.q(WindowID.i)
- Purpose: Returns the current state or value.
- Parameters: WindowID.i; values are validated by the DLL.
- Returns: A 64-bit numeric value.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_GetCalendarDate(...); use actual parameters from the SDK examples.

### TV_GetCell

- Signature: TV_GetCell.i(X.i, Y.i, *Cell.TV_Cell)
- Purpose: Returns the current state or value.
- Parameters: X.i, Y.i, *Cell.TV_Cell; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_GetCell(...); use actual parameters from the SDK examples.

### TV_GetCheckBoxState

- Signature: TV_GetCheckBoxState.i(ControlID.i)
- Purpose: Returns the current state or value.
- Parameters: ControlID.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_GetCheckBoxState(...); use actual parameters from the SDK examples.

### TV_GetControlGeometry

- Signature: TV_GetControlGeometry.i(ControlID.i, *X.Integer, *Y.Integer, *Width.Integer, *Height.Integer)
- Purpose: Returns the current state or value.
- Parameters: ControlID.i, *X.Integer, *Y.Integer, *Width.Integer, *Height.Integer; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_GetControlGeometry(...); use actual parameters from the SDK examples.

### TV_GetNumberInputValue

- Signature: TV_GetNumberInputValue.q(ControlID.i)
- Purpose: Returns the current state or value.
- Parameters: ControlID.i; values are validated by the DLL.
- Returns: A 64-bit numeric value.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_GetNumberInputValue(...); use actual parameters from the SDK examples.

### TV_GetProgressBarValue

- Signature: TV_GetProgressBarValue.q(ControlID.i)
- Purpose: Returns the current state or value.
- Parameters: ControlID.i; values are validated by the DLL.
- Returns: A 64-bit numeric value.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_GetProgressBarValue(...); use actual parameters from the SDK examples.

### TV_GetRadioButtonState

- Signature: TV_GetRadioButtonState.i(ControlID.i)
- Purpose: Returns the current state or value.
- Parameters: ControlID.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_GetRadioButtonState(...); use actual parameters from the SDK examples.

### TV_GetScreenSize

- Signature: TV_GetScreenSize.i(*Width.Integer, *Height.Integer)
- Purpose: Returns the current state or value.
- Parameters: *Width.Integer, *Height.Integer; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_GetScreenSize(...); use actual parameters from the SDK examples.

### TV_GetSwitchState

- Signature: TV_GetSwitchState.i(ControlID.i)
- Purpose: Returns the current state or value.
- Parameters: ControlID.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_GetSwitchState(...); use actual parameters from the SDK examples.

### TV_GetTheme

- Signature: TV_GetTheme.i(*Theme.TV_Theme)
- Purpose: Returns the current state or value.
- Parameters: *Theme.TV_Theme; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_GetTheme(...); use actual parameters from the SDK examples.

### TV_GetTrackBarValue

- Signature: TV_GetTrackBarValue.q(ControlID.i)
- Purpose: Returns the current state or value.
- Parameters: ControlID.i; values are validated by the DLL.
- Returns: A 64-bit numeric value.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_GetTrackBarValue(...); use actual parameters from the SDK examples.

### TV_IsControlEnabled

- Signature: TV_IsControlEnabled.i(ControlID.i)
- Purpose: Returns the current state or value.
- Parameters: ControlID.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_IsControlEnabled(...); use actual parameters from the SDK examples.

### TV_IsControlVisible

- Signature: TV_IsControlVisible.i(ControlID.i)
- Purpose: Returns the current state or value.
- Parameters: ControlID.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_IsControlVisible(...); use actual parameters from the SDK examples.

### TV_IsIPv4ReadOnly

- Signature: TV_IsIPv4ReadOnly.i(ControlID.i)
- Purpose: Returns the current state or value.
- Parameters: ControlID.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_IsIPv4ReadOnly(...); use actual parameters from the SDK examples.

### TV_ListBoxAddItem

- Signature: TV_ListBoxAddItem.i(ControlID.i, Text.s)
- Purpose: Performs a public Binary SDK operation.
- Parameters: ControlID.i, Text.s; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_ListBoxAddItem(...); use actual parameters from the SDK examples.

### TV_ListBoxClear

- Signature: TV_ListBoxClear.i(ControlID.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: ControlID.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_ListBoxClear(...); use actual parameters from the SDK examples.

### TV_ListBoxDeleteItem

- Signature: TV_ListBoxDeleteItem.i(ControlID.i, Index.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: ControlID.i, Index.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_ListBoxDeleteItem(...); use actual parameters from the SDK examples.

### TV_ListBoxGetCurrent

- Signature: TV_ListBoxGetCurrent.i(ControlID.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: ControlID.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_ListBoxGetCurrent(...); use actual parameters from the SDK examples.

### TV_ListBoxGetItemCount

- Signature: TV_ListBoxGetItemCount.i(ControlID.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: ControlID.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_ListBoxGetItemCount(...); use actual parameters from the SDK examples.

### TV_ListBoxSetCurrent

- Signature: TV_ListBoxSetCurrent.i(ControlID.i, Index.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: ControlID.i, Index.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_ListBoxSetCurrent(...); use actual parameters from the SDK examples.

### TV_SetCalendarMonth

- Signature: TV_SetCalendarMonth.i(WindowID.i, Year.i, Month.i)
- Purpose: Changes the specified value or option.
- Parameters: WindowID.i, Year.i, Month.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_SetCalendarMonth(...); use actual parameters from the SDK examples.

### TV_SetCell

- Signature: TV_SetCell.i(X.i, Y.i, Character.i, Foreground.i, Background.i)
- Purpose: Changes the specified value or option.
- Parameters: X.i, Y.i, Character.i, Foreground.i, Background.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_SetCell(...); use actual parameters from the SDK examples.

### TV_SetCheckBoxState

- Signature: TV_SetCheckBoxState.i(ControlID.i, Checked.i)
- Purpose: Changes the specified value or option.
- Parameters: ControlID.i, Checked.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_SetCheckBoxState(...); use actual parameters from the SDK examples.

### TV_SetControlCommand

- Signature: TV_SetControlCommand.i(ControlID.i, Command.i)
- Purpose: Changes the specified value or option.
- Parameters: ControlID.i, Command.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_SetControlCommand(...); use actual parameters from the SDK examples.

### TV_SetControlStyle

- Signature: TV_SetControlStyle.i(ControlID.i, Style.i)
- Purpose: Changes the specified value or option.
- Parameters: ControlID.i, Style.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_SetControlStyle(...); use actual parameters from the SDK examples.

### TV_SetDefaultButton

- Signature: TV_SetDefaultButton.i(WindowID.i, ControlID.i)
- Purpose: Changes the specified value or option.
- Parameters: WindowID.i, ControlID.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_SetDefaultButton(...); use actual parameters from the SDK examples.

### TV_SetDesktopClock

- Signature: TV_SetDesktopClock.i(Mode.i, Location.i)
- Purpose: Changes the specified value or option.
- Parameters: Mode.i, Location.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_SetDesktopClock(...); use actual parameters from the SDK examples.

### TV_SetDesktopText

- Signature: TV_SetDesktopText.i(DesktopTextID.i, Text.s)
- Purpose: Changes the specified value or option.
- Parameters: DesktopTextID.i, Text.s; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_SetDesktopText(...); use actual parameters from the SDK examples.

### TV_SetHyperlinkText

- Signature: TV_SetHyperlinkText.i(ControlID.i, Text.s)
- Purpose: Changes the specified value or option.
- Parameters: ControlID.i, Text.s; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_SetHyperlinkText(...); use actual parameters from the SDK examples.

### TV_SetInputReadOnly

- Signature: TV_SetInputReadOnly.i(ControlID.i, ReadOnly.i)
- Purpose: Changes the specified value or option.
- Parameters: ControlID.i, ReadOnly.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_SetInputReadOnly(...); use actual parameters from the SDK examples.

### TV_SetInputText

- Signature: TV_SetInputText.i(ControlID.i, Text.s)
- Purpose: Changes the specified value or option.
- Parameters: ControlID.i, Text.s; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_SetInputText(...); use actual parameters from the SDK examples.

### TV_SetIPv4Address

- Signature: TV_SetIPv4Address.i(ControlID.i, Address.s)
- Purpose: Changes the specified value or option.
- Parameters: ControlID.i, Address.s; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_SetIPv4Address(...); use actual parameters from the SDK examples.

### TV_SetIPv4ReadOnly

- Signature: TV_SetIPv4ReadOnly.i(ControlID.i, ReadOnly.i)
- Purpose: Changes the specified value or option.
- Parameters: ControlID.i, ReadOnly.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_SetIPv4ReadOnly(...); use actual parameters from the SDK examples.

### TV_SetMenuBar

- Signature: TV_SetMenuBar(Text.s)
- Purpose: Changes the specified value or option.
- Parameters: Text.s; values are validated by the DLL.
- Returns: No return value.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_SetMenuBar(...); use actual parameters from the SDK examples.

### TV_SetNumberInputRange

- Signature: TV_SetNumberInputRange.i(ControlID.i, Minimum.q, Maximum.q)
- Purpose: Changes the specified value or option.
- Parameters: ControlID.i, Minimum.q, Maximum.q; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_SetNumberInputRange(...); use actual parameters from the SDK examples.

### TV_SetNumberInputReadOnly

- Signature: TV_SetNumberInputReadOnly.i(ControlID.i, ReadOnly.i)
- Purpose: Changes the specified value or option.
- Parameters: ControlID.i, ReadOnly.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_SetNumberInputReadOnly(...); use actual parameters from the SDK examples.

### TV_SetNumberInputValue

- Signature: TV_SetNumberInputValue.i(ControlID.i, Value.q)
- Purpose: Changes the specified value or option.
- Parameters: ControlID.i, Value.q; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_SetNumberInputValue(...); use actual parameters from the SDK examples.

### TV_SetProgressBarRange

- Signature: TV_SetProgressBarRange.i(ControlID.i, Minimum.q, Maximum.q)
- Purpose: Changes the specified value or option.
- Parameters: ControlID.i, Minimum.q, Maximum.q; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_SetProgressBarRange(...); use actual parameters from the SDK examples.

### TV_SetProgressBarValue

- Signature: TV_SetProgressBarValue.i(ControlID.i, Value.q)
- Purpose: Changes the specified value or option.
- Parameters: ControlID.i, Value.q; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_SetProgressBarValue(...); use actual parameters from the SDK examples.

### TV_SetRadioButtonState

- Signature: TV_SetRadioButtonState.i(ControlID.i, Selected.i)
- Purpose: Changes the specified value or option.
- Parameters: ControlID.i, Selected.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_SetRadioButtonState(...); use actual parameters from the SDK examples.

### TV_SetStatusBar

- Signature: TV_SetStatusBar(Text.s)
- Purpose: Changes the specified value or option.
- Parameters: Text.s; values are validated by the DLL.
- Returns: No return value.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_SetStatusBar(...); use actual parameters from the SDK examples.

### TV_SetStatusBarRightText

- Signature: TV_SetStatusBarRightText(Text.s)
- Purpose: Changes the specified value or option.
- Parameters: Text.s; values are validated by the DLL.
- Returns: No return value.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_SetStatusBarRightText(...); use actual parameters from the SDK examples.

### TV_SetSwitchState

- Signature: TV_SetSwitchState.i(ControlID.i, Checked.i)
- Purpose: Changes the specified value or option.
- Parameters: ControlID.i, Checked.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_SetSwitchState(...); use actual parameters from the SDK examples.

### TV_SetTextAreaReadOnly

- Signature: TV_SetTextAreaReadOnly.i(ControlID.i, ReadOnly.i)
- Purpose: Changes the specified value or option.
- Parameters: ControlID.i, ReadOnly.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_SetTextAreaReadOnly(...); use actual parameters from the SDK examples.

### TV_SetTextAreaText

- Signature: TV_SetTextAreaText.i(ControlID.i, Text.s)
- Purpose: Changes the specified value or option.
- Parameters: ControlID.i, Text.s; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_SetTextAreaText(...); use actual parameters from the SDK examples.

### TV_SetTheme

- Signature: TV_SetTheme.i(*Theme.TV_Theme)
- Purpose: Changes the specified value or option.
- Parameters: *Theme.TV_Theme; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_SetTheme(...); use actual parameters from the SDK examples.

### TV_SetTitle

- Signature: TV_SetTitle.i(Title.s)
- Purpose: Changes the specified value or option.
- Parameters: Title.s; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_SetTitle(...); use actual parameters from the SDK examples.

### TV_SetTrackBarRange

- Signature: TV_SetTrackBarRange.i(ControlID.i, Minimum.q, Maximum.q)
- Purpose: Changes the specified value or option.
- Parameters: ControlID.i, Minimum.q, Maximum.q; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_SetTrackBarRange(...); use actual parameters from the SDK examples.

### TV_SetTrackBarValue

- Signature: TV_SetTrackBarValue.i(ControlID.i, Value.q)
- Purpose: Changes the specified value or option.
- Parameters: ControlID.i, Value.q; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_SetTrackBarValue(...); use actual parameters from the SDK examples.

### TV_ShowControl

- Signature: TV_ShowControl.i(ControlID.i, Visible.i)
- Purpose: Shows an object or starts the specified UI action.
- Parameters: ControlID.i, Visible.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_ShowControl(...); use actual parameters from the SDK examples.

## Errors

### TV_CopyLastErrorText

- Signature: TV_CopyLastErrorText.i(*Buffer, BufferCharacters.i)
- Purpose: Copies a string result to a caller-owned UTF-16 buffer.
- Parameters: *Buffer, BufferCharacters.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CopyLastErrorText(...); use actual parameters from the SDK examples.

### TV_GetLastError

- Signature: TV_GetLastError.i()
- Purpose: Returns the current state or value.
- Parameters: none.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): Yes.
- After TV_Shutdown(): Yes.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_GetLastError(...); use actual parameters from the SDK examples.

## Events

### TV_DispatchEvent

- Signature: TV_DispatchEvent.i(*Event.TV_Event)
- Purpose: Performs a public Binary SDK operation.
- Parameters: *Event.TV_Event; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_DispatchEvent(...); use actual parameters from the SDK examples.

### TV_PollEvent

- Signature: TV_PollEvent.i(*Event.TV_Event)
- Purpose: Performs a public Binary SDK operation.
- Parameters: *Event.TV_Event; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_PollEvent(...); use actual parameters from the SDK examples.

### TV_WaitEvent

- Signature: TV_WaitEvent.i(*Event.TV_Event, Timeout.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: *Event.TV_Event, Timeout.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_WaitEvent(...); use actual parameters from the SDK examples.

## File dialogs

### TV_CloseFileDialog

- Signature: TV_CloseFileDialog.i(DialogID.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: DialogID.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CloseFileDialog(...); use actual parameters from the SDK examples.

### TV_CopyFileDialogPath

- Signature: TV_CopyFileDialogPath.i(DialogID.i, *Buffer, BufferCharacters.i)
- Purpose: Copies a string result to a caller-owned UTF-16 buffer.
- Parameters: DialogID.i, *Buffer, BufferCharacters.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CopyFileDialogPath(...); use actual parameters from the SDK examples.

### TV_GetFileDialogStatus

- Signature: TV_GetFileDialogStatus.i(DialogID.i)
- Purpose: Returns the current state or value.
- Parameters: DialogID.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_GetFileDialogStatus(...); use actual parameters from the SDK examples.

### TV_ShowOpenFileDialog

- Signature: TV_ShowOpenFileDialog.i(Title.s, InitialPath.s = "", Pattern.s = "*.*")
- Purpose: Shows an object or starts the specified UI action.
- Parameters: Title.s, InitialPath.s = "", Pattern.s = "*.*"; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_ShowOpenFileDialog(...); use actual parameters from the SDK examples.

### TV_ShowSaveFileDialog

- Signature: TV_ShowSaveFileDialog.i(Title.s, InitialPath.s = "", Pattern.s = "*.*")
- Purpose: Shows an object or starts the specified UI action.
- Parameters: Title.s, InitialPath.s = "", Pattern.s = "*.*"; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_ShowSaveFileDialog(...); use actual parameters from the SDK examples.

## Initialization

### TV_Init

- Signature: TV_Init.i(*Config.TV_Config)
- Purpose: Performs a public Binary SDK operation.
- Parameters: *Config.TV_Config; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_Init(...); use actual parameters from the SDK examples.

### TV_InitEx

- Signature: TV_InitEx.i(*Config.TV_Config, ExpectedAPIVersion.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: *Config.TV_Config, ExpectedAPIVersion.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_InitEx(...); use actual parameters from the SDK examples.

### TV_IsRunning

- Signature: TV_IsRunning.i()
- Purpose: Returns the current state or value.
- Parameters: none.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_IsRunning(...); use actual parameters from the SDK examples.

### TV_Shutdown

- Signature: TV_Shutdown()
- Purpose: Performs a public Binary SDK operation.
- Parameters: none.
- Returns: No return value.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_Shutdown(...); use actual parameters from the SDK examples.

### TV_Stop

- Signature: TV_Stop()
- Purpose: Performs a public Binary SDK operation.
- Parameters: none.
- Returns: No return value.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_Stop(...); use actual parameters from the SDK examples.

## MessageBox

### TV_ShowMessageBox

- Signature: TV_ShowMessageBox.i(Title.s, Text.s, Buttons.i, Flags.i)
- Purpose: Shows an object or starts the specified UI action.
- Parameters: Title.s, Text.s, Buttons.i, Flags.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_ShowMessageBox(...); use actual parameters from the SDK examples.

## Other

### TV_AddMenuItem

- Signature: TV_AddMenuItem.i(MenuID.i, Text.s, Command.i, ShortcutKey.i = 0, Modifiers.i = 0, Enabled.i = #True)
- Purpose: Performs a public Binary SDK operation.
- Parameters: MenuID.i, Text.s, Command.i, ShortcutKey.i = 0, Modifiers.i = 0, Enabled.i = #True; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_AddMenuItem(...); use actual parameters from the SDK examples.

### TV_AddMenuSeparator

- Signature: TV_AddMenuSeparator.i(MenuID.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: MenuID.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_AddMenuSeparator(...); use actual parameters from the SDK examples.

### TV_AddStatusItem

- Signature: TV_AddStatusItem.i(Text.s, Command.i, ShortcutKey.i = 0, Modifiers.i = 0, Enabled.i = #True)
- Purpose: Performs a public Binary SDK operation.
- Parameters: Text.s, Command.i, ShortcutKey.i = 0, Modifiers.i = 0, Enabled.i = #True; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_AddStatusItem(...); use actual parameters from the SDK examples.

### TV_ApplyThemeToConfig

- Signature: TV_ApplyThemeToConfig.i(*Config.TV_Config)
- Purpose: Performs a public Binary SDK operation.
- Parameters: *Config.TV_Config; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): Yes.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_ApplyThemeToConfig(...); use actual parameters from the SDK examples.

### TV_Clear

- Signature: TV_Clear.i(Character.i, Foreground.i, Background.i)
- Purpose: Clears the corresponding state.
- Parameters: Character.i, Foreground.i, Background.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_Clear(...); use actual parameters from the SDK examples.

### TV_ClearDesktopTexts

- Signature: TV_ClearDesktopTexts()
- Purpose: Clears the corresponding state.
- Parameters: none.
- Returns: No return value.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_ClearDesktopTexts(...); use actual parameters from the SDK examples.

### TV_ClearMenus

- Signature: TV_ClearMenus()
- Purpose: Clears the corresponding state.
- Parameters: none.
- Returns: No return value.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_ClearMenus(...); use actual parameters from the SDK examples.

### TV_ClearStatusItems

- Signature: TV_ClearStatusItems()
- Purpose: Clears the corresponding state.
- Parameters: none.
- Returns: No return value.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_ClearStatusItems(...); use actual parameters from the SDK examples.

### TV_DrawFrame

- Signature: TV_DrawFrame.i(X.i, Y.i, Width.i, Height.i, Style.i, Foreground.i, Background.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: X.i, Y.i, Width.i, Height.i, Style.i, Foreground.i, Background.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_DrawFrame(...); use actual parameters from the SDK examples.

### TV_DrawShadow

- Signature: TV_DrawShadow.i(X.i, Y.i, Width.i, Height.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: X.i, Y.i, Width.i, Height.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_DrawShadow(...); use actual parameters from the SDK examples.

### TV_DrawText

- Signature: TV_DrawText.i(X.i, Y.i, Text.s, Foreground.i, Background.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: X.i, Y.i, Text.s, Foreground.i, Background.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_DrawText(...); use actual parameters from the SDK examples.

### TV_EnableMenuItem

- Signature: TV_EnableMenuItem.i(ItemID.i, Enabled.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: ItemID.i, Enabled.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_EnableMenuItem(...); use actual parameters from the SDK examples.

### TV_EnableStatusItem

- Signature: TV_EnableStatusItem.i(ItemID.i, Enabled.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: ItemID.i, Enabled.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_EnableStatusItem(...); use actual parameters from the SDK examples.

### TV_FillRect

- Signature: TV_FillRect.i(X.i, Y.i, Width.i, Height.i, Character.i, Foreground.i, Background.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: X.i, Y.i, Width.i, Height.i, Character.i, Foreground.i, Background.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_FillRect(...); use actual parameters from the SDK examples.

### TV_MoveDesktopText

- Signature: TV_MoveDesktopText.i(DesktopTextID.i, X.i, Y.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: DesktopTextID.i, X.i, Y.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_MoveDesktopText(...); use actual parameters from the SDK examples.

### TV_RemoveDesktopText

- Signature: TV_RemoveDesktopText.i(DesktopTextID.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: DesktopTextID.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_RemoveDesktopText(...); use actual parameters from the SDK examples.

### TV_Render

- Signature: TV_Render.i()
- Purpose: Performs a public Binary SDK operation.
- Parameters: none.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_Render(...); use actual parameters from the SDK examples.

### TV_ResizeControl

- Signature: TV_ResizeControl.i(ControlID.i, X.i, Y.i, Width.i, Height.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: ControlID.i, X.i, Y.i, Width.i, Height.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_ResizeControl(...); use actual parameters from the SDK examples.

### TV_ShowCalculator

- Signature: TV_ShowCalculator.i()
- Purpose: Shows an object or starts the specified UI action.
- Parameters: none.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_ShowCalculator(...); use actual parameters from the SDK examples.

### TV_ShowCalendar

- Signature: TV_ShowCalendar.i(Year.i = 0, Month.i = 0)
- Purpose: Shows an object or starts the specified UI action.
- Parameters: Year.i = 0, Month.i = 0; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_ShowCalendar(...); use actual parameters from the SDK examples.

### TV_ShowDesktopText

- Signature: TV_ShowDesktopText.i(DesktopTextID.i, Visible.i)
- Purpose: Shows an object or starts the specified UI action.
- Parameters: DesktopTextID.i, Visible.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_ShowDesktopText(...); use actual parameters from the SDK examples.

### TV_UseClassicTheme

- Signature: TV_UseClassicTheme()
- Purpose: Performs a public Binary SDK operation.
- Parameters: none.
- Returns: No return value.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): Yes.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_UseClassicTheme(...); use actual parameters from the SDK examples.

## Version

### TV_CheckAPIVersion

- Signature: TV_CheckAPIVersion.i(ExpectedVersion.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: ExpectedVersion.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): Yes.
- After TV_Shutdown(): Yes.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CheckAPIVersion(...); use actual parameters from the SDK examples.

### TV_CopyCopyright

- Signature: TV_CopyCopyright.i(*Buffer, BufferCharacters.i)
- Purpose: Copies a string result to a caller-owned UTF-16 buffer.
- Parameters: *Buffer, BufferCharacters.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CopyCopyright(...); use actual parameters from the SDK examples.

### TV_CopyVersion

- Signature: TV_CopyVersion.i(*Buffer, BufferCharacters.i)
- Purpose: Copies a string result to a caller-owned UTF-16 buffer.
- Parameters: *Buffer, BufferCharacters.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): Yes.
- After TV_Shutdown(): Yes.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CopyVersion(...); use actual parameters from the SDK examples.

### TV_CopyVersionString

- Signature: TV_CopyVersionString.i(*Buffer, BufferCharacters.i)
- Purpose: Copies a string result to a caller-owned UTF-16 buffer.
- Parameters: *Buffer, BufferCharacters.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): Yes.
- After TV_Shutdown(): Yes.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CopyVersionString(...); use actual parameters from the SDK examples.

### TV_GetAPIVersion

- Signature: TV_GetAPIVersion.i()
- Purpose: Returns the current state or value.
- Parameters: none.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): Yes.
- After TV_Shutdown(): Yes.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_GetAPIVersion(...); use actual parameters from the SDK examples.

### TV_GetVersionMajor

- Signature: TV_GetVersionMajor.i()
- Purpose: Returns the current state or value.
- Parameters: none.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): Yes.
- After TV_Shutdown(): Yes.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_GetVersionMajor(...); use actual parameters from the SDK examples.

### TV_GetVersionMinor

- Signature: TV_GetVersionMinor.i()
- Purpose: Returns the current state or value.
- Parameters: none.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): Yes.
- After TV_Shutdown(): Yes.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_GetVersionMinor(...); use actual parameters from the SDK examples.

### TV_GetVersionPatch

- Signature: TV_GetVersionPatch.i()
- Purpose: Returns the current state or value.
- Parameters: none.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): Yes.
- After TV_Shutdown(): Yes.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_GetVersionPatch(...); use actual parameters from the SDK examples.

## Windows

### TV_ActivateNextWindow

- Signature: TV_ActivateNextWindow.i()
- Purpose: Performs a public Binary SDK operation.
- Parameters: none.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_ActivateNextWindow(...); use actual parameters from the SDK examples.

### TV_ActivateWindow

- Signature: TV_ActivateWindow.i(WindowID.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: WindowID.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_ActivateWindow(...); use actual parameters from the SDK examples.

### TV_CascadeWindows

- Signature: TV_CascadeWindows.i()
- Purpose: Performs a public Binary SDK operation.
- Parameters: none.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CascadeWindows(...); use actual parameters from the SDK examples.

### TV_CloseWindow

- Signature: TV_CloseWindow.i(WindowID.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: WindowID.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CloseWindow(...); use actual parameters from the SDK examples.

### TV_CreateWindow

- Signature: TV_CreateWindow.i(X.i, Y.i, Width.i, Height.i, Title.s, Flags.i)
- Purpose: Creates an object and returns its opaque numeric ID.
- Parameters: X.i, Y.i, Width.i, Height.i, Title.s, Flags.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_CreateWindow(...); use actual parameters from the SDK examples.

### TV_EnableWindow

- Signature: TV_EnableWindow.i(WindowID.i, Enabled.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: WindowID.i, Enabled.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_EnableWindow(...); use actual parameters from the SDK examples.

### TV_EndModal

- Signature: TV_EndModal.i(WindowID.i, Result.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: WindowID.i, Result.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_EndModal(...); use actual parameters from the SDK examples.

### TV_GetActiveWindow

- Signature: TV_GetActiveWindow.i()
- Purpose: Returns the current state or value.
- Parameters: none.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_GetActiveWindow(...); use actual parameters from the SDK examples.

### TV_GetModalResult

- Signature: TV_GetModalResult.i(WindowID.i)
- Purpose: Returns the current state or value.
- Parameters: WindowID.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_GetModalResult(...); use actual parameters from the SDK examples.

### TV_GetWindowGeometry

- Signature: TV_GetWindowGeometry.i(WindowID.i, *X.Integer, *Y.Integer, *Width.Integer, *Height.Integer)
- Purpose: Returns the current state or value.
- Parameters: WindowID.i, *X.Integer, *Y.Integer, *Width.Integer, *Height.Integer; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_GetWindowGeometry(...); use actual parameters from the SDK examples.

### TV_HideWindow

- Signature: TV_HideWindow.i(WindowID.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: WindowID.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_HideWindow(...); use actual parameters from the SDK examples.

### TV_IsWindowValid

- Signature: TV_IsWindowValid.i(WindowID.i)
- Purpose: Returns the current state or value.
- Parameters: WindowID.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_IsWindowValid(...); use actual parameters from the SDK examples.

### TV_IsWindowZoomed

- Signature: TV_IsWindowZoomed.i(WindowID.i)
- Purpose: Returns the current state or value.
- Parameters: WindowID.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_IsWindowZoomed(...); use actual parameters from the SDK examples.

### TV_MoveWindow

- Signature: TV_MoveWindow.i(WindowID.i, X.i, Y.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: WindowID.i, X.i, Y.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_MoveWindow(...); use actual parameters from the SDK examples.

### TV_ResizeWindow

- Signature: TV_ResizeWindow.i(WindowID.i, Width.i, Height.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: WindowID.i, Width.i, Height.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_ResizeWindow(...); use actual parameters from the SDK examples.

### TV_RestoreWindow

- Signature: TV_RestoreWindow.i(WindowID.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: WindowID.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_RestoreWindow(...); use actual parameters from the SDK examples.

### TV_SetWindowColors

- Signature: TV_SetWindowColors.i(WindowID.i, Foreground.i, Background.i)
- Purpose: Changes the specified value or option.
- Parameters: WindowID.i, Foreground.i, Background.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_SetWindowColors(...); use actual parameters from the SDK examples.

### TV_SetWindowTitle

- Signature: TV_SetWindowTitle.i(WindowID.i, Title.s)
- Purpose: Changes the specified value or option.
- Parameters: WindowID.i, Title.s; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_SetWindowTitle(...); use actual parameters from the SDK examples.

### TV_ShowModal

- Signature: TV_ShowModal.i(WindowID.i)
- Purpose: Shows an object or starts the specified UI action.
- Parameters: WindowID.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_ShowModal(...); use actual parameters from the SDK examples.

### TV_ShowWindow

- Signature: TV_ShowWindow.i(WindowID.i)
- Purpose: Shows an object or starts the specified UI action.
- Parameters: WindowID.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_ShowWindow(...); use actual parameters from the SDK examples.

### TV_ShowWindowSystemMenu

- Signature: TV_ShowWindowSystemMenu.i(WindowID.i = 0)
- Purpose: Shows an object or starts the specified UI action.
- Parameters: WindowID.i = 0; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_ShowWindowSystemMenu(...); use actual parameters from the SDK examples.

### TV_TileWindows

- Signature: TV_TileWindows.i()
- Purpose: Performs a public Binary SDK operation.
- Parameters: none.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_TileWindows(...); use actual parameters from the SDK examples.

### TV_ZoomWindow

- Signature: TV_ZoomWindow.i(WindowID.i)
- Purpose: Performs a public Binary SDK operation.
- Parameters: WindowID.i; values are validated by the DLL.
- Returns: An integer value, `#False`/0, or an ID as appropriate.
- Errors: on failure, use `TV_GetLastError()` and `TV_CopyLastErrorText()`; invalid IDs and parameters are rejected.
- Memory ownership: caller-owned memory remains with the caller; no DLL memory must be freed.
- Before TV_Init(): No, unless the function is explicitly limited to configuration.
- After TV_Shutdown(): No.
- Thread safety: none; call from the single UI thread.
- Example: Result = TV_ZoomWindow(...); use actual parameters from the SDK examples.
