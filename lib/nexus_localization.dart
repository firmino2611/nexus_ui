import 'package:flutter/widgets.dart';

import './generated/s.dart';

class NexusLocalizations {
  final Locale locale;
  late final AppLocalizations _localizations;

  NexusLocalizations(this.locale) {
    _localizations = lookupAppLocalizations(
      locale,
    ); // Obtém as strings sem precisar do contexto
  }

  static NexusLocalizations of(BuildContext context) {
    return NexusLocalizations(Localizations.localeOf(context));
  }

  static const delegate = _NexusLocalizationsDelegate();

  static List<Locale> get supportedLocales => [
        Locale('en'),
        Locale('pt'),
      ];

  String get january => _localizations.january;
  String get february => _localizations.february;
  String get march => _localizations.march;
  String get april => _localizations.april;
  String get may => _localizations.may;
  String get june => _localizations.june;
  String get july => _localizations.july;
  String get august => _localizations.august;
  String get september => _localizations.september;
  String get october => _localizations.october;
  String get november => _localizations.november;
  String get december => _localizations.december;

  String get januaryShort => _localizations.january_short;
  String get februaryShort => _localizations.february_short;
  String get marchShort => _localizations.march_short;
  String get aprilShort => _localizations.april_short;
  String get mayShort => _localizations.may_short;
  String get juneShort => _localizations.june_short;
  String get julyShort => _localizations.july_short;
  String get augustShort => _localizations.august_short;
  String get septemberShort => _localizations.september_short;
  String get octoberShort => _localizations.october_short;
  String get novemberShort => _localizations.november_short;
  String get decemberShort => _localizations.december_short;

  String get sunday => _localizations.sunday;
  String get monday => _localizations.monday;
  String get tuesday => _localizations.tuesday;
  String get wednesday => _localizations.wednesday;
  String get thursday => _localizations.thursday;
  String get friday => _localizations.friday;
  String get saturday => _localizations.saturday;

  String get sundayShort => _localizations.sunday_short;
  String get mondayShort => _localizations.monday_short;
  String get tuesdayShort => _localizations.tuesday_short;
  String get wednesdayShort => _localizations.wednesday_short;
  String get thursdayShort => _localizations.thursday_short;
  String get fridayShort => _localizations.friday_short;
  String get saturdayShort => _localizations.saturday_short;

  String get sundayInitial => _localizations.sunday_initial;
  String get mondayInitial => _localizations.monday_initial;
  String get tuesdayInitial => _localizations.tuesday_initial;
  String get wednesdayInitial => _localizations.wednesday_initial;
  String get thursdayInitial => _localizations.thursday_initial;
  String get fridayInitial => _localizations.friday_initial;
  String get saturdayInitial => _localizations.saturday_initial;
}

class _NexusLocalizationsDelegate
    extends LocalizationsDelegate<NexusLocalizations> {
  const _NexusLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return NexusLocalizations.supportedLocales
        .any((supported) => supported.languageCode == locale.languageCode);
  }

  @override
  Future<NexusLocalizations> load(Locale locale) async {
    return NexusLocalizations(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<NexusLocalizations> old) => false;
}
