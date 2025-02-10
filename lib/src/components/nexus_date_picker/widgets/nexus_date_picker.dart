import 'package:flutter/material.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/enums/nexus_calendar_select_type.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/models/nexus_date_time_range.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/rules/calendar_controller.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/theme/nexus_date_picker_theme.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/variants/nexus_date_picker_style.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/widgets/date_picker_widget.dart';

class NexusDatePicker extends StatelessWidget {
  const NexusDatePicker({
    super.key,
    this.style,
    this.onChange,
    this.initialDate,
    this.finalDate,
    this.currentDate,
    this.currentRange,
    this.disableDates,
    this.selectType = NexusCalendarSelectType.singleSelect,
    this.disableWeekend = false,
    this.customTheme,
  });

  /// Define the style of the date picker.
  /// If not passed, the default style will be used
  final NexusDatePickerStyle? style;

  /// Define the callback function that will be called when the date is changed.
  final Function(NexusDateTimeRange range)? onChange;

  /// Define the initial date of the date picker.
  /// Can be used to block the date picker from selecting dates before this date.
  final DateTime? initialDate;

  /// Define the final date of the date picker.
  /// Can be used to block the date picker from selecting dates after this date.
  final DateTime? finalDate;

  /// Define the current date of the date picker.
  /// Can be used to set the initial date of the date picker.
  final DateTime? currentDate;

  /// Define the current range of the date picker.
  final DateTimeRange? currentRange;

  /// Define if the weekends should be disabled.
  final bool? disableWeekend;

  /// Define the custom theme of the date picker.
  final NexusDatePickerTheme? customTheme;

  /// Define the dates that should be disabled.
  final List<DateTime>? disableDates;

  /// Define the type of selection of the date picker.
  /// If not passed, the default type will be used.
  final NexusCalendarSelectType? selectType;

  @override
  Widget build(BuildContext context) {
    return DatePickerWidget(
      controller: CalendarController(
        disableWeekends: disableWeekend,
        disableDates: disableDates,
      ),
      theme: customTheme,
      onChange: onChange,
      style: style,
      initialDate: initialDate,
      finalDate: finalDate,
      currentDate: currentDate,
      currentRange: currentRange,
      selectType: selectType,
    );
  }
}
