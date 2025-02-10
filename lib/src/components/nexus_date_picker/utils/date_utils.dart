import 'package:flutter/widgets.dart';
import 'package:nexus_ui/constants/numbers_constants_global.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/constants/date_picker_numbers.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/constants/date_picker_strings.dart';

class DateHelper {
  static monthsName(int month, BuildContext context) {
    final strings = DatePickerStrings(context);
    var months = [
      strings.january,
      strings.february,
      strings.march,
      strings.april,
      strings.may,
      strings.june,
      strings.july,
      strings.august,
      strings.september,
      strings.october,
      strings.november,
      strings.december,
    ];

    return months[month - NumbersConstantsGlobal.one];
  }

  static String? monthsAbbr(int month, BuildContext context) {
    return DatePickerStrings(context).monthsAbbr[monthsName(month, context)];
  }

  static int weekday(DateTime date) {
    return date.weekday == DatePickerNumbers.daysWeek
        ? NumbersConstantsGlobal.zero
        : date.weekday;
  }

  static bool isWeekend(DateTime date) {
    var weekendDays = [
      NumbersConstantsGlobal.zero,
      DatePickerNumbers.daysWeekBase,
    ];

    return weekendDays.contains(DateHelper.weekday(date));
  }
}
