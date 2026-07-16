<!-- TurboVisionPB 0.16.8 | (C) CheshirCa 2026 -->

# Calendar, Calculator и desktop indicators

[English version](en/TemplateWindows.md)

`TV_ShowCalendar(Year, Month)` создаёт готовое немодальное окно календаря.
Нулевые Year/Month выбирают текущий месяц. Используйте
`TV_SetCalendarMonth()` и `TV_GetCalendarDate()` для программного управления.
Окно можно перемещать, но его размер фиксирован: mouse resize,
`TV_ResizeWindow()`, Zoom/Alt+F5 и Cascade/Tile его не изменяют. Пункт
Zoom/Restore отсутствует в системном меню.
Выбор дня учитывает общий Z-order: перекрывающее окно не пропускает клик к
сетке Calendar под ним.

`TV_ShowCalculator()` создаёт готовый калькулятор с четырьмя операциями,
процентом, сменой знака, очисткой и Backspace. Он принимает мышь и клавиатуру;
дисплей читается через buffer-copy API
`TV_CopyCalculatorDisplay(WindowID, *Buffer, BufferCharacters)`.
Calculator можно перемещать и закрывать, но нельзя изменять его размер. Он не
участвует в Cascade/Tile и не содержит Zoom/Restore в системном меню.
При слишком низком экране заголовок остаётся под menu bar, а нижняя часть окна
временно клипуется без изменения фиксированной геометрии.

Оба окна возвращают обычный WindowID и полностью обслуживаются
`TV_DispatchEvent()`.
Close из системного меню и Alt+F3 закрывают типовое окно без прикладного
обработчика `TV_CMD_CLOSE`.

Часы включаются через `TV_SetDesktopClock()` с режимами
`#TV_DESKTOP_CLOCK_OFF`, `#TV_DESKTOP_CLOCK_TIME` и
`#TV_DESKTOP_CLOCK_DATE_TIME`. Расположение задаётся
`#TV_DESKTOP_CLOCK_MENU` или `#TV_DESKTOP_CLOCK_STATUS`.
`TV_SetStatusBarRightText()` добавляет статический текст справа на нижней
панели. Полный сценарий находится в `SDK/Examples/Example07_TurboVisionDemo.pb`.
