<!-- TurboVisionPB 0.16.8 | (C) CheshirCa 2026 -->

# TurboVisionPB: руководство программиста

Этот файл описывает установку, подключение, событийную модель и весь публичный
API TurboVisionPB 0.16.8. Библиотека предназначена для PureBasic 6.40 Unicode
под Windows 10/11 и Windows Server 2022. UI однопоточный: все вызовы выполняются
из одного потока, где работает событийный цикл.

## 1. Выбор поставки и установка

Public Binary SDK находится в `release/public/SDK`:

- `Include/TurboVisionPB.pbi` — единственный public include;
- `Lib/x64|x86/TurboVisionPB.lib` — import library;
- `Bin/x64|x86/TurboVisionPB.dll` — runtime DLL;
- `Examples` — исходники примеров;
- `Examples/Bin/x64|x86` — готовые самодостаточные EXE;
- `Docs` — документация.

Архитектура компилятора, import library и DLL обязана совпадать. Сохраните
структуру `Include`, `Lib` и `Bin`; положите DLL нужной архитектуры рядом с EXE
своего приложения. Готовые EXE примеров самодостаточны и DLL не требуют.

Для внутренней разработки с исходниками достаточно:

```purebasic
XIncludeFile "src/TurboVisionPB.pbi"
```

Для Binary SDK подключайте:

```purebasic
XIncludeFile "SDK/Include/TurboVisionPB.pbi"
```

## 2. Минимальная программа

```purebasic
EnableExplicit
XIncludeFile "SDK/Include/TurboVisionPB.pbi"

Define Config.TV_Config
Define Event.TV_Event
Define WindowID.i

Config\StructureSize = SizeOf(TV_Config)
Config\APIVersion = #TV_API_VERSION
Config\BackendType = #TV_BACKEND_WINDOWS_CONSOLE
Config\ConsoleMode = #TV_CONSOLE_MODE_CURRENT

TV_UseClassicTheme()
TV_ApplyThemeToConfig(@Config)
If TV_SelectBackend(Config\BackendType) = #False Or TV_Init(@Config) = #False
  End 1
EndIf

WindowID = TV_CreateWindow(0, 0, 50, 12, "Hello",
  #TV_WINDOW_VISIBLE | #TV_WINDOW_ENABLED | #TV_WINDOW_BORDER |
  #TV_WINDOW_TITLE | #TV_WINDOW_CENTERED)
TV_CreateButton(WindowID, 18, 7, 12, "Close", #TV_CMD_CLOSE)

While TV_IsRunning()
  While TV_PollEvent(@Event)
    TV_DispatchEvent(@Event)
    If Event\Type = #TV_EVENT_COMMAND And Event\Command = #TV_CMD_CLOSE
      TV_Stop()
    EndIf
  Wend
  TV_Render()
  Delay(10)
Wend
TV_Shutdown()
```

Console TUI собирайте с `/CONSOLE`. Обычные GUI-приложения собирайте без него.

## 3. TV_Config

В Binary SDK обязательно заполните `StructureSize` и `APIVersion`. Основные
поля: `BackendType`, необязательные `ScreenWidth/ScreenHeight`, desktop-символ
и цвета, `EnableMouse`, `EnablePartialUpdates`, `UserData`, `ConsoleMode`.
Рекомендуемый путь — сначала `TV_UseClassicTheme()`, затем
`TV_ApplyThemeToConfig(@Config)` и только потом пользовательские переопределения.

Режимы консоли: `CURRENT` использует текущую/родительскую консоль, `NEW`
создаёт отдельную, `AUTO` последовательно пробует оба варианта. Для TUI EXE,
запускаемого из Проводника, используйте console subsystem.

## 4. Событийная модель

`TV_PollEvent()` не блокирует, `TV_WaitEvent()` допускает timeout. Каждое
полученное событие передайте в `TV_DispatchEvent()` до прикладного анализа:
dispatcher обновляет focus, controls, меню, диалоги и готовые окна. Команда
control приходит как `TV_EVENT_COMMAND`: `Command` — код, `Source` — ControlID.
Screen resize имеет `Source = 0`, новую ширину в `MouseX`, высоту в `MouseY`.
Оконный resize использует WindowID в `Source`.
При каждом изменении размера библиотека пересоздаёт оба виртуальных буфера и
отдельно перевыделяет Windows `CHAR_INFO` массив; приложение не должно хранить
указатели на внутренние кадры.

## 5. Координаты, ID и владение памятью

Координаты окна относятся к экрану, координаты control — к client area окна.
Все ID непрозрачны; не трактуйте их как адреса. После закрытия объекта ID
недействителен. Функции `TV_Copy*` используют UTF-16 буфер вызывающего и
возвращают требуемую ёмкость вместе с завершающим нулём:

```purebasic
Dim Buffer.u(63)
Required = TV_CopyInputText(InputID, @Buffer(), ArraySize(Buffer()) + 1)
Text.s = PeekS(@Buffer(), -1, #PB_Unicode)
```

Для длинной строки сначала вызовите Copy-функцию с нулевым буфером и ёмкостью
0, выделите требуемое число `.u`, затем повторите вызов. DLL не требует
освобождать какую-либо возвращённую память.

## 6. Ошибки и завершение

Проверяйте возвращаемые значения. После отказа прочитайте `TV_GetLastError()`
и `TV_CopyLastErrorText()`. Всегда завершайте успешную инициализацию вызовом
`TV_Shutdown()`: он восстанавливает режимы, курсор, viewport, содержимое и
заголовок консоли.

## 7. Окна, controls и команды

Controls создаются относительно client area существующего окна. Create-функция
возвращает ID; значение 0 означает ошибку. Фокус получают только видимые,
доступные controls с TabStop. `TV_DispatchEvent()` преобразует Enter, Space,
клики и shortcuts в `TV_EVENT_COMMAND`. Пользовательские команды начинайте с
`#TV_CMD_USER`.

Флаг окна `TV_WINDOW_RESIZABLE` разрешает mouse resize, `TV_WINDOW_MOVABLE` —
drag заголовка, `TV_WINDOW_SYSTEM_MENU` — системное меню. Программные Zoom,
Cascade и Tile backend-независимы. Calendar и Calculator имеют фиксированную
геометрию: они перемещаются, но не resize/Zoom и не входят в Cascade/Tile.
Если экран временно становится ниже фиксированного окна, его заголовок остаётся
в рабочей области под menu bar, а нижняя часть клипуется.
Обычные окна при уменьшении экрана ограничиваются той же рабочей областью:
верхняя рамка не может оказаться под menu bar, а высота при необходимости
уменьшается до доступной области. Close обычного окна возвращает
`TV_EVENT_COMMAND`; приложение проверяет `Source` и вызывает `TV_CloseWindow()`.
Desktop menu и системное меню окна взаимоисключающие: открытие одного popup
закрывает другой. Это сохраняется после resize, Cascade/Tile и закрытия окон.

## 8. Готовые окна и диалоги

MessageBox и файловые диалоги неблокирующие: приложение продолжает общий цикл
событий. Calendar и Calculator полностью обслуживаются dispatcher; их
внутренние команды и Close из системного меню не требуют прикладного handler.
Статус файлового диалога проверяйте после команды
`TV_CMD_FILE_DIALOG_DONE`, затем копируйте путь и закрывайте диалог.

## 9. Каталог функций

## Базовые controls

### TV_CopyInputText

- Сигнатура: `TV_CopyInputText.i(ControlID.i, *Buffer, BufferCharacters.i)`
- Назначение: Копирует текст control в UTF-16 буфер.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Требуемую ёмкость UTF-16 буфера в символах, включая завершающий ноль.
- Пример: `Result = TV_CopyInputText(ControlID, @Buffer(), ' ')`

### TV_CreateBevelFrame

