<!-- TurboVisionPB 0.16.9 | (C) CheshirCa 2026 -->

# Переход с исходного include на Binary SDK

[English version](en/MigrationGuide.md)

## Изменения 0.16.9

- стандартная оконная тень сохраняет символ затеняемой ячейки;
- Classic theme показывает этот символ dark gray на чёрном;
- patterned-тени с непробельным `ShadowCharacter`, геометрия, API и ABI не
  изменились.

## Изменения 0.15.0

- добавлены готовые окна Calendar/Calculator и функции чтения их состояния;
- добавлены часы menu/status bar и правый статический status text;
- существующие значения перечислений, сигнатуры и поведение API не изменены;
- public include, DLL и import library 0.15.0 следует обновлять вместе.

## Изменения 0.14.0

- добавлены новые API фонового текста desktop; существующие функции и их
  сигнатуры сохранены;
- добавлен `TV_CreateBevelFrame()` и новые значения типа/style, дописанные в
  конец существующих наборов констант;
- исходный код приложения 0.13.8 не требует изменений, но новый public include,
  DLL и import library 0.14.0 нужно обновлять вместе.

## Изменения 0.11.0

- нативные `OpenFileRequester()`/`SaveFileRequester()` можно заменить
  текстовыми `TV_ShowOpenFileDialog()`/`TV_ShowSaveFileDialog()`;
- строковый путь в бинарном SDK читается через `TV_CopyFileDialogPath()`;
- controls адаптируются к окну через `TV_ResizeControl()` при получении
  `TV_EVENT_RESIZE` с ненулевым `Source`;
- scrollbar `TextArea` теперь захватывает и перемещает thumb мышью.

## Изменения 0.12.0

- для многооконных приложений добавлены `TV_CascadeWindows()` и
  `TV_TileWindows()` с menu-командами `TV_CMD_CASCADE`/`TV_CMD_TILE`;
- opt-in флаг `TV_WINDOW_RESIZABLE` включает resize окна за правый нижний угол;
- существующая обработка оконного `TV_EVENT_RESIZE` остаётся совместимой.

## Изменения 0.13.0

- opt-in флаг `TV_WINDOW_MOVABLE` разрешает перетаскивание bordered-window за
  свободную часть заголовка;
- системное меню, Close и zoomed-состояние сохраняют прежнее поведение;
- сигнатуры существующих функций и события не менялись.

## Изменения 0.13.1

- Classic theme использует dark gray для `ButtonShadowForeground` и
  `ButtonShadowBackground`, сохраняя чёрную `ShadowBackground` окна;
- пользовательские темы и бинарный ABI не изменились.

## Изменения 0.13.2

- сплошные тени Classic theme и raised-кнопок используют half-block/quadrant
  символы и занимают половину знакоместа справа и снизу;
- нестандартный оконный `ShadowCharacter` продолжает рисоваться прежними целыми
  клетками; ABI и структура `TV_Theme` не менялись.

## Изменения 0.13.3

- тени больше не используют Unicode quadrant symbols, отсутствующие в некоторых
  console fonts;
- остаются только `U+2580` и `U+258C`, поэтому boxed-question fallback исчезает;
- размеры controls и ABI не изменились.

## Изменения 0.13.4

- точные quadrant-переходы возвращены для fonts, которые действительно имеют
  эти glyphs;
- Windows backend автоматически выбирает Unicode или Raster/OEM block fallback
  по активному console font;
- output code page не влияет на выбор, ABI не изменился.

## Изменения 0.13.5

- Raster/Terminal font больше не принимается за Unicode font из-за GDI font
  substitution;
- resize handle автоматически выбирает `U+25E2` либо OEM fallback `U+2593`;
- hit-testing, размеры окна и ABI не изменились.

## Изменения 0.13.6

- из OEM shadow fallback удалены выступающие `U+2584` и `U+2588`;
- остаются смещённые `U+258C`/`U+2580`, соответствующие CP866 DD/DF;
- внешняя угловая клетка не изменяется; ABI не менялся.

## Изменения 0.13.7

- точный нижний правый corner изменён на `U+2598` (верхняя левая четверть);
- Raster/OEM corner использует CP866 B0 (`U+2591`) как quarter-density fallback;
- правая тень однострочной кнопки опущена lower half-block; ABI не менялся.

## Изменения 0.13.8

- оконная тень возвращена к оригинальной геометрии Turbo Vision: 2 полные
  клетки справа и 1 строка снизу;
- button shadow остаётся полуклеточной на `U+2584`/`U+2580`;
- font detection теней удалён; ABI не менялся.

## Переход на бинарный ABI

1. Замените `src/TurboVisionPB.pbi` на `SDK/Include/TurboVisionPB.pbi`.
2. Добавьте `Config\StructureSize` и `Config\APIVersion` перед `TV_Init()`.
3. Размещайте подходящую `TurboVisionPB.dll` рядом с EXE.
4. Замените строковые getters на `TV_Copy*` и буфер UTF-16.
5. Не используйте `TV_Internal*`, `TV_Window`, `TV_Control`, `TV_Buffer` и
   регистрацию backend — эти сущности намеренно скрыты.

Оконные и control ID, события, команды и числовые функции сохраняют прежнюю
семантику. Serial API пока не переносится: он находится в разработке.
