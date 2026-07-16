<!-- TurboVisionPB 0.16.8 | (C) CheshirCa 2026 -->

# Window Cascade, Tile, move и mouse resize

Добавьте в меню встроенные команды:

```purebasic
WindowMenu = TV_CreateMenu("&Window")
TV_AddMenuItem(WindowMenu, "&Cascade", #TV_CMD_CASCADE)
TV_AddMenuItem(WindowMenu, "&Tile", #TV_CMD_TILE)
```

Те же операции вызываются напрямую через `TV_CascadeWindows()` и
`TV_TileWindows()`. Они обрабатывают все видимые немодальные окна и возвращают
`#False`, если открыто modal-window или размещать нечего.
Готовые Calendar и Calculator имеют фиксированную геометрию и исключаются из
Cascade/Tile; остальные окна раскладываются независимо от них.

Для resize мышью создайте окно с `#TV_WINDOW_RESIZABLE` и border. Правый нижний
угол активного окна становится resize handle. Изменения сообщаются оконными
`TV_EVENT_RESIZE`; дочерние controls адаптируются через `TV_ResizeControl()`.

Для перемещения добавьте `#TV_WINDOW_MOVABLE`, border и title. Drag начинается
на свободной части заголовка; системное меню и Close сохраняют свои действия.
Zoomed-окно мышью не перемещается.

После console resize обычные окна удерживаются в рабочей области между menu
bar и status bar. Если окно выше доступной области, его высота уменьшается, а
верхняя рамка остаётся видимой под menu bar.

Полный многооконный сценарий находится в `Example06_TextEditor.pb`.
