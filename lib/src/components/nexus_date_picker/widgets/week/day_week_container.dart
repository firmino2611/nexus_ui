import 'package:flutter/material.dart';
import 'package:nexus_ui/constants/numbers_constants_global.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/widgets/calendar_provider.dart';

class DayWeek extends StatelessWidget {
  const DayWeek({
    super.key,
    this.day,
  });

  final String? day;

  @override
  Widget build(BuildContext context) {
    var theme = CalendarProvider.of(context)!.theme;

    return Flexible(
      flex: NumbersConstantsGlobal.one,
      child: Container(
        height: theme.heightDayContainer,
        alignment: Alignment.center,
        color: theme.backgroundDaysOfWeek,
        child: Text(
          day!,
          style: theme.dayWeekTextStyle,
        ),
      ),
    );
  }
}
