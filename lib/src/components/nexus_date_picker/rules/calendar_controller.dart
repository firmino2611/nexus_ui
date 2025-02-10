import 'package:flutter/material.dart';
import 'package:nexus_ui/constants/numbers_constants_global.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/constants/date_picker_numbers.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/enums/nexus_calendar_select_type.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/models/nexus_date_time_range.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/theme/nexus_date_picker_theme.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/utils/date_utils.dart'
    as z;
import 'package:nexus_ui/src/components/nexus_date_picker/widgets/days/day.dart';

class CalendarController {
  CalendarController({
    this.disableWeekends = false,
    this.disableDates,
  }) {
    _resetDates();
  }

  final List<DateTime>? disableDates;
  final bool? disableWeekends;

  bool opening = false;

  final ValueNotifier<NexusDateTimeRange> _currentDate = ValueNotifier(
    NexusDateTimeRange(current: DateTime.now()),
  );

  final List<List<DateTime>> _month = [];

  DateTime get _getDateRight {
    return currentDate.end ?? currentDate.start ?? currentDate.current;
  }

  NexusDateTimeRange get currentDate => _currentDate.value;
  ValueNotifier<NexusDateTimeRange> get currentDateListener => _currentDate;

  List<DateTime> get firstWeek {
    return month.first;
  }

  int get firstWeekDayMonthCurrent {
    return z.DateHelper.weekday(firstWeek.first);
  }

  List<List<DateTime>> get month => _month;

  int daysInMonth(int year, int month) {
    var firstDayThisMonth = DateTime(year, month);
    var firstDayNextMonth = DateTime(
      firstDayThisMonth.year,
      firstDayThisMonth.month + NumbersConstantsGlobal.one,
      firstDayThisMonth.day,
    );

    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }

  void generateMonth(DateTime date, NexusCalendarSelectType selectType) {
    _currentDate.value = currentDate.copyWith(
      current: date,
      start: selectType == NexusCalendarSelectType.rangeSelect
          ? (currentDate.end == null ? date : null)
          : null,
    );

    month.clear();

    var firstDay = DateTime(date.year, date.month, NumbersConstantsGlobal.one);
    var lastDay = daysInMonth(date.year, date.month);
    var firstDayMonthCurrent = z.DateHelper.weekday(firstDay);

    var week = _generateWeek(firstDay, firstDayMonthCurrent);

    month.add([...week]);

    var lastDayWeek = week.last;
    do {
      var dayOfWeek = NumbersConstantsGlobal.zero;
      week.clear();

      while (dayOfWeek <= DatePickerNumbers.daysWeekBase) {
        var dayAdd = lastDayWeek.add(
          Duration(days: dayOfWeek + NumbersConstantsGlobal.one),
        );
        if (dayAdd.day == lastDay) {
          week.add(dayAdd);
          break;
        }
        week.add(dayAdd);
        dayOfWeek++;
      }
      month.add([...week]);
      lastDayWeek = week.last;
    } while (lastDayWeek.day != lastDay);
  }

  Widget proccessDayUI(
    NexusDatePickerTheme theme, {
    DateTime? date,
    DateTime? initialDate,
    DateTime? finalDate,
  }) {
    if (date != null) {
      date = _resetHoursInDate(date);

      var validateDayDisable = _validateDaysDisable(
        date: date!,
        initialDate: _resetHoursInDate(initialDate),
        finalDate: _resetHoursInDate(finalDate),
      );
      if (validateDayDisable) {
        return Day.dayDisabled(theme, date: date);
      }

      var validateHDayStart = _validateHourSummer(
        date: date,
        daySelected: currentDate.start ?? currentDate.current,
      );
      var validateHDayEnd = _validateHourSummer(
        date: date,
        daySelected: _getDateRight,
      );

      if (validateHDayStart || validateHDayEnd) {
        if (_validateStartRange(date)) {
          return Day.rangeStartSelected(theme, date: date);
        }
        if (_validateEndRange(date)) {
          return Day.rangeEndSelected(theme, date: date);
        }

        return Day.daySelected(theme, date: date);
      }

      if (currentDate.start != null && currentDate.end != null) {
        if (_validateInterval(date)) {
          if (_isFirstDayOfWeek(date)) {
            return Day.rangeStartUnselected(theme, date: date);
          }
          if (_isEndOtherMonth(date) && _isLastDayWeek(date)) {
            return Day.rangeEndUnselected(theme, date: date);
          }

          return Day.rangeMiddle(theme, date: date);
        }
      }
    }

    return Day.dayUnselected(theme, date: date);
  }

  void setCurrentRange(DateTimeRange range) {
    _currentDate.value = currentDate.copyWith(
      start: range.start,
      end: range.end,
    );
  }

  void updateDate(DateTime? date) {
    if (date != null) {
      _currentDate.value = currentDate.copyWith(current: date);
    }
  }

