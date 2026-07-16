<!-- TurboVisionPB 0.16.8 | (C) CheshirCa 2026 -->

# Window Cascade, Tile, move, and mouse resize

[Русская версия](../WindowLayouts.md)

Add the built-in commands to a menu:

```purebasic
WindowMenu = TV_CreateMenu("&Window")
TV_AddMenuItem(WindowMenu, "&Cascade", #TV_CMD_CASCADE)
TV_AddMenuItem(WindowMenu, "&Tile", #TV_CMD_TILE)
```

The same operations are available through `TV_CascadeWindows()` and
`TV_TileWindows()`. They process visible non-modal windows and return `#False`
when a modal window is open or there is nothing to arrange. The fixed-size
Calendar and Calculator windows are excluded.

For mouse resizing, create a bordered window with `#TV_WINDOW_RESIZABLE`. Its
bottom-right corner becomes the resize handle. Changes arrive as window
`TV_EVENT_RESIZE` events; adapt child controls with `TV_ResizeControl()`.

For movement, add `#TV_WINDOW_MOVABLE`, a border, and a title. Drag starts on
the unused title area; system-menu and Close actions remain available. A
zoomed window cannot be moved with the mouse.

After a console resize, ordinary windows are kept between the menu and status
bars. If a window is too tall, its height is reduced while its top border
remains visible below the menu bar.

See `Example06_TextEditor.pb` for a complete multi-window example.
