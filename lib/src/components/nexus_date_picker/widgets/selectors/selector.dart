import 'package:flutter/material.dart';
import 'package:nexus_ui/constants/numbers_constants_global.dart';
import 'package:nexus_ui/constants/strings_constants_global.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/constants/date_picker_numbers.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/enums/selector_type.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/utils/date_utils.dart'
    as z;
import 'package:nexus_ui/src/components/nexus_date_picker/widgets/calendar_provider.dart';
import 'package:nexus_ui/themes/nexus_sizes.dart';

class Selector extends StatelessWidget {
  Selector({
    super.key,
    required this.date,
    this.whenClickNext,
    this.whenClickPrevious,
    this.type = SelectorType.year,
  });

  final SelectorType type;
  final DateTime date;

  final Function(DateTime)? whenClickNext;
  final Function(DateTime)? whenClickPrevious;

  final ValueNotifier<DateTime> _date = ValueNotifier(DateTime.now());

  @override
  Widget build(BuildContext context) {
    var calendar = CalendarProvider.of(context)!.calendar;
    var theme = CalendarProvider.of(context)!.theme;
    _date.value = date;

    return Flexible(
      flex: NumbersConstantsGlobal.one,
      child: SizedBox(
        height: NexusSizes.s40,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: theme.selectorUi?.paddingHorizontal ?? NexusSizes.s20,
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  _applyPrevious();

                  if (whenClickPrevious != null) {
                    whenClickPrevious!(_date.value);
                  }
                  calendar.generateMonth(
                    _date.value,
                    CalendarProvider.of(context)!.selectType,
                  );
                },
                child: Icon(
                  Icons.arrow_left,
                  size: 40,
                  color: theme.iconsColor,
                ),
              ),
              ValueListenableBuilder(
                valueListenable: _date,
                builder: (context, value, child) {
                  return Expanded(
                    child: Text(
                      _textDate(context),
                      style: theme.selectorTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
              GestureDetector(
                onTap: () {
                  _applyNext();

                  if (whenClickNext != null) {
                    whenClickNext!(_date.value);
                  }
                  calendar.generateMonth(
                    _date.value,
                    CalendarProvider.of(context)!.selectType,
                  );
                },
                child: Icon(
                  Icons.arrow_right,
                  size: 40,
                  color: theme.iconsColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _applyPrevious() {
    switch (type) {
      case SelectorType.year:
        _previousYear();
        break;
      case SelectorType.month:
        _previousMonth();
        break;
      case SelectorType.monthYear:
        _previousMonthYear();
        break;
    }
  }

  void _applyNext() {
    switch (type) {
      case SelectorType.year:
        _nextYear();
        break;
      case SelectorType.month:
        _nextMonth();
        break;
      case SelectorType.monthYear:
        _nextMonthYear();
        break;
    }
  }

  String _textDate(BuildContext context) {
    switch (type) {
      case SelectorType.year:
        return _date.value.year.toString();
      case SelectorType.month:
        return z.DateHelper.monthsAbbr(_date.value.month, context)!;
      case SelectorType.monthYear:
        var nameMonth = z.DateHelper.monthsName(_date.value.month, context);
        return nameMonth +
            StringsConstantsGlobal.space +
            _date.value.year.toString();
    }
  }

  void _previousYear() {
    _date.value = DateTime(
      _date.value.year - NumbersConstantsGlobal.one,
      _date.value.month,
      _date.value.day,
      NumbersConstantsGlobal.zero,
    );
  }

  void _nextYear() {
    _date.value = DateTime(
      _date.value.year + NumbersConstantsGlobal.one,
      _date.value.month,
      _date.value.day,
      NumbersConstantsGlobal.zero,
    );
  }

  void _nextMonth() {
    if (_date.value.month < DatePickerNumbers.monthsYear) {
      _date.value = DateTime(
        _date.value.year,
        _date.value.month + NumbersConstantsGlobal.one,
        _date.value.day,
        NumbersConstantsGlobal.zero,
      );
    } else {
      _date.value = DateTime(
        _date.value.year,
        NumbersConstantsGlobal.one,
        _date.value.day,
        NumbersConstantsGlobal.zero,
      );
    }
  }

  void _nextMonthYear() {
    _date.value = DateTime(
      _date.value.year,
      _date.value.month + NumbersConstantsGlobal.one,
      _date.value.day,
      NumbersConstantsGlobal.zero,
    );
  }

  void _previousMonthYear() {
    _date.value = DateTime(
      _date.value.year,
      _date.value.month - NumbersConstantsGlobal.one,
      _date.value.day,
      NumbersConstantsGlobal.zero,
    );
  }

  void _previousMonth() {
    if (_date.value.month > NumbersConstantsGlobal.one) {
      _date.value = DateTime(
        _date.value.year,
        _date.value.month - NumbersConstantsGlobal.one,
        _date.value.day,
        NumbersConstantsGlobal.zero,
      );
    } else {
      _date.value = DateTime(
        _date.value.year,
        DatePickerNumbers.monthsYear,
        _date.value.day,
        NumbersConstantsGlobal.zero,
      );
    }
  }
}
