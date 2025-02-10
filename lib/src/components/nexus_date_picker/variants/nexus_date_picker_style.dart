import 'package:nexus_ui/src/components/nexus_date_picker/enums/nexus_calendar_type.dart';

enum NexusDatePickerStyle {
  /// Shows the calendar with month and year.
  monthYear(NexusCalendarType.monthYear),

  /// Shows the calendar in a single month.
  month(NexusCalendarType.month);

  final NexusCalendarType calendarType;

  const NexusDatePickerStyle(this.calendarType);
}
