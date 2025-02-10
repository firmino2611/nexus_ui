import 'package:flutter/material.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/constants/date_picker_strings.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/widgets/week/day_week_container.dart';

class WeekHeader extends StatelessWidget {
  const WeekHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: DatePickerStrings(context)
          .weekDays
          .map(
            (day) => DayWeek(day: day),
          )
          .toList(),
    );
  }
}
