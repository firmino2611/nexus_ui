import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 's_en.dart';
import 's_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/s.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt')
  ];

  /// No description provided for @january.
  ///
  /// In en, this message translates to:
  /// **'January'**
  String get january;

  /// No description provided for @february.
  ///
  /// In en, this message translates to:
  /// **'February'**
  String get february;

  /// No description provided for @march.
  ///
  /// In en, this message translates to:
  /// **'March'**
  String get march;

  /// No description provided for @april.
  ///
  /// In en, this message translates to:
  /// **'April'**
  String get april;

  /// No description provided for @may.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get may;

  /// No description provided for @june.
  ///
  /// In en, this message translates to:
  /// **'June'**
  String get june;

  /// No description provided for @july.
  ///
  /// In en, this message translates to:
  /// **'July'**
  String get july;

  /// No description provided for @august.
  ///
  /// In en, this message translates to:
  /// **'August'**
  String get august;

  /// No description provided for @september.
  ///
  /// In en, this message translates to:
  /// **'September'**
  String get september;

  /// No description provided for @october.
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get october;

  /// No description provided for @november.
  ///
  /// In en, this message translates to:
  /// **'November'**
  String get november;

  /// No description provided for @december.
  ///
  /// In en, this message translates to:
  /// **'December'**
  String get december;

  /// No description provided for @january_short.
  ///
  /// In en, this message translates to:
  /// **'Jan'**
  String get january_short;

  /// No description provided for @february_short.
  ///
  /// In en, this message translates to:
  /// **'Feb'**
  String get february_short;

  /// No description provided for @march_short.
  ///
  /// In en, this message translates to:
  /// **'Mar'**
  String get march_short;

  /// No description provided for @april_short.
  ///
  /// In en, this message translates to:
  /// **'Apr'**
  String get april_short;

  /// No description provided for @may_short.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get may_short;

  /// No description provided for @june_short.
  ///
  /// In en, this message translates to:
  /// **'Jun'**
  String get june_short;

  /// No description provided for @july_short.
  ///
  /// In en, this message translates to:
  /// **'Jul'**
  String get july_short;

  /// No description provided for @august_short.
  ///
  /// In en, this message translates to:
  /// **'Aug'**
  String get august_short;

  /// No description provided for @september_short.
  ///
  /// In en, this message translates to:
  /// **'Sep'**
  String get september_short;

  /// No description provided for @october_short.
  ///
  /// In en, this message translates to:
  /// **'Oct'**
  String get october_short;

  /// No description provided for @november_short.
  ///
  /// In en, this message translates to:
  /// **'Nov'**
  String get november_short;

  /// No description provided for @december_short.
  ///
  /// In en, this message translates to:
  /// **'Dec'**
  String get december_short;

  /// No description provided for @sunday.
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get sunday;

  /// No description provided for @monday.
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get monday;

  /// No description provided for @tuesday.
  ///
  /// In en, this message translates to:
  /// **'Tuesday'**
  String get tuesday;

  /// No description provided for @wednesday.
  ///
  /// In en, this message translates to:
  /// **'Wednesday'**
  String get wednesday;

  /// No description provided for @thursday.
  ///
  /// In en, this message translates to:
  /// **'Thursday'**
  String get thursday;

  /// No description provided for @friday.
  ///
  /// In en, this message translates to:
  /// **'Friday'**
  String get friday;

  /// No description provided for @saturday.
  ///
  /// In en, this message translates to:
  /// **'Saturday'**
  String get saturday;

  /// No description provided for @sunday_short.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get sunday_short;

  /// No description provided for @monday_short.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get monday_short;

  /// No description provided for @tuesday_short.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get tuesday_short;

  /// No description provided for @wednesday_short.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get wednesday_short;

  /// No description provided for @thursday_short.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get thursday_short;

  /// No description provided for @friday_short.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get friday_short;

  /// No description provided for @saturday_short.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get saturday_short;

  /// No description provided for @sunday_initial.
  ///
  /// In en, this message translates to:
  /// **'S'**
  String get sunday_initial;

  /// No description provided for @monday_initial.
  ///
  /// In en, this message translates to:
  /// **'M'**
  String get monday_initial;

  /// No description provided for @tuesday_initial.
  ///
  /// In en, this message translates to:
  /// **'T'**
  String get tuesday_initial;

  /// No description provided for @wednesday_initial.
  ///
  /// In en, this message translates to:
  /// **'W'**
  String get wednesday_initial;

  /// No description provided for @thursday_initial.
  ///
  /// In en, this message translates to:
  /// **'T'**
  String get thursday_initial;

  /// No description provided for @friday_initial.
  ///
  /// In en, this message translates to:
  /// **'F'**
  String get friday_initial;

  /// No description provided for @saturday_initial.
  ///
  /// In en, this message translates to:
  /// **'S'**
  String get saturday_initial;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'pt': return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
