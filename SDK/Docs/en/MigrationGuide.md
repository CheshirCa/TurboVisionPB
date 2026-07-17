<!-- TurboVisionPB 0.16.9 | (C) CheshirCa 2026 -->

# Migrating from the source include to the Binary SDK

[Русская версия](../MigrationGuide.md)

## Version changes

### 0.16.9

- standard window shadows preserve the glyph in each shaded cell;
- the Classic theme shows preserved glyphs dark gray on black;
- patterned shadows with a non-space `ShadowCharacter`, geometry, API, and ABI
  are unchanged.

### 0.15.0

- added ready-made Calendar and Calculator windows and state-reading APIs;
- added menu/status clocks and persistent right-aligned status text;
- existing enum values, signatures, and API behavior are unchanged;
- update the public include, DLL, and import library together.

### 0.14.0

- added desktop-text APIs without changing existing functions;
- added `TV_CreateBevelFrame()` and appended type/style constants;
- 0.13.8 application source needs no changes, but all 0.14.0 binaries and the
  include must be updated together.

### 0.11.0 to 0.13.0

- 0.11.0 added text-mode Open/Save dialogs, buffer-copy paths, adaptive control
  resize, and mouse dragging for `TextArea` scrollbar thumbs;
- 0.12.0 added `TV_CascadeWindows()`, `TV_TileWindows()`, and opt-in
  `TV_WINDOW_RESIZABLE` mouse resize;
- 0.13.0 added opt-in `TV_WINDOW_MOVABLE` title dragging without changing
  existing signatures or events.

### 0.13.1 to 0.13.8 shadow rendering

- 0.13.1 separated dark-gray button shadows from black window shadows;
- 0.13.2 introduced half-cell shadows;
- 0.13.3 removed unsupported quadrant glyphs;
- 0.13.4 selected Unicode or Raster/OEM fallbacks from the active font;
- 0.13.5 corrected Raster/Terminal detection and resize-handle fallback;
- 0.13.6 and 0.13.7 refined OEM shadow glyphs and corner geometry;
- 0.13.8 restored original Turbo Vision window-shadow geometry: two full cells
  on the right and one full row below, while button shadows keep `U+2584` and
  `U+2580` half blocks.

These rendering changes did not alter the binary ABI.

## Binary ABI migration

1. Replace `src/TurboVisionPB.pbi` with `SDK/Include/TurboVisionPB.pbi`.
2. Set `Config\StructureSize` and `Config\APIVersion` before `TV_Init()`.
3. Place the matching `TurboVisionPB.dll` next to the EXE.
4. Replace string getters with `TV_Copy*` and caller-owned UTF-16 buffers.
5. Do not use `TV_Internal*`, `TV_Window`, `TV_Control`, `TV_Buffer`, or custom
   backend registration; these are intentionally hidden.

Window and control IDs, events, commands, and numeric functions preserve their
previous semantics. Serial API migration is not available because that backend
is still under development.
