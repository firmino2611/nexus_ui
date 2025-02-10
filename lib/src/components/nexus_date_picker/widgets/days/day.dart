import 'package:flutter/material.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/enums/day_type.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/theme/nexus_date_picker_theme.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/widgets/days/background_widget.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/widgets/days/day_container.dart';
import 'package:nexus_ui/src/components/nexus_date_picker/widgets/days/day_container_widget.dart';

class Day extends StatelessWidget {
  const Day.dayUnselected(
    this.theme, {
    super.key,
    this.date,
  }) : _type = DayType.dayUnselected;

  const Day.daySelected(
    this.theme, {
    super.key,
    this.date,
  }) : _type = DayType.daySelected;

  const Day.dayDisabled(
    this.theme, {
    super.key,
    this.date,
  }) : _type = DayType.dayDisabled;

  const Day.rangeStartSelected(
    this.theme, {
    super.key,
    this.date,
  }) : _type = DayType.rangeStartSelected;

  const Day.rangeEndSelected(
    this.theme, {
    super.key,
    this.date,
  }) : _type = DayType.rangeEndSelected;

  const Day.rangeMiddle(
    this.theme, {
    super.key,
    this.date,
  }) : _type = DayType.rangeMiddle;

  const Day.rangeStartUnselected(
    this.theme, {
    super.key,
    this.date,
  }) : _type = DayType.rangeStartUnselected;

  const Day.rangeEndUnselected(
    this.theme, {
    super.key,
    this.date,
  }) : _type = DayType.rangeEndUnselected;

  final NexusDatePickerTheme theme;
  final DateTime? date;
  final DayType _type;

  @override
  Widget build(BuildContext context) {
    switch (_type) {
      case DayType.daySelected:
        return DayContainerWidget(
          dayContainer: DayContainer(
            date: date,
            dayType: theme.daySelected!.dayType,
            dayColor: theme.daySelected!.dayColor,
            backgroundColor: theme.daySelected!.dayBackgroundColor!,
            shape: theme.daySelected!.shape,
          ),
        );
      case DayType.dayUnselected:
        return DayContainerWidget(
          dayContainer: DayContainer(
            date: date,
            dayType: theme.dayUnselected!.dayType,
            dayColor: theme.dayUnselected!.dayColor,
            backgroundColor: theme.dayUnselected!.dayBackgroundColor!,
          ),
        );
      case DayType.rangeStartSelected:
        return DayContainerWidget(
          backgroundWidget: BackgroundWidget(
            colorStart: Colors.transparent,
            colorEnd: theme.rangeStartSelected!.backgroundEnd!,
          ),
          dayContainer: DayContainer(
            date: date,
            dayType: theme.rangeStartSelected!.dayType,
            dayColor: theme.rangeStartSelected!.dayColor,
            shape: theme.rangeStartSelected!.shape,
            backgroundColor: theme.rangeStartSelected!.dayBackgroundColor!,
          ),
        );
      case DayType.rangeStartUnselected:
        return DayContainerWidget(
          backgroundWidget: BackgroundWidget(
            colorStart: theme.rangeStartUnselected!.backgroundStart!,
            colorEnd: theme.rangeStartUnselected!.backgroundEnd!,
            leftBorderCircle: theme.rangeStartUnselected!.leftBorderCircle,
          ),
          dayContainer: DayContainer(
            date: date,
            dayType: theme.rangeStartUnselected!.dayType,
            dayColor: theme.rangeStartUnselected!.dayColor,
          ),
        );
      case DayType.rangeEndSelected:
        return DayContainerWidget(
          backgroundWidget: BackgroundWidget(
            colorEnd: Colors.transparent,
            colorStart: theme.rangeEndSelected!.backgroundStart!,
          ),
          dayContainer: DayContainer(
            date: date,
            dayType: theme.rangeEndSelected!.dayType,
            backgroundColor: theme.rangeEndSelected!.dayBackgroundColor!,
            dayColor: theme.rangeEndSelected!.dayColor,
            shape: theme.rangeEndSelected!.shape,
          ),
        );
      case DayType.rangeEndUnselected:
        return DayContainerWidget(
          backgroundWidget: BackgroundWidget(
            colorStart: theme.rangeEndUnselected!.backgroundStart!,
            colorEnd: theme.rangeEndUnselected!.backgroundEnd!,
            rightBorderCircle: theme.rangeEndUnselected!.rightBorderCircle,
          ),
          dayContainer: DayContainer(
            date: date,
            dayType: theme.rangeEndUnselected!.dayType,
            dayColor: theme.rangeEndUnselected!.dayColor,
          ),
        );
      case DayType.rangeMiddle:
        return DayContainerWidget(
          backgroundWidget: BackgroundWidget(
            colorStart: theme.rangeMiddle!.backgroundStart!,
            colorEnd: theme.rangeMiddle!.backgroundEnd!,
          ),
          dayContainer: DayContainer(
            date: date,
            dayType: theme.rangeMiddle!.dayType,
            dayColor: theme.rangeMiddle!.dayColor,
            shape: theme.rangeMiddle!.shape,
          ),
        );
      case DayType.dayDisabled:
        return DayContainerWidget(
          dayContainer: DayContainer(
            date: date,
            dayType: theme.dayDisabled!.dayType,
            backgroundColor: theme.dayDisabled!.dayBackgroundColor!,
            dayStyle: theme.dayDisabled!.dayStyle!,
          ),
        );
    }
  }
}
