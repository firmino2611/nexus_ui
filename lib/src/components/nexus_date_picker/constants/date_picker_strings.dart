import 'package:flutter/widgets.dart';
import 'package:nexus_ui/nexus_localization.dart';

class DatePickerStrings {
  NexusLocalizations? _localizations;

  DatePickerStrings(BuildContext context) {
    _localizations = NexusLocalizations.of(context);
  }

  String get january => _localizations!.january;
  String get february => _localizations!.february;
  String get march => _localizations!.march;
  String get april => _localizations!.april;
  String get may => _localizations!.may;
  String get june => _localizations!.june;
  String get july => _localizations!.july;
  String get august => _localizations!.august;
  String get september => _localizations!.september;
  String get october => _localizations!.october;
  String get november => _localizations!.november;
  String get december => _localizations!.december;

  Map<String, String> get monthsAbbr => {
        january: _localizations!.januaryShort,
        february: _localizations!.februaryShort,
        march: _localizations!.marchShort,
        april: _localizations!.aprilShort,
        may: _localizations!.mayShort,
        june: _localizations!.juneShort,
        july: _localizations!.julyShort,
        august: _localizations!.augustShort,
        september: _localizations!.septemberShort,
        october: _localizations!.octoberShort,
        november: _localizations!.novemberShort,
        december: _localizations!.decemberShort,
      };

  List<String> get weekDays => [
        _localizations!.sundayInitial,
        _localizations!.mondayInitial,
        _localizations!.tuesdayInitial,
        _localizations!.wednesdayInitial,
        _localizations!.thursdayInitial,
        _localizations!.fridayInitial,
        _localizations!.saturdayInitial,
      ];
}
