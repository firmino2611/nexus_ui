import 'package:flutter/material.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/enums/day_type.dart';

class NexusDayUIConfig {
  // Day Container
  final Color? dayColor;
  final Color? dayBackgroundColor;
  final DayType dayType;
  final BoxShape? shape;
  final TextStyle? dayStyle;

  // Background
  final Color? backgroundStart;
  final Color? backgroundEnd;
  final bool leftBorderCircle;
  final bool rightBorderCircle;

  const NexusDayUIConfig._({
    this.dayColor,
    this.dayBackgroundColor,
    required this.dayType,
    this.shape,
    this.dayStyle,
    this.backgroundStart,
    this.backgroundEnd,
    this.leftBorderCircle = false,
    this.rightBorderCircle = false,
  });

  /// Creates the configuration that defines
  /// the appearance of a disabled day.
  factory NexusDayUIConfig.disabled({
    required Color dayBackgroundColor,
    TextStyle? dayStyle,
  }) {
    return NexusDayUIConfig._(
      dayType: DayType.dayDisabled,
      dayBackgroundColor: dayBackgroundColor,
      dayStyle: dayStyle,
      shape: null,
      leftBorderCircle: false,
      rightBorderCircle: false,
      backgroundStart: null,
      backgroundEnd: null,
    );
  }

  /// Creates the configuration that defines
  /// the appearance of an unselected day.
  factory NexusDayUIConfig.unSelected({
    required Color dayColor,
    required Color dayBackgroundColor,
  }) {
    return NexusDayUIConfig._(
      dayType: DayType.dayUnselected,
      dayColor: dayColor,
      dayBackgroundColor: dayBackgroundColor,
    );
  }

  /// Creates the configuration that defines
  /// the appearance of a selected day.
  factory NexusDayUIConfig.selected({
    required Color dayColor,
    required Color dayBackgroundColor,
  }) {
    return NexusDayUIConfig._(
      dayType: DayType.daySelected,
      dayColor: dayColor,
      dayBackgroundColor: dayBackgroundColor,
      shape: BoxShape.circle,
    );
  }

  /// Creates the configuration that defines
  /// the appearance of a selected start day of a range.
  factory NexusDayUIConfig.rangeStartSelected({
    required Color dayColor,
    required Color dayBackgroundColor,
    required Color backgroundEnd,
  }) {
    return NexusDayUIConfig._(
      dayType: DayType.rangeStartSelected,
      shape: BoxShape.circle,
      dayBackgroundColor: dayBackgroundColor,
      dayColor: dayColor,
      backgroundEnd: backgroundEnd,
    );
  }

  /// Creates the configuration that defines
  /// the appearance of a selected end day of a range.
  factory NexusDayUIConfig.rangeEndSelected({
    required Color dayColor,
    required Color dayBackgroundColor,
    required Color backgroundStart,
  }) {
    return NexusDayUIConfig._(
      dayType: DayType.rangeEndSelected,
      dayColor: dayColor,
      backgroundStart: backgroundStart,
      dayBackgroundColor: dayBackgroundColor,
      shape: BoxShape.circle,
    );
  }

  /// Creates the configuration that defines
  /// the appearance of a middle day of a range.
  factory NexusDayUIConfig.rangeMiddle({
    required Color dayColor,
    required Color background,
  }) {
    return NexusDayUIConfig._(
      dayType: DayType.rangeMiddle,
      shape: BoxShape.circle,
      dayColor: dayColor,
      backgroundStart: background,
      backgroundEnd: background,
    );
  }

  /// Creates the configuration that defines
  /// the appearance of an unselected start day of a range.
  /// The background of the day will be the backgroundStart color.
  /// The day color will be the dayColor color.
  factory NexusDayUIConfig.rangeStartUnselected({
    required Color dayColor,
    required Color background,
  }) {
    return NexusDayUIConfig._(
      dayType: DayType.rangeStartUnselected,
      dayColor: dayColor,
      backgroundStart: background,
      backgroundEnd: background,
      leftBorderCircle: true,
    );
  }

  /// Creates the configuration that defines
  /// the appearance of an unselected end day of a range.
  /// The background of the day will be the backgroundEnd color.
  /// The day color will be the dayColor color.
  factory NexusDayUIConfig.rangeEndUnselected({
    required Color dayColor,
    required Color background,
  }) {
    return NexusDayUIConfig._(
      dayType: DayType.rangeEndUnselected,
      dayColor: dayColor,
      backgroundStart: background,
      backgroundEnd: background,
      rightBorderCircle: true,
    );
  }
}