- Сигнатура: `TV_CreateBevelFrame.i(WindowID.i, X.i, Y.i, Width.i, Height.i, Style.i)`
- Назначение: Создаёт объёмную рамку внутри окна и возвращает ControlID.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Положительный ID при успехе, `0` при ошибке.
- Пример: `Result = TV_CreateBevelFrame(WindowID, 2, 2, 20, 5, Style)`

### TV_CreateButton

- Сигнатура: `TV_CreateButton.i(WindowID.i, X.i, Y.i, Width.i, Text.s, Command.i)`
- Назначение: Создаёт кнопку внутри окна и возвращает ControlID.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Положительный ID при успехе, `0` при ошибке.
- Пример: `Result = TV_CreateButton(WindowID, 2, 2, 20, "Text", #TV_CMD_USER + 1)`

### TV_CreateCheckBox

- Сигнатура: `TV_CreateCheckBox.i(WindowID.i, X.i, Y.i, Text.s, Checked.i)`
- Назначение: Создаёт флажок внутри окна и возвращает ControlID.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Положительный ID при успехе, `0` при ошибке.
- Пример: `Result = TV_CreateCheckBox(WindowID, 2, 2, "Text", #True)`

### TV_CreateGroupBox

- Сигнатура: `TV_CreateGroupBox.i(WindowID.i, X.i, Y.i, Width.i, Height.i, Text.s)`
- Назначение: Создаёт групповую рамку внутри окна и возвращает ControlID.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Положительный ID при успехе, `0` при ошибке.
- Пример: `Result = TV_CreateGroupBox(WindowID, 2, 2, 20, 5, "Text")`

### TV_CreateInput

- Сигнатура: `TV_CreateInput.i(WindowID.i, X.i, Y.i, Width.i, MaxLength.i)`
- Назначение: Создаёт однострочное поле ввода внутри окна и возвращает ControlID.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Положительный ID при успехе, `0` при ошибке.
- Пример: `Result = TV_CreateInput(WindowID, 2, 2, 20, MaxLength)`

### TV_CreateLabel

- Сигнатура: `TV_CreateLabel.i(WindowID.i, X.i, Y.i, Text.s)`
- Назначение: Создаёт статическую подпись внутри окна и возвращает ControlID.
- Условия: Вызывать из единственного UI-потока; проверять ID и возвращаемое значение.
- Результат: Положительный ID при успехе, `0` при ошибке.
- Пример: `Result = TV_CreateLabel(WindowID, 2, 2, "Text")`

### TV_CreateRadioButton

- Сигнатура: `TV_CreateRadioButton.i(WindowID.i, X.i, Y.i, Text.s, GroupID.i, Selected.i)`
- Назначение: Создаёт radio button внутри окна и возвращает ControlID.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Положительный ID при успехе, `0` при ошибке.
- Пример: `Result = TV_CreateRadioButton(WindowID, 2, 2, "Text", GroupID, #True)`

### TV_EnableControl

