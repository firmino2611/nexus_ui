import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/enums/day_type.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/enums/nexus_calendar_type.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/theme/nexus_day_ui_config.dart';
import 'package:nexus_ui/themes/nexus_colors.dart';
import 'package:nexus_ui/themes/nexus_sizes.dart';
import 'package:nexus_ui/themes/nexus_spacing.dart';

/// Define the theme of the date picker.
/// This class is used to define the appearance of the date picker.
/// It is used to define the appearance of the calendar, the selector,
/// the day of week, and the day.s
class NexusDatePickerTheme {
  /// Define the type of calendar.
  final NexusCalendarType? calendarType;

  /// Define the appearance of a selected day.
  final NexusDayUIConfig? daySelected;

  /// Define the appearance of an unselected day.
  final NexusDayUIConfig? dayUnselected;

  /// Define the appearance of a selected start day of a range.
  final NexusDayUIConfig? rangeStartSelected;

  /// Define the appearance of an unselected start day of a range.
  final NexusDayUIConfig? rangeStartUnselected;

  /// Define the appearance of a selected end day of a range.
  final NexusDayUIConfig? rangeEndSelected;

  /// Define the appearance of an unselected end day of a range.
  final NexusDayUIConfig? rangeEndUnselected;

  /// Define the appearance of a middle day of a range.
  final NexusDayUIConfig? rangeMiddle;

  /// Define the appearance of a disabled day.
  final NexusDayUIConfig? dayDisabled;

  final NexusSelectorUIConfig? selectorUi;

  /// Define the padding top of the calendar.
  final double? paddingTop;

  /// Define the height of the day container.
  final double? heightDayContainer;

  /// Define the padding horizontal of the calendar.
  /// This is the padding of the calendar body.
  final double? paddingHorizontalBody;

  /// Define the padding vertical of the calendar.
  /// This is the padding  weeks.
  final double? paddingVerticallWeeks;

  /// Define the background color of the day of week.
  final Color? backgroundDaysOfWeek;

  /// Define the color of the icons of selector.
  final Color? iconsColor;

  /// Define the background color of the calendar body.
  final Color? backgroundCalendarBody;

  /// Define the text style of the day of week.
  final TextStyle? dayTextStyle;

  /// Define the text style of the selector.
  final TextStyle? selectorTextStyle;

  /// Define the text style of the day of week.
  final TextStyle? dayWeekTextStyle;

  NexusDatePickerTheme({
    this.calendarType,
    this.daySelected,
    this.dayUnselected,
    this.rangeStartSelected,
    this.rangeStartUnselected,
    this.rangeEndSelected,
    this.rangeEndUnselected,
    this.rangeMiddle,
    this.dayDisabled,
    this.paddingTop,
    this.heightDayContainer,
    this.backgroundDaysOfWeek,
    this.paddingHorizontalBody,
    this.paddingVerticallWeeks,
    this.dayTextStyle,
    this.selectorTextStyle,
    this.dayWeekTextStyle,
    this.iconsColor,
    this.backgroundCalendarBody,
    this.selectorUi,
  }) {
    final dayTypesValid = {
      DayType.daySelected: daySelected,
      DayType.dayUnselected: dayUnselected,
      DayType.rangeStartSelected: rangeStartSelected,
      DayType.rangeStartUnselected: rangeStartUnselected,
      DayType.rangeEndSelected: rangeEndSelected,
      DayType.rangeEndUnselected: rangeEndUnselected,
      DayType.rangeMiddle: rangeMiddle,
      DayType.dayDisabled: dayDisabled,
    };

    for (var element in dayTypesValid.entries) {
      if (element.value != null) {
        if (element.value!.dayType != element.key) {
          throw Exception(
            '${element.value!.dayType} is not type ${element.key}',
          );
        }
      }
    }
  }

  NexusDatePickerTheme copyWith({
    NexusCalendarType? calendarType,
    NexusDayUIConfig? dayUnselected,
    NexusDayUIConfig? daySelected,
    NexusDayUIConfig? rangeStartSelected,
    NexusDayUIConfig? rangeStartUnselected,
    NexusDayUIConfig? rangeEndSelected,
    NexusDayUIConfig? rangeEndUnselected,
    NexusDayUIConfig? rangeMiddle,
    NexusDayUIConfig? dayDisabled,
    double? paddingTopSelector,
    double? heightDayContainer,
    Color? backgroundDayContainer,
    Color? iconsColor,
    Color? backgroundCalendarBody,
    double? paddingHorizontalGeneral,
    double? paddingVerticallGeneral,
    TextStyle? textStyle,
    TextStyle? selectorTextStyle,
    TextStyle? dayWeekTextStyle,
    NexusSelectorUIConfig? selectorUi,
  }) {
    return NexusDatePickerTheme(
      calendarType: calendarType ?? this.calendarType,
      dayUnselected: dayUnselected ?? this.dayUnselected,
      daySelected: daySelected ?? this.daySelected,
      rangeStartSelected: rangeStartSelected ?? this.rangeStartSelected,
      rangeStartUnselected: rangeStartUnselected ?? this.rangeStartUnselected,
      rangeEndSelected: rangeEndSelected ?? this.rangeEndSelected,
      rangeEndUnselected: rangeEndUnselected ?? this.rangeEndUnselected,
      rangeMiddle: rangeMiddle ?? this.rangeMiddle,
      dayDisabled: dayDisabled ?? this.dayDisabled,
      paddingTop: paddingTopSelector ?? paddingTop,
      heightDayContainer: heightDayContainer ?? this.heightDayContainer,
      backgroundDaysOfWeek: backgroundDayContainer ?? backgroundDaysOfWeek,
      paddingHorizontalBody: paddingHorizontalGeneral ?? paddingHorizontalBody,
      paddingVerticallWeeks: paddingVerticallGeneral ?? paddingVerticallWeeks,
      dayTextStyle: textStyle ?? dayTextStyle,
      selectorTextStyle: selectorTextStyle ?? this.selectorTextStyle,
      dayWeekTextStyle: dayWeekTextStyle ?? this.dayWeekTextStyle,
      iconsColor: iconsColor ?? this.iconsColor,
      backgroundCalendarBody:
          backgroundCalendarBody ?? this.backgroundCalendarBody,
      selectorUi: selectorUi ?? this.selectorUi,
    );
  }

