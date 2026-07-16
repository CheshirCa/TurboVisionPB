<!-- TurboVisionPB 0.16.8 | (C) CheshirCa 2026 -->

# Быстрый старт

[English version](en/GettingStarted.md)

Требуются Windows 10/11 или Windows Server 2022 и PureBasic 6.40 x64 либо x86.
Архитектуры приложения, `TurboVisionPB.lib` и `TurboVisionPB.dll` должны
совпадать.

Готовые примеры находятся в `SDK/Examples/Bin/x64` и `x86`. Каждый EXE
самодостаточен и запускается напрямую без `TurboVisionPB.dll`. Инструкции ниже
относятся к самостоятельной компиляции открытых `.pb` примеров и приложений,
которые используют обычную DLL-модель SDK.

Example01, 02, 03, 06 и 07 являются консольными TUI-программами. Их packaged
EXE имеют PE Subsystem `Console`: Проводник открывает для них консоль, а
cmd/PowerShell не возвращают prompt до завершения. Example04 и 05 используют
PE Subsystem `Windows GUI`.

Системный заголовок каждого запускаемого примера содержит строку версии
TurboVisionPB, полученную из подключённой библиотеки.

1. Сохраните структуру `SDK/Include` и `SDK/Lib` для компиляции.
2. Подключите `XIncludeFile "..\Include\TurboVisionPB.pbi"`.
3. После сборки скопируйте DLL из `SDK/Bin/<architecture>` рядом с EXE.
4. Заполните обязательные `StructureSize` и `APIVersion`.

```purebasic
Define Config.TV_Config
Define Event.TV_Event

Config\StructureSize = SizeOf(TV_Config)
Config\APIVersion = #TV_API_VERSION
Config\BackendType = #TV_BACKEND_WINDOWS_CONSOLE
Config\ConsoleMode = #TV_CONSOLE_MODE_CURRENT

TV_UseClassicTheme()
TV_ApplyThemeToConfig(@Config)
If TV_SelectBackend(Config\BackendType) And TV_Init(@Config)
  WindowID = TV_CreateWindow(0, 0, 50, 12, "Hello",
                             #TV_WINDOW_VISIBLE | #TV_WINDOW_ENABLED |
                             #TV_WINDOW_BORDER | #TV_WINDOW_TITLE |
                             #TV_WINDOW_CENTERED)
  TV_CreateButton(WindowID, 18, 7, 12, "Close", #TV_CMD_CLOSE)
  While TV_IsRunning()
    While TV_PollEvent(@Event)
      TV_DispatchEvent(@Event)
      If Event\Type = #TV_EVENT_COMMAND And Event\Command = #TV_CMD_CLOSE
        TV_Stop()
      EndIf
    Wend
    TV_Render()
  Wend
  TV_Shutdown()
EndIf
```

Строковые результаты используют вызывающий UTF-16 буфер:

```purebasic
Dim Buffer.u(63)
Required = TV_CopyVersionString(@Buffer(), ArraySize(Buffer()) + 1)
Version.s = PeekS(@Buffer(), -1, #PB_Unicode)
```

`Required` включает завершающий ноль. Нулевой указатель и ёмкость 0 позволяют
сначала запросить требуемый размер. Библиотека однопоточная; все вызовы UI и
событийный цикл выполняйте из одного потока.

Для редакторов и адаптивных форм используйте встроенные текстовые
`TV_ShowOpenFileDialog()`/`TV_ShowSaveFileDialog()`, `TV_ResizeControl()` и
оконные `TV_EVENT_RESIZE`. Полный сценарий находится в
`SDK/Examples/Example06_TextEditor.pb`.

Многооконный редактор также показывает меню Window с командами Cascade/Tile,
drag заголовка при `TV_WINDOW_MOVABLE` и resize bordered-window при
`TV_WINDOW_RESIZABLE`.

Для постоянной подписи на свободном desktop используйте
`TV_CreateDesktopText()`. Выпуклые и вдавленные границы внутри окна создаются
через `TV_CreateBevelFrame()` со стилями `#TV_BEVEL_RAISED` и
`#TV_BEVEL_SUNKEN`. Полный контракт приведён в `DesktopDecorations.md`.

Готовые окна календаря и калькулятора создаются функциями
`TV_ShowCalendar()` и `TV_ShowCalculator()`. Часы и правый текст desktop bars
настраиваются через `TV_SetDesktopClock()` и `TV_SetStatusBarRightText()`.
См. `TemplateWindows.md` и `Example07_TurboVisionDemo.pb`.

В Classic theme тень окна остаётся чёрной, а тень raised-кнопки использует dark
gray. Окно использует классические две полные клетки справа и одну строку
снизу; raised-кнопка — `▄` справа и `▀` снизу. Цвета можно изменить через поля
`TV_Theme` и `TV_SetTheme()`.
