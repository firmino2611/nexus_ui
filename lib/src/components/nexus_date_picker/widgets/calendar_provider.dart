import 'package:flutter/material.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/enums/nexus_calendar_select_type.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/rules/calendar_controller.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/theme/nexus_date_picker_theme.dart';

class CalendarProvider extends InheritedWidget {
  const CalendarProvider({
    super.key,
    required super.child,
    required this.calendar,
    required this.theme,
    this.selectType = NexusCalendarSelectType.singleSelect,
  });

  final CalendarController calendar;
  final NexusCalendarSelectType selectType;
  final NexusDatePickerTheme theme;

  @override
  bool updateShouldNotify(covariant CalendarProvider oldWidget) {
    return oldWidget.calendar.currentDate != calendar.currentDate;
  }

  static CalendarProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CalendarProvider>();
  }
}
