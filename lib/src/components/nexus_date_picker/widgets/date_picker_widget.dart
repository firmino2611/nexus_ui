import 'package:flutter/material.dart';
import 'package:nexus_ui/constants/numbers_constants_global.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/constants/date_picker_numbers.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/enums/nexus_calendar_select_type.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/enums/week_position.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/models/nexus_date_time_range.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/rules/calendar_controller.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/theme/nexus_date_picker_theme.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/variants/nexus_date_picker_style.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/widgets/calendar_provider.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/widgets/selectors/date_selector.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/widgets/week/week_header.dart';
import 'package:nexus_ui/themes/nexus_colors.dart';
import 'package:nexus_ui/themes/nexus_spacing.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({
    super.key,
    required this.controller,
    this.onChange,
    this.style,
    this.initialDate,
    this.finalDate,
    this.currentDate,
    this.currentRange,
    this.selectType,
    this.theme,
  });

  /// Controla as regras de negócio do componente, também
  /// permite o controle programático do componente.
  final CalendarController controller;

  /// É acionado sempre que um valor de data é selecionado no
  /// calendário.
  final Function(NexusDateTimeRange)? onChange;

  /// Data inicial do calendário. A data mais antiga que o
  /// calendário deve permitir a seleção.
  final DateTime? initialDate;

  /// Data atual selecionada. Se nada for enviado a
  /// data será configurada com [DateTime.now()].
  final DateTime? currentDate;

  /// Data limite para seleção. A data mais futura que pode ser
  /// selecionada.
  final DateTime? finalDate;

  /// Configura um range inicial para o datepicker.
  final DateTimeRange? currentRange;

  /// O tipo de seleção do date picker. Permite alternar entre uma seleção
  /// única ou um intervalo de datas.
  final NexusCalendarSelectType? selectType;

  /// Define o tipo do seletor de data.
  final NexusDatePickerStyle? style;

  /// Define o tema do date picker.
  /// Se não for passado, o tema padrão será usado.
  final NexusDatePickerTheme? theme;

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  @override
  void initState() {
    super.initState();
  }

  NexusDatePickerTheme _getTheme() {
    final defaultTheme = NexusDatePickerTheme.defaultTheme();
    return widget.theme != null
        ? defaultTheme.merge(widget.theme!)
        : defaultTheme.copyWith(
            calendarType: widget.style?.calendarType,
          );
  }

  @override
  Widget build(BuildContext context) {
    final theme = _getTheme();

    widget.controller.generateMonth(
      widget.currentDate ?? DateTime.now(),
      widget.selectType!,
    );

    if (widget.currentRange != null) {
      widget.controller.setCurrentRange(widget.currentRange!);
    }

    return CalendarProvider(
      calendar: widget.controller,
      selectType: widget.selectType!,
      theme: theme,
      child: Container(
        color: NexusColors.neutral50,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ValueListenableBuilder<NexusDateTimeRange>(
              valueListenable: widget.controller.currentDateListener,
              builder: (context, date, child) {
                // if (widget.onChange != null) {
                //   widget.onChange!(date);
                // }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DateSelector(calendarType: theme.calendarType),
                    const WeekHeader(),
                    ...widget.controller.month.map((week) {
                      var weekNumber = widget.controller.month.indexOf(week);

                      var monthNumber = widget.controller.month.length -
                          NumbersConstantsGlobal.one;

                      var isFirstWeek =
                          weekNumber == NumbersConstantsGlobal.zero;

                      return Container(
                        color: theme.backgroundCalendarBody,
                        padding: EdgeInsets.symmetric(
                          horizontal: theme.paddingHorizontalBody!,
                          vertical: theme.paddingVerticallWeeks!,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: _buildWeek(
                            theme,
                            week: week,
                            isFirstWeek: isFirstWeek,
                            isLastWeek: weekNumber == monthNumber,
                          ),
                        ),
                      );
                    }),
                    const SizedBox(
                      height: NexusSpacing.s4,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildWeek(
    NexusDatePickerTheme theme, {
    required List<DateTime> week,
    required bool isFirstWeek,
    required bool isLastWeek,
  }) {
    var count = NumbersConstantsGlobal.zero;
    var rowWeek = <Widget>[];
    var daysOfWeek = DatePickerNumbers.daysWeek;

    var weekPositionInMonth = isFirstWeek
        ? WeekPosition.first
        : (isLastWeek ? WeekPosition.last : WeekPosition.middle);

    if (weekPositionInMonth == WeekPosition.first) {
      while (count < daysOfWeek) {
        var indexDay = count - widget.controller.firstWeekDayMonthCurrent;
        var isDayOfMonth = count >= widget.controller.firstWeekDayMonthCurrent;

        rowWeek.add(
          widget.controller.proccessDayUI(
            theme,
            date: isDayOfMonth ? week[indexDay] : null,
            initialDate: widget.initialDate,
            finalDate: widget.finalDate,
          ),
        );
        count++;
      }
    } else if (weekPositionInMonth == WeekPosition.middle) {
      while (count < daysOfWeek) {
        rowWeek.add(
          widget.controller.proccessDayUI(
            theme,
            date: week[count],
            initialDate: widget.initialDate,
            finalDate: widget.finalDate,
          ),
        );

        count++;
      }
    } else if (weekPositionInMonth == WeekPosition.last) {
      while (count < daysOfWeek) {
        rowWeek.add(
          widget.controller.proccessDayUI(
            theme,
            date: count <= week.length - NumbersConstantsGlobal.one
                ? week[count]
                : null,
            initialDate: widget.initialDate,
            finalDate: widget.finalDate,
          ),
        );

        count++;
      }
    }

    return rowWeek;
  }
}