  void updateDateRange(DateTime? date) {
    if (date != null) {
      if (currentDate.start == currentDate.end) {
        _finalizeRangeSelect(date);
      } else {
        var dateSetup = DateTime(
          currentDate.current.year,
          currentDate.current.month,
          date.day,
        );
        _currentDate.value = currentDate.copyWith(
          current: dateSetup,
          start: dateSetup,
          end: dateSetup,
        );
      }
    }
  }

  bool _existsDatesDisabled(DateTime date, DateTime dateOfLoop) {
    var dayHasDisabled = disableDates?.contains(dateOfLoop) ?? false;
    var isWeekend = z.DateHelper.isWeekend(dateOfLoop);

    if (dayHasDisabled || (disableWeekends! && isWeekend)) {
      _currentDate.value = NexusDateTimeRange(
        current: currentDate.current,
        start: currentDate.start,
        end: null,
      );

      return true;
    }

    return false;
  }

  void _finalizeRangeSelect(DateTime date) {
    var endDate = date;
    var dateOfLoop = currentDate.start;
    const duration = Duration(days: 1);
    var loopCondition = dateOfLoop!.isBefore(endDate)
        ? (DateTime d) => d.isBefore(endDate)
        : (DateTime d) => d.isAfter(endDate);

    while (loopCondition(dateOfLoop!)) {
      if (_existsDatesDisabled(date, dateOfLoop)) return;
      dateOfLoop = dateOfLoop.isBefore(endDate)
          ? dateOfLoop.add(duration)
          : dateOfLoop.subtract(duration);
    }

    _currentDate.value = currentDate.copyWith(
      end: DateTime(date.year, date.month, date.day),
    );

    if (currentDate.start?.isAfter(currentDate.end!) ?? false) {
      _currentDate.value = currentDate.copyWith(
        start: currentDate.end,
        end: currentDate.start,
      );
    }
  }

  List<DateTime> _generateWeek(DateTime dayCurrent, int firstDayMonthCurrent) {
    List<DateTime> week = [];
    var dayOfWeek = NumbersConstantsGlobal.zero;

    while (dayOfWeek <= DatePickerNumbers.daysWeekBase) {
      if (dayOfWeek > firstDayMonthCurrent) {
        week.add(
          dayCurrent.add(
            Duration(
              days: dayOfWeek - firstDayMonthCurrent,
            ),
          ),
        );
      } else if (dayOfWeek == firstDayMonthCurrent) {
        week.add(dayCurrent);
      }

      dayOfWeek++;
    }

    return week;
  }

  bool _isEndOtherMonth(DateTime date) {
    return daysInMonth(date.year, date.month) != date.day;
  }

  bool _isFirstDayOfWeek(DateTime date) {
    var validStart = date.day != NumbersConstantsGlobal.one;

    return z.DateHelper.weekday(date) == NumbersConstantsGlobal.zero &&
        validStart;
  }

  bool _isLastDayWeek(DateTime date) {
    return z.DateHelper.weekday(date) == DatePickerNumbers.daysWeekBase;
  }

  _resetDates() {
    if (disableDates != null) {
      for (var i = 0; i < disableDates!.length; i++) {
        var date = disableDates![i];
        date = DateTime(date.year, date.month, date.day);
      }
    }
  }

  DateTime? _resetHoursInDate(DateTime? date) {
    if (date != null) {
      return DateTime(
        date.year,
        date.month,
        date.day,
      );
    }

    return null;
  }

  bool _validateDaysDisable({
    required DateTime date,
    DateTime? initialDate,
    DateTime? finalDate,
  }) {
    var initialDateValidate = date.difference(initialDate ?? date).inDays <
        NumbersConstantsGlobal.zero;
    var finalDateValidate =
        date.difference(finalDate ?? date).inDays > NumbersConstantsGlobal.zero;

    var validateIsWeekend = disableWeekends! && z.DateHelper.isWeekend(date);
    var hasDatesDisabled = disableDates?.contains(date) ?? false;

    return initialDateValidate ||
        finalDateValidate ||
        validateIsWeekend ||
        hasDatesDisabled;
  }

  bool _validateEndRange(DateTime date) {
    return currentDate.end == date && currentDate.start != currentDate.end;
  }

  bool _validateHourSummer({
    required DateTime date,
    required DateTime daySelected,
  }) {
    var today = DateTime(
      daySelected.year,
      daySelected.month,
      daySelected.day,
    );
    var diffInHours = date.difference(today).inHours;
    var diffInDays = date.difference(today).inDays;

    var validateHourSummer = (diffInHours >= NumbersConstantsGlobal.zero &&
        diffInHours <= NumbersConstantsGlobal.one);

    return diffInDays == NumbersConstantsGlobal.zero && validateHourSummer;
  }

  bool _validateInterval(DateTime date) {
    return date.isAfter(currentDate.start!) && date.isBefore(currentDate.end!);
  }

  bool _validateStartRange(DateTime date) {
    return currentDate.start == date &&
        currentDate.start != currentDate.end &&
        currentDate.end != null;
  }
}
