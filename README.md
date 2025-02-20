
# ... Project in development ...
We will gradually update the documentation

## Components

| Component | Description | Status |
| --- | --- | --- |
| Date Picker | A date picker component that allows you to select a date range or a single date. | Finished |
| Select Dropdown | A dropdown component that allows you to select a value from a list of options. | In development |


## About
The idea of ​​this project is to provide several interface components that speed up the development of your applications.

## Features

 - **Date Picker**: A date picker component that allows you to select a date range or a single date.

## Getting started

To use this package, add `nexus_ui` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/packages-and-plugins/using-packages).

### Date Picker

```dart
import 'package:nexus_ui/nexus_ui.dart';

NexusDatePicker(), 
```

Result 

![calendar.png](https://entre-amigos.nyc3.cdn.digitaloceanspaces.com/nexus-ui/calendar.png)

#### Date Picker with range select
```dart
import 'package:nexus_ui/nexus_ui.dart';

NexusDatePicker(
  selectType: NexusCalendarSelectType.rangeSelect,
),
```

Result

![calendar_range.png](https://entre-amigos.nyc3.cdn.digitaloceanspaces.com/nexus-ui/calendar-range.png)

#### Features

Customization of the date picker component.

| Property | Description | Default |
| --- | --- | --- |
| style | Select type of date picker | NexusDatePickerStyle.month |
| selectType | Select type | NexusCalendarSelectType.singleSelect |
| initialDate | Initial date | null |
| finalDate | Final date | null |
| currentDate | Current date | DateTime.now() |
| currentRange | Current range | null |
| disableWeekend | Disable weekend | false |
| disableDates | Disable dates | null |
| customTheme | Custom theme | null |
| onChange | Callback when the date is changed | null |

**OnChange**: The callback is called when the date is changed. The callback returns an object of type **NexusDateTimeRange**

| Property | Description | Default |
| --- | --- | --- |
| start | Start date. Used when the select type is range select | null |
| end | End date. Used when the select type is range select | null |
| current | Current date. Used when the select type is single select | DateTime.now() |

#### Customization

To customize the component's theme, use the **NexusDatePickerTheme** class, where you can customize how each type of day is rendered.

View the example below to see how to customize the date picker component.

```dart
NexusDatePicker(
  style: NexusDatePickerStyle.month,
  currentDate: widget.currentDate,
  initialDate: DateTime.now(),
  customTheme: NexusDatePickerTheme(
    calendarType: NexusCalendarType.month,
    dayTextStyle: TextStyle(
      color: AtlasColors.neutral900,
    ),
    selectorTextStyle: TextStyle(
      color: AtlasColors.neutral900,
    ),
    dayWeekTextStyle: TextStyle(
      color: AtlasColors.neutral900,
    ),
    iconsColor: AtlasColors.secondary500,
    daySelected: NexusDayUIConfig.selected(
      dayBackgroundColor: AtlasColors.secondary500,
      dayColor: AtlasColors.neutral50,
    ),
    dayDisabled: NexusDayUIConfig.disabled(
      dayBackgroundColor: Colors.transparent,
      dayStyle: AtlasTextThemeStyle.bold14.textStyle.copyWith(
        color: AtlasColors.neutral600,
      ),
    ),
  ),
  onChange: (range) {
    selected = range.current;
  },
),
```

Each property of the NexusDayUIConfig type receives a constructor specific to that object.
With it you will be able to make changes at every moment that the days are drawn.

Including making changes to the style and colors of the selection range.

```dart
// ... hide code
rangeEndSelected: NexusDayUIConfig.rangeEndSelected(
  dayColor: Colors.black ,
  dayBackgroundColor: Colors.black,
  backgroundStart: Colors.transparent,
),
```

 
## Additional information