  NexusDatePickerTheme merge(NexusDatePickerTheme theme) {
    return copyWith(
      calendarType: theme.calendarType,
      dayUnselected: theme.dayUnselected,
      daySelected: theme.daySelected,
      rangeStartSelected: theme.rangeStartSelected,
      rangeStartUnselected: theme.rangeStartUnselected,
      rangeEndSelected: theme.rangeEndSelected,
      rangeEndUnselected: theme.rangeEndUnselected,
      rangeMiddle: theme.rangeMiddle,
      dayDisabled: theme.dayDisabled,
      paddingTopSelector: theme.paddingTop,
      heightDayContainer: theme.heightDayContainer,
      backgroundDayContainer: theme.backgroundDaysOfWeek,
      paddingHorizontalGeneral: theme.paddingHorizontalBody,
      paddingVerticallGeneral: theme.paddingVerticallWeeks,
      textStyle: theme.dayTextStyle,
      selectorTextStyle: theme.selectorTextStyle,
      dayWeekTextStyle: theme.dayWeekTextStyle,
      iconsColor: theme.iconsColor,
      backgroundCalendarBody: theme.backgroundCalendarBody,
      selectorUi: theme.selectorUi,
    );
  }

  factory NexusDatePickerTheme.defaultTheme() => NexusDatePickerTheme(
        calendarType: NexusCalendarType.monthYear,
        paddingTop: NexusSpacing.s8,
        heightDayContainer: NexusSizes.s40,
        paddingHorizontalBody: NexusSpacing.s8,
        paddingVerticallWeeks: NexusSpacing.s4,
        iconsColor: NexusColors.primary600,
        backgroundCalendarBody: NexusColors.neutral50,
        selectorUi: NexusSelectorUIConfig(
          background: NexusColors.neutral50,
          iconColor: NexusColors.primary600,
          paddingHorizontal: NexusSizes.s20,
        ),
        dayWeekTextStyle: GoogleFonts.montserrat(
          fontSize: 14,
          color: NexusColors.neutral1000,
          fontWeight: FontWeight.w400,
        ),
        dayTextStyle: GoogleFonts.montserrat(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: NexusColors.neutral1000,
        ),
        selectorTextStyle: GoogleFonts.montserrat(
          fontSize: 16,
          color: NexusColors.neutral1000,
          fontWeight: FontWeight.w600,
        ),
        dayUnselected: NexusDayUIConfig.unSelected(
          dayColor: NexusColors.neutral1000,
          dayBackgroundColor: NexusColors.neutral50,
        ),
        daySelected: NexusDayUIConfig.selected(
          dayColor: NexusColors.neutral50,
          dayBackgroundColor: NexusColors.primary500,
        ),
        dayDisabled: NexusDayUIConfig.disabled(
          dayBackgroundColor: NexusColors.neutral50,
          dayStyle: GoogleFonts.montserrat(
            color: NexusColors.neutral700,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        rangeStartSelected: NexusDayUIConfig.rangeStartSelected(
          dayBackgroundColor: NexusColors.primary600,
          dayColor: NexusColors.primary50,
          backgroundEnd: NexusColors.primary50,
        ),
        rangeEndSelected: NexusDayUIConfig.rangeEndSelected(
          dayBackgroundColor: NexusColors.primary600,
          dayColor: NexusColors.primary50,
          backgroundStart: NexusColors.primary50,
        ),
        rangeMiddle: NexusDayUIConfig.rangeMiddle(
          background: NexusColors.primary50,
          dayColor: NexusColors.primary700,
        ),
        rangeStartUnselected: NexusDayUIConfig.rangeStartUnselected(
          dayColor: NexusColors.primary700,
          background: NexusColors.primary50,
        ),
        rangeEndUnselected: NexusDayUIConfig.rangeEndUnselected(
          dayColor: NexusColors.primary700,
          background: NexusColors.primary50,
        ),
      );
}

class NexusSelectorUIConfig {
  /// Define the background color of the selector.
  final Color? background;

  /// Define the color of the icon of selector.
  final Color? iconColor;

  /// Define the padding horizontal of the selector.
  final double? paddingHorizontal;

  const NexusSelectorUIConfig({
    this.background,
    this.iconColor,
    this.paddingHorizontal,
  });
}
