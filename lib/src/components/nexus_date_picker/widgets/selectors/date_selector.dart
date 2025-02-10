import 'package:flutter/material.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/enums/nexus_calendar_type.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/widgets/calendar_provider.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/widgets/selectors/variants/month_select.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/widgets/selectors/variants/month_year_select.dart';

class DateSelector extends StatelessWidget {
  const DateSelector({
    super.key,
    this.calendarType = NexusCalendarType.month,
  });

  final NexusCalendarType? calendarType;

  @override
  Widget build(BuildContext context) {
    var calendar = CalendarProvider.of(context)!.calendar;
    var theme = CalendarProvider.of(context)!.theme;

    return Container(
      color: theme.selectorUi!.background,
      padding: EdgeInsets.only(top: theme.paddingTop!),
      child: calendarType == NexusCalendarType.month
          ? MonthSelect(date: calendar.currentDate.current)
          : MonthYearSelect(date: calendar.currentDate.current),
    );
  }
}