- Сигнатура: `TV_EnableControl.i(ControlID.i, Enabled.i)`
- Назначение: Меняет доступность или видимость control с автоматической коррекцией фокуса.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_EnableControl(ControlID, #True)`

### TV_GetCheckBoxState

- Сигнатура: `TV_GetCheckBoxState.i(ControlID.i)`
- Назначение: Возвращает логическое состояние control.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_GetCheckBoxState(ControlID)`

### TV_GetControlGeometry

- Сигнатура: `TV_GetControlGeometry.i(ControlID.i, *X.Integer, *Y.Integer, *Width.Integer, *Height.Integer)`
- Назначение: Копирует геометрию control относительно клиентской области.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_GetControlGeometry(ControlID, @X, @Y, @Width, @Height)`

### TV_GetRadioButtonState

- Сигнатура: `TV_GetRadioButtonState.i(ControlID.i)`
- Назначение: Возвращает логическое состояние control.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_GetRadioButtonState(ControlID)`

### TV_IsControlEnabled

- Сигнатура: `TV_IsControlEnabled.i(ControlID.i)`
- Назначение: Возвращает доступность или видимость control.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_IsControlEnabled(ControlID)`

### TV_IsControlVisible

- Сигнатура: `TV_IsControlVisible.i(ControlID.i)`
- Назначение: Возвращает доступность или видимость control.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_IsControlVisible(ControlID)`

### TV_ResizeControl

- Сигнатура: `TV_ResizeControl.i(ControlID.i, X.i, Y.i, Width.i, Height.i)`
- Назначение: Изменяет геометрию существующего control внутри клиентской области.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_ResizeControl(ControlID, 2, 2, 20, 5)`

### TV_SetCheckBoxState

- Сигнатура: `TV_SetCheckBoxState.i(ControlID.i, Checked.i)`
- Назначение: Устанавливает логическое состояние control.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_SetCheckBoxState(ControlID, #True)`

### TV_SetControlCommand

- Сигнатура: `TV_SetControlCommand.i(ControlID.i, Command.i)`
- Назначение: Изменяет команду или визуальный стиль control.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_SetControlCommand(ControlID, #TV_CMD_USER + 1)`

### TV_SetControlStyle

- Сигнатура: `TV_SetControlStyle.i(ControlID.i, Style.i)`
- Назначение: Изменяет команду или визуальный стиль control.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_SetControlStyle(ControlID, Style)`

### TV_SetDefaultButton

- Сигнатура: `TV_SetDefaultButton.i(WindowID.i, ControlID.i)`
- Назначение: Назначает default-кнопку окна для обработки Enter.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_SetDefaultButton(WindowID, ControlID)`

### TV_SetInputReadOnly

- Сигнатура: `TV_SetInputReadOnly.i(ControlID.i, ReadOnly.i)`
- Назначение: Включает или выключает read-only режим редактируемого control.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_SetInputReadOnly(ControlID, #True)`

### TV_SetInputText

- Сигнатура: `TV_SetInputText.i(ControlID.i, Text.s)`
- Назначение: Заменяет текст редактируемого control.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_SetInputText(ControlID, "Text")`

### TV_SetRadioButtonState

- Сигнатура: `TV_SetRadioButtonState.i(ControlID.i, Selected.i)`
- Назначение: Устанавливает логическое состояние control.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_SetRadioButtonState(ControlID, #True)`

### TV_ShowControl

- Сигнатура: `TV_ShowControl.i(ControlID.i, Visible.i)`
- Назначение: Меняет доступность или видимость control с автоматической коррекцией фокуса.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_ShowControl(ControlID, #True)`


## Версия и ошибки

### TV_CheckAPIVersion

- Сигнатура: `TV_CheckAPIVersion.i(ExpectedVersion.i)`
- Назначение: Сравнивает ожидаемую API-версию с версией библиотеки.
- Условия: Можно вызывать до `TV_Init()`; переданные указатели должны быть ненулевыми там, где это требуется.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_CheckAPIVersion(#TV_API_VERSION)`

### TV_CopyCopyright

- Сигнатура: `TV_CopyCopyright.i(*Buffer, BufferCharacters.i)`
- Назначение: Копирует copyright notice в UTF-16 буфер.
- Условия: Можно вызывать до `TV_Init()`; переданные указатели должны быть ненулевыми там, где это требуется.
- Результат: Требуемую ёмкость UTF-16 буфера в символах, включая завершающий ноль.
- Пример: `Result = TV_CopyCopyright(@Buffer(), ' ')`

### TV_CopyLastErrorText

- Сигнатура: `TV_CopyLastErrorText.i(*Buffer, BufferCharacters.i)`
- Назначение: Копирует описание последней ошибки в UTF-16 буфер.
- Условия: Можно вызывать до `TV_Init()`; переданные указатели должны быть ненулевыми там, где это требуется.
- Результат: Требуемую ёмкость UTF-16 буфера в символах, включая завершающий ноль.
- Пример: `Result = TV_CopyLastErrorText(@Buffer(), ' ')`

### TV_CopyVersion

- Сигнатура: `TV_CopyVersion.i(*Buffer, BufferCharacters.i)`
- Назначение: Копирует строку версии в UTF-16 буфер.
- Условия: Можно вызывать до `TV_Init()`; переданные указатели должны быть ненулевыми там, где это требуется.
- Результат: Требуемую ёмкость UTF-16 буфера в символах, включая завершающий ноль.
- Пример: `Result = TV_CopyVersion(@Buffer(), ' ')`

### TV_CopyVersionString

- Сигнатура: `TV_CopyVersionString.i(*Buffer, BufferCharacters.i)`
- Назначение: Копирует строку версии в UTF-16 буфер.
- Условия: Можно вызывать до `TV_Init()`; переданные указатели должны быть ненулевыми там, где это требуется.
- Результат: Требуемую ёмкость UTF-16 буфера в символах, включая завершающий ноль.
- Пример: `Result = TV_CopyVersionString(@Buffer(), ' ')`

### TV_GetAPIVersion

- Сигнатура: `TV_GetAPIVersion.i()`
- Назначение: Возвращает упакованную числовую API-версию.
- Условия: Можно вызывать до `TV_Init()`; переданные указатели должны быть ненулевыми там, где это требуется.
- Результат: Запрошенное целое значение согласно назначению.
- Пример: `Result = TV_GetAPIVersion()`

### TV_GetLastError

- Сигнатура: `TV_GetLastError.i()`
- Назначение: Возвращает последний общий код ошибки библиотеки.
- Условия: Можно вызывать до `TV_Init()`; переданные указатели должны быть ненулевыми там, где это требуется.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_GetLastError()`

### TV_GetVersionMajor

- Сигнатура: `TV_GetVersionMajor.i()`
- Назначение: Возвращает major-компонент версии.
- Условия: Можно вызывать до `TV_Init()`; переданные указатели должны быть ненулевыми там, где это требуется.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_GetVersionMajor()`

### TV_GetVersionMinor

- Сигнатура: `TV_GetVersionMinor.i()`
- Назначение: Возвращает minor-компонент версии.
- Условия: Можно вызывать до `TV_Init()`; переданные указатели должны быть ненулевыми там, где это требуется.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_GetVersionMinor()`

### TV_GetVersionPatch

- Сигнатура: `TV_GetVersionPatch.i()`
- Назначение: Возвращает patch-компонент версии.
- Условия: Можно вызывать до `TV_Init()`; переданные указатели должны быть ненулевыми там, где это требуется.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_GetVersionPatch()`


## Готовые окна и MessageBox

### TV_CopyCalculatorDisplay

- Сигнатура: `TV_CopyCalculatorDisplay.i(WindowID.i, *Buffer, BufferCharacters.i)`
- Назначение: Копирует строку дисплея Calculator в UTF-16 буфер.
- Условия: Требуется успешный `TV_Init()` и действительный WindowID, если он передаётся.
- Результат: Требуемую ёмкость UTF-16 буфера в символах, включая завершающий ноль.
- Пример: `Result = TV_CopyCalculatorDisplay(WindowID, @Buffer(), ' ')`

### TV_GetCalendarDate

- Сигнатура: `TV_GetCalendarDate.q(WindowID.i)`
- Назначение: Возвращает выбранную Calendar дату в формате PureBasic Date.
- Условия: Требуется успешный `TV_Init()` и действительный WindowID, если он передаётся.
- Результат: 64-битное значение; `0` также может означать отсутствие результата.
- Пример: `Result = TV_GetCalendarDate(WindowID)`

### TV_SetCalendarMonth

- Сигнатура: `TV_SetCalendarMonth.i(WindowID.i, Year.i, Month.i)`
- Назначение: Переключает готовый Calendar на заданный год и месяц.
- Условия: Требуется успешный `TV_Init()` и действительный WindowID, если он передаётся.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_SetCalendarMonth(WindowID, 2026, 7)`

### TV_ShowCalculator

- Сигнатура: `TV_ShowCalculator.i()`
- Назначение: Создаёт готовое перемещаемое окно калькулятора с фиксированной геометрией.
- Условия: Требуется успешный `TV_Init()`; функция создаёт новое окно и возвращает его ID.
- Результат: Положительный ID при успехе, `0` при ошибке.
- Пример: `Result = TV_ShowCalculator()`

### TV_ShowCalendar

- Сигнатура: `TV_ShowCalendar.i(Year.i = 0, Month.i = 0)`
- Назначение: Создаёт готовое перемещаемое окно календаря с фиксированной геометрией.
- Условия: Требуется успешный `TV_Init()`; функция создаёт новое окно и возвращает его ID.
- Результат: Положительный ID при успехе, `0` при ошибке.
- Пример: `Result = TV_ShowCalendar(2026, 7)`

### TV_ShowMessageBox

- Сигнатура: `TV_ShowMessageBox.i(Title.s, Text.s, Buttons.i, Flags.i)`
- Назначение: Создаёт неблокирующее модальное текстовое MessageBox.
- Условия: Требуется успешный `TV_Init()`; функция создаёт новое окно и возвращает его ID.
- Результат: Положительный ID при успехе, `0` при ошибке.
- Пример: `Result = TV_ShowMessageBox("Text", "Text", Buttons, #TV_WINDOW_VISIBLE | #TV_WINDOW_BORDER)`


## Дополнительные controls

### TV_CopyHyperlinkText

- Сигнатура: `TV_CopyHyperlinkText.i(ControlID.i, *Buffer, BufferCharacters.i)`
- Назначение: Копирует текст Hyperlink в UTF-16 буфер.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Требуемую ёмкость UTF-16 буфера в символах, включая завершающий ноль.
- Пример: `Result = TV_CopyHyperlinkText(ControlID, @Buffer(), ' ')`

### TV_CopyIPv4Address

- Сигнатура: `TV_CopyIPv4Address.i(ControlID.i, *Buffer, BufferCharacters.i)`
- Назначение: Копирует IPv4-адрес в UTF-16 буфер.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Требуемую ёмкость UTF-16 буфера в символах, включая завершающий ноль.
- Пример: `Result = TV_CopyIPv4Address(ControlID, @Buffer(), ' ')`

### TV_CreateHyperlink

- Сигнатура: `TV_CreateHyperlink.i(WindowID.i, X.i, Y.i, Text.s, Command.i)`
- Назначение: Создаёт текстовую ссылку внутри окна и возвращает ControlID.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Положительный ID при успехе, `0` при ошибке.
- Пример: `Result = TV_CreateHyperlink(WindowID, 2, 2, "Text", #TV_CMD_USER + 1)`

### TV_CreateIPv4Input

- Сигнатура: `TV_CreateIPv4Input.i(WindowID.i, X.i, Y.i, Address.s = "0.0.0.0", ReadOnly.i = #False)`
- Назначение: Создаёт поле IPv4 внутри окна и возвращает ControlID.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Положительный ID при успехе, `0` при ошибке.
- Пример: `Result = TV_CreateIPv4Input(WindowID, 2, 2, "192.168.1.10", #True)`

### TV_CreateProgressBar

- Сигнатура: `TV_CreateProgressBar.i(WindowID.i, X.i, Y.i, Width.i, Minimum.q, Maximum.q, Value.q)`
- Назначение: Создаёт индикатор прогресса внутри окна и возвращает ControlID.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Положительный ID при успехе, `0` при ошибке.
- Пример: `Result = TV_CreateProgressBar(WindowID, 2, 2, 20, 0, 100, 50)`

### TV_CreateSwitch

- Сигнатура: `TV_CreateSwitch.i(WindowID.i, X.i, Y.i, Text.s, Checked.i, Command.i = #TV_CMD_NONE)`
- Назначение: Создаёт двухпозиционный переключатель внутри окна и возвращает ControlID.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Положительный ID при успехе, `0` при ошибке.
- Пример: `Result = TV_CreateSwitch(WindowID, 2, 2, "Text", #True, #TV_CMD_USER + 1)`

### TV_CreateTrackBar

- Сигнатура: `TV_CreateTrackBar.i(WindowID.i, X.i, Y.i, Width.i, Minimum.q, Maximum.q, Value.q, StepValue.q = 1, Command.i = #TV_CMD_NONE)`
- Назначение: Создаёт ползунок внутри окна и возвращает ControlID.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Положительный ID при успехе, `0` при ошибке.
- Пример: `Result = TV_CreateTrackBar(WindowID, 2, 2, 20, 0, 100, 50, 50, #TV_CMD_USER + 1)`

### TV_GetProgressBarValue

- Сигнатура: `TV_GetProgressBarValue.q(ControlID.i)`
- Назначение: Возвращает текущее числовое значение control.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: 64-битное значение; `0` также может означать отсутствие результата.
- Пример: `Result = TV_GetProgressBarValue(ControlID)`

### TV_GetSwitchState

- Сигнатура: `TV_GetSwitchState.i(ControlID.i)`
- Назначение: Возвращает логическое состояние control.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_GetSwitchState(ControlID)`

### TV_GetTrackBarValue

- Сигнатура: `TV_GetTrackBarValue.q(ControlID.i)`
- Назначение: Возвращает текущее числовое значение control.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: 64-битное значение; `0` также может означать отсутствие результата.
- Пример: `Result = TV_GetTrackBarValue(ControlID)`

### TV_IsIPv4ReadOnly

- Сигнатура: `TV_IsIPv4ReadOnly.i(ControlID.i)`
- Назначение: Возвращает read-only состояние IPv4Input.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_IsIPv4ReadOnly(ControlID)`

### TV_SetHyperlinkText

- Сигнатура: `TV_SetHyperlinkText.i(ControlID.i, Text.s)`
- Назначение: Заменяет отображаемый текст Hyperlink.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_SetHyperlinkText(ControlID, "Text")`

### TV_SetIPv4Address

- Сигнатура: `TV_SetIPv4Address.i(ControlID.i, Address.s)`
- Назначение: Проверяет и устанавливает IPv4-адрес.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_SetIPv4Address(ControlID, "192.168.1.10")`

### TV_SetIPv4ReadOnly

- Сигнатура: `TV_SetIPv4ReadOnly.i(ControlID.i, ReadOnly.i)`
- Назначение: Включает или выключает read-only режим IPv4Input.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_SetIPv4ReadOnly(ControlID, #True)`

### TV_SetProgressBarRange

- Сигнатура: `TV_SetProgressBarRange.i(ControlID.i, Minimum.q, Maximum.q)`
- Назначение: Изменяет допустимый числовой диапазон control.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_SetProgressBarRange(ControlID, 0, 100)`

### TV_SetProgressBarValue

- Сигнатура: `TV_SetProgressBarValue.i(ControlID.i, Value.q)`
- Назначение: Устанавливает числовое значение control с ограничением диапазоном.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_SetProgressBarValue(ControlID, 50)`

### TV_SetSwitchState

- Сигнатура: `TV_SetSwitchState.i(ControlID.i, Checked.i)`
- Назначение: Устанавливает логическое состояние control.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_SetSwitchState(ControlID, #True)`

### TV_SetTrackBarRange

- Сигнатура: `TV_SetTrackBarRange.i(ControlID.i, Minimum.q, Maximum.q)`
- Назначение: Изменяет допустимый числовой диапазон control.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_SetTrackBarRange(ControlID, 0, 100)`

### TV_SetTrackBarValue

- Сигнатура: `TV_SetTrackBarValue.i(ControlID.i, Value.q)`
- Назначение: Устанавливает числовое значение control с ограничением диапазоном.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_SetTrackBarValue(ControlID, 50)`


## Жизненный цикл

### TV_Init

- Сигнатура: `TV_Init.i(*Config.TV_Config)`
- Назначение: Инициализирует выбранный backend и создаёт два виртуальных экранных буфера.
- Условия: Вызывать из единственного UI-потока; проверять ID и возвращаемое значение.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_Init(@Config)`

### TV_InitEx

- Сигнатура: `TV_InitEx.i(*Config.TV_Config, ExpectedAPIVersion.i)`
- Назначение: Проверяет ожидаемую API-версию и выполняет инициализацию.
- Условия: Вызывать из единственного UI-потока; проверять ID и возвращаемое значение.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_InitEx(@Config, #TV_API_VERSION)`

### TV_IsRunning

- Сигнатура: `TV_IsRunning.i()`
- Назначение: Сообщает, должен ли продолжаться главный событийный цикл.
- Условия: Вызывать после успешного `TV_Init()` из единственного UI-потока.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_IsRunning()`

### TV_Shutdown

- Сигнатура: `TV_Shutdown()`
- Назначение: Освобождает UI-объекты и буферы, восстанавливает состояние консоли.
- Условия: Вызывать после успешного `TV_Init()` из единственного UI-потока.
- Результат: Ничего.
- Пример: `TV_Shutdown()`

### TV_Stop

- Сигнатура: `TV_Stop()`
- Назначение: Переводит главный цикл в остановленное состояние без немедленного освобождения ресурсов.
- Условия: Вызывать после успешного `TV_Init()` из единственного UI-потока.
- Результат: Ничего.
- Пример: `TV_Stop()`


## Меню и desktop bars

### TV_AddMenuItem

- Сигнатура: `TV_AddMenuItem.i(MenuID.i, Text.s, Command.i, ShortcutKey.i = 0, Modifiers.i = 0, Enabled.i = #True)`
- Назначение: Добавляет командный пункт в указанное меню.
- Условия: Требуется успешный `TV_Init()`; ID пункта должен существовать, если он передаётся.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_AddMenuItem(MenuID, "Text", #TV_CMD_USER + 1, ShortcutKey, Modifiers, #True)`

### TV_AddMenuSeparator

- Сигнатура: `TV_AddMenuSeparator.i(MenuID.i)`
- Назначение: Добавляет разделитель в указанное меню.
- Условия: Требуется успешный `TV_Init()`; ID пункта должен существовать, если он передаётся.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_AddMenuSeparator(MenuID)`

### TV_AddStatusItem

- Сигнатура: `TV_AddStatusItem.i(Text.s, Command.i, ShortcutKey.i = 0, Modifiers.i = 0, Enabled.i = #True)`
- Назначение: Добавляет интерактивную команду status bar.
- Условия: Требуется успешный `TV_Init()`; ID пункта должен существовать, если он передаётся.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_AddStatusItem("Text", #TV_CMD_USER + 1, ShortcutKey, Modifiers, #True)`

### TV_ClearMenus

- Сигнатура: `TV_ClearMenus()`
- Назначение: Удаляет все интерактивные desktop menus.
- Условия: Требуется успешный `TV_Init()`; ID пункта должен существовать, если он передаётся.
- Результат: Ничего.
- Пример: `TV_ClearMenus()`

### TV_ClearStatusItems

- Сигнатура: `TV_ClearStatusItems()`
- Назначение: Удаляет все интерактивные status-команды.
- Условия: Требуется успешный `TV_Init()`; ID пункта должен существовать, если он передаётся.
- Результат: Ничего.
- Пример: `TV_ClearStatusItems()`

### TV_CreateMenu

- Сигнатура: `TV_CreateMenu.i(Title.s)`
- Назначение: Создаёт верхнее выпадающее меню и возвращает MenuID.
- Условия: Требуется успешный `TV_Init()`; ID пункта должен существовать, если он передаётся.
- Результат: Положительный ID при успехе, `0` при ошибке.
- Пример: `Result = TV_CreateMenu("Text")`

### TV_EnableMenuItem

- Сигнатура: `TV_EnableMenuItem.i(ItemID.i, Enabled.i)`
- Назначение: Включает или отключает пункт меню.
- Условия: Требуется успешный `TV_Init()`; ID пункта должен существовать, если он передаётся.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_EnableMenuItem(ItemID, #True)`

### TV_EnableStatusItem

- Сигнатура: `TV_EnableStatusItem.i(ItemID.i, Enabled.i)`
- Назначение: Включает или отключает status-команду.
- Условия: Требуется успешный `TV_Init()`; ID пункта должен существовать, если он передаётся.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_EnableStatusItem(ItemID, #True)`

### TV_GetFileDialogStatus

- Сигнатура: `TV_GetFileDialogStatus.i(DialogID.i)`
- Назначение: Возвращает текущий статус файлового диалога.
- Условия: Требуется успешный `TV_Init()`; ID пункта должен существовать, если он передаётся.
- Результат: Запрошенное целое значение согласно назначению.
- Пример: `Result = TV_GetFileDialogStatus(DialogID)`

### TV_SetDesktopClock

- Сигнатура: `TV_SetDesktopClock.i(Mode.i, Location.i)`
- Назначение: Настраивает часы или дату-время в menu/status bar.
- Условия: Требуется успешный `TV_Init()`; ID пункта должен существовать, если он передаётся.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_SetDesktopClock(#TV_DESKTOP_CLOCK_TIME, #TV_DESKTOP_CLOCK_STATUS)`

### TV_SetMenuBar

- Сигнатура: `TV_SetMenuBar(Text.s)`
- Назначение: Задаёт статический текст верхней desktop-панели.
- Условия: Требуется успешный `TV_Init()`; ID пункта должен существовать, если он передаётся.
- Результат: Ничего.
- Пример: `TV_SetMenuBar("Text")`

### TV_SetStatusBar

- Сигнатура: `TV_SetStatusBar(Text.s)`
- Назначение: Задаёт статический текст нижней desktop-панели.
- Условия: Требуется успешный `TV_Init()`; ID пункта должен существовать, если он передаётся.
- Результат: Ничего.
- Пример: `TV_SetStatusBar("Text")`

### TV_SetStatusBarRightText

- Сигнатура: `TV_SetStatusBarRightText(Text.s)`
- Назначение: Задаёт постоянный неинтерактивный текст справа status bar.
- Условия: Требуется успешный `TV_Init()`; ID пункта должен существовать, если он передаётся.
- Результат: Ничего.
- Пример: `TV_SetStatusBarRightText("Text")`


## Окна и модальность

### TV_ActivateNextWindow

- Сигнатура: `TV_ActivateNextWindow.i()`
- Назначение: Активирует следующее доступное немодальное окно.
- Условия: Требуется успешный `TV_Init()` и действительный WindowID, если он передаётся.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_ActivateNextWindow()`

### TV_ActivateWindow

- Сигнатура: `TV_ActivateWindow.i(WindowID.i)`
- Назначение: Активирует окно и поднимает его в Z-order.
- Условия: Требуется успешный `TV_Init()` и действительный WindowID, если он передаётся.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_ActivateWindow(WindowID)`

### TV_CascadeWindows

- Сигнатура: `TV_CascadeWindows.i()`
- Назначение: Размещает подходящие окна каскадом; фиксированные типовые окна пропускаются.
- Условия: Требуется успешный `TV_Init()` и действительный WindowID, если он передаётся.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_CascadeWindows()`

### TV_CloseWindow

- Сигнатура: `TV_CloseWindow.i(WindowID.i)`
- Назначение: Закрывает окно и удаляет все принадлежащие ему controls.
- Условия: Требуется успешный `TV_Init()` и действительный WindowID, если он передаётся.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_CloseWindow(WindowID)`

### TV_CreateWindow

- Сигнатура: `TV_CreateWindow.i(X.i, Y.i, Width.i, Height.i, Title.s, Flags.i)`
- Назначение: Создаёт окно и возвращает стабильный непрозрачный WindowID.
- Условия: Требуется успешный `TV_Init()` и действительный WindowID, если он передаётся.
- Результат: Положительный ID при успехе, `0` при ошибке.
- Пример: `Result = TV_CreateWindow(2, 2, 20, 5, "Text", #TV_WINDOW_VISIBLE | #TV_WINDOW_BORDER)`

### TV_EnableWindow

- Сигнатура: `TV_EnableWindow.i(WindowID.i, Enabled.i)`
- Назначение: Включает или отключает получение ввода окном.
- Условия: Требуется успешный `TV_Init()` и действительный WindowID, если он передаётся.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_EnableWindow(WindowID, #True)`

### TV_EndModal

- Сигнатура: `TV_EndModal.i(WindowID.i, Result.i)`
- Назначение: Завершает модальный режим с заданным результатом.
- Условия: Требуется успешный `TV_Init()` и действительный WindowID, если он передаётся.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_EndModal(WindowID, Result)`

### TV_GetActiveWindow

- Сигнатура: `TV_GetActiveWindow.i()`
- Назначение: Возвращает WindowID активного окна.
- Условия: Требуется успешный `TV_Init()` и действительный WindowID, если он передаётся.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_GetActiveWindow()`

### TV_GetModalResult

- Сигнатура: `TV_GetModalResult.i(WindowID.i)`
- Назначение: Возвращает результат завершённого модального окна.
- Условия: Требуется успешный `TV_Init()` и действительный WindowID, если он передаётся.
- Результат: Запрошенное целое значение согласно назначению.
- Пример: `Result = TV_GetModalResult(WindowID)`

### TV_GetWindowGeometry

- Сигнатура: `TV_GetWindowGeometry.i(WindowID.i, *X.Integer, *Y.Integer, *Width.Integer, *Height.Integer)`
- Назначение: Копирует координаты и внешние размеры окна.
- Условия: Требуется успешный `TV_Init()` и действительный WindowID, если он передаётся.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_GetWindowGeometry(WindowID, @X, @Y, @Width, @Height)`

### TV_HideWindow

- Сигнатура: `TV_HideWindow.i(WindowID.i)`
- Назначение: Скрывает существующее окно.
- Условия: Требуется успешный `TV_Init()` и действительный WindowID, если он передаётся.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_HideWindow(WindowID)`

### TV_IsWindowValid

- Сигнатура: `TV_IsWindowValid.i(WindowID.i)`
- Назначение: Проверяет существование WindowID.
- Условия: Требуется успешный `TV_Init()` и действительный WindowID, если он передаётся.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_IsWindowValid(WindowID)`

### TV_IsWindowZoomed

- Сигнатура: `TV_IsWindowZoomed.i(WindowID.i)`
- Назначение: Проверяет zoomed-состояние окна.
- Условия: Требуется успешный `TV_Init()` и действительный WindowID, если он передаётся.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_IsWindowZoomed(WindowID)`

### TV_MoveWindow

- Сигнатура: `TV_MoveWindow.i(WindowID.i, X.i, Y.i)`
- Назначение: Перемещает окно с ограничением координат виртуальным экраном.
- Условия: Требуется успешный `TV_Init()` и действительный WindowID, если он передаётся.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_MoveWindow(WindowID, 2, 2)`

### TV_ResizeWindow

- Сигнатура: `TV_ResizeWindow.i(WindowID.i, Width.i, Height.i)`
- Назначение: Изменяет внешние размеры окна и формирует оконное resize-событие.
- Условия: Требуется успешный `TV_Init()` и действительный WindowID, если он передаётся.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_ResizeWindow(WindowID, 20, 5)`

### TV_RestoreWindow

- Сигнатура: `TV_RestoreWindow.i(WindowID.i)`
- Назначение: Восстанавливает геометрию, сохранённую Zoom.
- Условия: Требуется успешный `TV_Init()` и действительный WindowID, если он передаётся.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_RestoreWindow(WindowID)`

### TV_SetWindowColors

- Сигнатура: `TV_SetWindowColors.i(WindowID.i, Foreground.i, Background.i)`
- Назначение: Изменяет foreground/background окна.
- Условия: Требуется успешный `TV_Init()` и действительный WindowID, если он передаётся.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_SetWindowColors(WindowID, #TV_COLOR_WHITE, #TV_COLOR_BLUE)`

### TV_SetWindowTitle

- Сигнатура: `TV_SetWindowTitle.i(WindowID.i, Title.s)`
- Назначение: Заменяет заголовок окна.
- Условия: Требуется успешный `TV_Init()` и действительный WindowID, если он передаётся.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_SetWindowTitle(WindowID, "Text")`

### TV_ShowModal

- Сигнатура: `TV_ShowModal.i(WindowID.i)`
- Назначение: Делает окно единственным получателем пользовательского ввода.
- Условия: Требуется успешный `TV_Init()` и действительный WindowID, если он передаётся.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_ShowModal(WindowID)`

### TV_ShowWindow

- Сигнатура: `TV_ShowWindow.i(WindowID.i)`
- Назначение: Делает существующее окно видимым.
- Условия: Требуется успешный `TV_Init()` и действительный WindowID, если он передаётся.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_ShowWindow(WindowID)`

### TV_ShowWindowSystemMenu

- Сигнатура: `TV_ShowWindowSystemMenu.i(WindowID.i = 0)`
- Назначение: Открывает системное меню указанного или активного окна.
- Условия: Требуется успешный `TV_Init()` и действительный WindowID, если он передаётся.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_ShowWindowSystemMenu(WindowID)`

### TV_TileWindows

- Сигнатура: `TV_TileWindows.i()`
- Назначение: Размещает подходящие окна плиткой; фиксированные типовые окна пропускаются.
- Условия: Требуется успешный `TV_Init()` и действительный WindowID, если он передаётся.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_TileWindows()`

### TV_ZoomWindow

- Сигнатура: `TV_ZoomWindow.i(WindowID.i)`
- Назначение: Сохраняет геометрию и разворачивает окно на рабочую область desktop.
- Условия: Требуется успешный `TV_Init()` и действительный WindowID, если он передаётся.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_ZoomWindow(WindowID)`


## События и render

### TV_DispatchEvent

- Сигнатура: `TV_DispatchEvent.i(*Event.TV_Event)`
- Назначение: Маршрутизирует событие меню, окнам, controls, диалогам и типовым окнам.
- Условия: Вызывать после успешного `TV_Init()` из единственного UI-потока.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_DispatchEvent(@Event)`

### TV_PollEvent

- Сигнатура: `TV_PollEvent.i(*Event.TV_Event)`
- Назначение: Неблокирующе извлекает одно событие backend или внутренней очереди.
- Условия: Вызывать после успешного `TV_Init()` из единственного UI-потока.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_PollEvent(@Event)`

### TV_Render

- Сигнатура: `TV_Render.i()`
- Назначение: Строит виртуальный экран, выводит изменения и обновляет previous buffer.
- Условия: Вызывать после успешного `TV_Init()` из единственного UI-потока.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_Render()`

### TV_WaitEvent

- Сигнатура: `TV_WaitEvent.i(*Event.TV_Event, Timeout.i)`
- Назначение: Ожидает событие не дольше указанного таймаута.
- Условия: Вызывать после успешного `TV_Init()` из единственного UI-потока.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_WaitEvent(@Event, 100)`


## Тема

### TV_ApplyThemeToConfig

- Сигнатура: `TV_ApplyThemeToConfig.i(*Config.TV_Config)`
- Назначение: Копирует desktop-настройки текущей темы в TV_Config.
- Условия: Можно вызывать до `TV_Init()`; переданные указатели должны быть ненулевыми там, где это требуется.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_ApplyThemeToConfig(@Config)`

### TV_GetTheme

- Сигнатура: `TV_GetTheme.i(*Theme.TV_Theme)`
- Назначение: Копирует текущую TV_Theme вызывающему.
- Условия: Можно вызывать до `TV_Init()`; переданные указатели должны быть ненулевыми там, где это требуется.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_GetTheme(@Theme)`

### TV_SetTheme

- Сигнатура: `TV_SetTheme.i(*Theme.TV_Theme)`
- Назначение: Устанавливает пользовательскую структуру TV_Theme.
- Условия: Можно вызывать до `TV_Init()`; переданные указатели должны быть ненулевыми там, где это требуется.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_SetTheme(@Theme)`

### TV_UseClassicTheme

- Сигнатура: `TV_UseClassicTheme()`
- Назначение: Устанавливает встроенную тему Classic Turbo Vision.
- Условия: Можно вызывать до `TV_Init()`; переданные указатели должны быть ненулевыми там, где это требуется.
- Результат: Ничего.
- Пример: `TV_UseClassicTheme()`


## Файловые диалоги

### TV_CloseFileDialog

- Сигнатура: `TV_CloseFileDialog.i(DialogID.i)`
- Назначение: Закрывает файловый диалог и освобождает его окно.
- Условия: Требуется успешный `TV_Init()`; диалог работает неблокирующе через общий event loop.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_CloseFileDialog(DialogID)`

### TV_CopyFileDialogPath

- Сигнатура: `TV_CopyFileDialogPath.i(DialogID.i, *Buffer, BufferCharacters.i)`
- Назначение: Копирует выбранный файловым диалогом путь в UTF-16 буфер.
- Условия: Требуется успешный `TV_Init()`; диалог работает неблокирующе через общий event loop.
- Результат: Требуемую ёмкость UTF-16 буфера в символах, включая завершающий ноль.
- Пример: `Result = TV_CopyFileDialogPath(DialogID, @Buffer(), ' ')`

### TV_ShowOpenFileDialog

- Сигнатура: `TV_ShowOpenFileDialog.i(Title.s, InitialPath.s = "", Pattern.s = "*.*")`
- Назначение: Создаёт backend-независимый текстовый диалог открытия файла.
- Условия: Требуется успешный `TV_Init()`; диалог работает неблокирующе через общий event loop.
- Результат: Положительный ID при успехе, `0` при ошибке.
- Пример: `Result = TV_ShowOpenFileDialog("Text", InitialPath, Pattern)`

### TV_ShowSaveFileDialog

- Сигнатура: `TV_ShowSaveFileDialog.i(Title.s, InitialPath.s = "", Pattern.s = "*.*")`
- Назначение: Создаёт backend-независимый текстовый диалог сохранения файла.
- Условия: Требуется успешный `TV_Init()`; диалог работает неблокирующе через общий event loop.
- Результат: Положительный ID при успехе, `0` при ошибке.
- Пример: `Result = TV_ShowSaveFileDialog("Text", InitialPath, Pattern)`


## Экран и рисование

### TV_Clear

- Сигнатура: `TV_Clear.i(Character.i, Foreground.i, Background.i)`
- Назначение: Заполняет текущий виртуальный экран одним символом и цветами.
- Условия: Вызывать после успешного `TV_Init()` из единственного UI-потока.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_Clear(' ', #TV_COLOR_WHITE, #TV_COLOR_BLUE)`

### TV_DrawFrame

- Сигнатура: `TV_DrawFrame.i(X.i, Y.i, Width.i, Height.i, Style.i, Foreground.i, Background.i)`
- Назначение: Рисует ASCII, одинарную или двойную рамку.
- Условия: Вызывать после успешного `TV_Init()` из единственного UI-потока.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_DrawFrame(2, 2, 20, 5, Style, #TV_COLOR_WHITE, #TV_COLOR_BLUE)`

### TV_DrawShadow

- Сигнатура: `TV_DrawShadow.i(X.i, Y.i, Width.i, Height.i)`
- Назначение: Рисует текущую тематическую тень прямоугольника.
- Условия: Вызывать после успешного `TV_Init()` из единственного UI-потока.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_DrawShadow(2, 2, 20, 5)`

### TV_DrawText

- Сигнатура: `TV_DrawText.i(X.i, Y.i, Text.s, Foreground.i, Background.i)`
- Назначение: Рисует строку basic-width Unicode в виртуальном экране с clipping.
- Условия: Вызывать после успешного `TV_Init()` из единственного UI-потока.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_DrawText(2, 2, "Text", #TV_COLOR_WHITE, #TV_COLOR_BLUE)`

### TV_FillRect

- Сигнатура: `TV_FillRect.i(X.i, Y.i, Width.i, Height.i, Character.i, Foreground.i, Background.i)`
- Назначение: Заполняет ограниченный прямоугольник виртуального экрана.
- Условия: Вызывать после успешного `TV_Init()` из единственного UI-потока.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_FillRect(2, 2, 20, 5, ' ', #TV_COLOR_WHITE, #TV_COLOR_BLUE)`

### TV_GetCell

- Сигнатура: `TV_GetCell.i(X.i, Y.i, *Cell.TV_Cell)`
- Назначение: Копирует одну ячейку текущего виртуального экрана.
- Условия: Вызывать после успешного `TV_Init()` из единственного UI-потока.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_GetCell(2, 2, @Cell)`

### TV_GetScreenSize

- Сигнатура: `TV_GetScreenSize.i(*Width.Integer, *Height.Integer)`
- Назначение: Возвращает размер текущего виртуального экрана.
- Условия: Вызывать после успешного `TV_Init()` из единственного UI-потока.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_GetScreenSize(@Width, @Height)`

### TV_SetCell

- Сигнатура: `TV_SetCell.i(X.i, Y.i, Character.i, Foreground.i, Background.i)`
- Назначение: Записывает одну ячейку текущего виртуального экрана.
- Условия: Вызывать после успешного `TV_Init()` из единственного UI-потока.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_SetCell(2, 2, ' ', #TV_COLOR_WHITE, #TV_COLOR_BLUE)`

### TV_SetTitle

- Сигнатура: `TV_SetTitle.i(Title.s)`
- Назначение: Изменяет заголовок активного backend.
- Условия: Вызывать после успешного `TV_Init()` из единственного UI-потока.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_SetTitle("Text")`


## Backend

### TV_BackendGetScreenSize

- Сигнатура: `TV_BackendGetScreenSize.i(*Width.Integer, *Height.Integer)`
- Назначение: Возвращает фактический размер backend в символьных ячейках.
- Условия: Backend должен быть выбран; операции состояния после запуска требуют успешного `TV_Init()`.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_BackendGetScreenSize(@Width, @Height)`

### TV_BackendIsConnected

- Сигнатура: `TV_BackendIsConnected.i()`
- Назначение: Проверяет готовность активного backend.
- Условия: Backend должен быть выбран; операции состояния после запуска требуют успешного `TV_Init()`.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_BackendIsConnected()`

### TV_BackendRequestFullRedraw

- Сигнатура: `TV_BackendRequestFullRedraw()`
- Назначение: Помечает следующий кадр для полного вывода без partial update.
- Условия: Backend должен быть выбран; операции состояния после запуска требуют успешного `TV_Init()`.
- Результат: Ничего.
- Пример: `TV_BackendRequestFullRedraw()`

### TV_CopyBackendName

- Сигнатура: `TV_CopyBackendName.i(*Buffer, BufferCharacters.i)`
- Назначение: Копирует имя выбранного backend в UTF-16 буфер.
- Условия: Backend должен быть выбран; операции состояния после запуска требуют успешного `TV_Init()`.
- Результат: Требуемую ёмкость UTF-16 буфера в символах, включая завершающий ноль.
- Пример: `Result = TV_CopyBackendName(@Buffer(), ' ')`

### TV_GetBackendType

- Сигнатура: `TV_GetBackendType.i()`
- Назначение: Возвращает числовой тип выбранного backend.
- Условия: Backend должен быть выбран; операции состояния после запуска требуют успешного `TV_Init()`.
- Результат: Запрошенное целое значение согласно назначению.
- Пример: `Result = TV_GetBackendType()`

### TV_SelectBackend

- Сигнатура: `TV_SelectBackend.i(BackendType.i)`
- Назначение: Выбирает зарегистрированный backend до инициализации.
- Условия: Можно вызывать до `TV_Init()`; переданные указатели должны быть ненулевыми там, где это требуется.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_SelectBackend(#TV_BACKEND_WINDOWS_CONSOLE)`

### TV_WindowsConsoleGetMode

- Сигнатура: `TV_WindowsConsoleGetMode.i()`
- Назначение: Возвращает фактически используемый режим Windows Console.
- Условия: Backend должен быть выбран; операции состояния после запуска требуют успешного `TV_Init()`.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_WindowsConsoleGetMode()`

### TV_WindowsConsoleUsesNewWindow

- Сигнатура: `TV_WindowsConsoleUsesNewWindow.i()`
- Назначение: Сообщает, выделил ли backend отдельную консоль.
- Условия: Backend должен быть выбран; операции состояния после запуска требуют успешного `TV_Init()`.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_WindowsConsoleUsesNewWindow()`


## ComboBox

### TV_ComboBoxAddItem

- Сигнатура: `TV_ComboBoxAddItem.i(ControlID.i, Text.s)`
- Назначение: Добавляет строку в список.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_ComboBoxAddItem(ControlID, "Text")`

### TV_ComboBoxClear

- Сигнатура: `TV_ComboBoxClear.i(ControlID.i)`
- Назначение: Удаляет все строки списка.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_ComboBoxClear(ControlID)`

### TV_ComboBoxDeleteItem

- Сигнатура: `TV_ComboBoxDeleteItem.i(ControlID.i, Index.i)`
- Назначение: Удаляет строку списка по zero-based индексу.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_ComboBoxDeleteItem(ControlID, 0)`

### TV_ComboBoxGetCurrent

- Сигнатура: `TV_ComboBoxGetCurrent.i(ControlID.i)`
- Назначение: Возвращает текущий zero-based индекс списка.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_ComboBoxGetCurrent(ControlID)`

### TV_ComboBoxGetItemCount

- Сигнатура: `TV_ComboBoxGetItemCount.i(ControlID.i)`
- Назначение: Возвращает количество строк списка.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_ComboBoxGetItemCount(ControlID)`

### TV_ComboBoxIsOpen

- Сигнатура: `TV_ComboBoxIsOpen.i(ControlID.i)`
- Назначение: Сообщает, открыт ли popup указанного ComboBox.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_ComboBoxIsOpen(ControlID)`

### TV_ComboBoxSetCurrent

- Сигнатура: `TV_ComboBoxSetCurrent.i(ControlID.i, Index.i)`
- Назначение: Устанавливает текущий zero-based индекс списка.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_ComboBoxSetCurrent(ControlID, 0)`

### TV_CopyComboBoxGetItemText

- Сигнатура: `TV_CopyComboBoxGetItemText.i(ControlID.i, Index.i, *Buffer, BufferCharacters.i)`
- Назначение: Копирует текст строки списка в UTF-16 буфер.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Требуемую ёмкость UTF-16 буфера в символах, включая завершающий ноль.
- Пример: `Result = TV_CopyComboBoxGetItemText(ControlID, 0, @Buffer(), ' ')`

### TV_CreateComboBox

- Сигнатура: `TV_CreateComboBox.i(WindowID.i, X.i, Y.i, Width.i, DropDownHeight.i, Command.i = #TV_CMD_NONE)`
- Назначение: Создаёт выпадающий список внутри окна и возвращает ControlID.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Положительный ID при успехе, `0` при ошибке.
- Пример: `Result = TV_CreateComboBox(WindowID, 2, 2, 20, DropDownHeight, #TV_CMD_USER + 1)`


## Desktop text

### TV_ClearDesktopTexts

- Сигнатура: `TV_ClearDesktopTexts()`
- Назначение: Удаляет все desktop-подписи.
- Условия: Требуется успешный `TV_Init()`; ID пункта должен существовать, если он передаётся.
- Результат: Ничего.
- Пример: `TV_ClearDesktopTexts()`

### TV_CreateDesktopText

- Сигнатура: `TV_CreateDesktopText.i(X.i, Y.i, Text.s, Foreground.i, Background.i)`
- Назначение: Создаёт постоянную подпись на фоне desktop.
- Условия: Требуется успешный `TV_Init()`; ID пункта должен существовать, если он передаётся.
- Результат: Положительный ID при успехе, `0` при ошибке.
- Пример: `Result = TV_CreateDesktopText(2, 2, "Text", #TV_COLOR_WHITE, #TV_COLOR_BLUE)`

### TV_MoveDesktopText

- Сигнатура: `TV_MoveDesktopText.i(DesktopTextID.i, X.i, Y.i)`
- Назначение: Перемещает desktop-подпись.
- Условия: Требуется успешный `TV_Init()`; ID пункта должен существовать, если он передаётся.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_MoveDesktopText(DesktopTextID, 2, 2)`

### TV_RemoveDesktopText

- Сигнатура: `TV_RemoveDesktopText.i(DesktopTextID.i)`
- Назначение: Удаляет одну desktop-подпись.
- Условия: Требуется успешный `TV_Init()`; ID пункта должен существовать, если он передаётся.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_RemoveDesktopText(DesktopTextID)`

### TV_SetDesktopText

- Сигнатура: `TV_SetDesktopText.i(DesktopTextID.i, Text.s)`
- Назначение: Заменяет текст desktop-подписи.
- Условия: Требуется успешный `TV_Init()`; ID пункта должен существовать, если он передаётся.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_SetDesktopText(DesktopTextID, "Text")`

### TV_ShowDesktopText

- Сигнатура: `TV_ShowDesktopText.i(DesktopTextID.i, Visible.i)`
- Назначение: Меняет видимость desktop-подписи.
- Условия: Требуется успешный `TV_Init()`; ID пункта должен существовать, если он передаётся.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_ShowDesktopText(DesktopTextID, #True)`


## ListBox

### TV_CopyListBoxGetItemText

- Сигнатура: `TV_CopyListBoxGetItemText.i(ControlID.i, Index.i, *Buffer, BufferCharacters.i)`
- Назначение: Копирует текст строки списка в UTF-16 буфер.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Требуемую ёмкость UTF-16 буфера в символах, включая завершающий ноль.
- Пример: `Result = TV_CopyListBoxGetItemText(ControlID, 0, @Buffer(), ' ')`

### TV_CreateListBox

- Сигнатура: `TV_CreateListBox.i(WindowID.i, X.i, Y.i, Width.i, Height.i)`
- Назначение: Создаёт список внутри окна и возвращает ControlID.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Положительный ID при успехе, `0` при ошибке.
- Пример: `Result = TV_CreateListBox(WindowID, 2, 2, 20, 5)`

### TV_ListBoxAddItem

- Сигнатура: `TV_ListBoxAddItem.i(ControlID.i, Text.s)`
- Назначение: Добавляет строку в список.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_ListBoxAddItem(ControlID, "Text")`

### TV_ListBoxClear

- Сигнатура: `TV_ListBoxClear.i(ControlID.i)`
- Назначение: Удаляет все строки списка.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_ListBoxClear(ControlID)`

### TV_ListBoxDeleteItem

- Сигнатура: `TV_ListBoxDeleteItem.i(ControlID.i, Index.i)`
- Назначение: Удаляет строку списка по zero-based индексу.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_ListBoxDeleteItem(ControlID, 0)`

### TV_ListBoxGetCurrent

- Сигнатура: `TV_ListBoxGetCurrent.i(ControlID.i)`
- Назначение: Возвращает текущий zero-based индекс списка.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_ListBoxGetCurrent(ControlID)`

### TV_ListBoxGetItemCount

- Сигнатура: `TV_ListBoxGetItemCount.i(ControlID.i)`
- Назначение: Возвращает количество строк списка.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_ListBoxGetItemCount(ControlID)`

### TV_ListBoxSetCurrent

- Сигнатура: `TV_ListBoxSetCurrent.i(ControlID.i, Index.i)`
- Назначение: Устанавливает текущий zero-based индекс списка.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_ListBoxSetCurrent(ControlID, 0)`


## TextArea и NumberInput

### TV_CopyTextAreaText

- Сигнатура: `TV_CopyTextAreaText.i(ControlID.i, *Buffer, BufferCharacters.i)`
- Назначение: Копирует текст control в UTF-16 буфер.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Требуемую ёмкость UTF-16 буфера в символах, включая завершающий ноль.
- Пример: `Result = TV_CopyTextAreaText(ControlID, @Buffer(), ' ')`

### TV_CreateNumberInput

- Сигнатура: `TV_CreateNumberInput.i(WindowID.i, X.i, Y.i, Width.i, Minimum.q, Maximum.q, Value.q, StepValue.q = 1)`
- Назначение: Создаёт числовое поле внутри окна и возвращает ControlID.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Положительный ID при успехе, `0` при ошибке.
- Пример: `Result = TV_CreateNumberInput(WindowID, 2, 2, 20, 0, 100, 50, 50)`

### TV_CreateTextArea

- Сигнатура: `TV_CreateTextArea.i(WindowID.i, X.i, Y.i, Width.i, Height.i, MaxLength.i = 0)`
- Назначение: Создаёт многострочный редактор внутри окна и возвращает ControlID.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Положительный ID при успехе, `0` при ошибке.
- Пример: `Result = TV_CreateTextArea(WindowID, 2, 2, 20, 5, MaxLength)`

### TV_GetNumberInputValue

- Сигнатура: `TV_GetNumberInputValue.q(ControlID.i)`
- Назначение: Возвращает текущее числовое значение control.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: 64-битное значение; `0` также может означать отсутствие результата.
- Пример: `Result = TV_GetNumberInputValue(ControlID)`

### TV_SetNumberInputRange

- Сигнатура: `TV_SetNumberInputRange.i(ControlID.i, Minimum.q, Maximum.q)`
- Назначение: Изменяет допустимый числовой диапазон control.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_SetNumberInputRange(ControlID, 0, 100)`

### TV_SetNumberInputReadOnly

- Сигнатура: `TV_SetNumberInputReadOnly.i(ControlID.i, ReadOnly.i)`
- Назначение: Включает или выключает read-only режим NumberInput.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_SetNumberInputReadOnly(ControlID, #True)`

### TV_SetNumberInputValue

- Сигнатура: `TV_SetNumberInputValue.i(ControlID.i, Value.q)`
- Назначение: Устанавливает числовое значение control с ограничением диапазоном.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_SetNumberInputValue(ControlID, 50)`

### TV_SetTextAreaReadOnly

- Сигнатура: `TV_SetTextAreaReadOnly.i(ControlID.i, ReadOnly.i)`
- Назначение: Включает или выключает read-only режим редактируемого control.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_SetTextAreaReadOnly(ControlID, #True)`

### TV_SetTextAreaText

- Сигнатура: `TV_SetTextAreaText.i(ControlID.i, Text.s)`
- Назначение: Заменяет текст редактируемого control.
- Условия: Требуется успешный `TV_Init()`; WindowID/ControlID должен существовать и соответствовать типу операции.
- Результат: Ненулевое значение при успехе либо `#False`/`0` при отказе, если не указано иное.
- Пример: `Result = TV_SetTextAreaText(ControlID, "Text")`
