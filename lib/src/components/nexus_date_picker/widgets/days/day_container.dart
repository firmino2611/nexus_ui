import 'package:flutter/material.dart';
import 'package:nexus_ui/nexus_ui.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/enums/day_type.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/widgets/calendar_provider.dart';

/// Classe responsável por apresentar o valor do dia em forma textual.
/// Também permite variar os estilos de acordo com as regras de estilização.
/// Este Widget sobrepoem do background.

class DayContainer extends StatelessWidget {
  const DayContainer({
    super.key,
    required this.dayType,
    this.date,
    this.backgroundColor = Colors.transparent,
    this.dayColor,
    this.shape,
    this.dayStyle,
  });

  final DateTime? date;

  final Color? dayColor;
  final Color backgroundColor;

  final TextStyle? dayStyle;

  final BoxShape? shape;

  final DayType dayType;

  @override
  Widget build(BuildContext context) {
    var provider = CalendarProvider.of(context)!;
    var theme = provider.theme;

    return InkWell(
      onTap: () {
        if (dayType != DayType.dayDisabled) {
          if (provider.selectType == NexusCalendarSelectType.singleSelect) {
            provider.calendar.updateDate(date);
          }
          if (provider.selectType == NexusCalendarSelectType.rangeSelect) {
            provider.calendar.updateDateRange(date);
          }
        }
      },
      child: Container(
        height: theme.heightDayContainer,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: shape ?? BoxShape.rectangle,
        ),
        child: date != null
            ? Text(
                date!.day.toString(),
                style: _getTextStyle(theme),
              )
            : null,
      ),
    );
  }

  TextStyle? _getTextStyle(NexusDatePickerTheme theme) {
    if (dayType == DayType.dayDisabled) {
      return theme.dayDisabled!.dayStyle;
    }

    return theme.dayTextStyle!.copyWith(
      color: dayColor ?? theme.dayTextStyle!.color,
    );
  }
}
