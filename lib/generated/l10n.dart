// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Back`
  String get buttonBack {
    return Intl.message(
      'Back',
      name: 'buttonBack',
      desc: 'Back button text',
      args: [],
    );
  }

  /// `Next`
  String get buttonContinue {
    return Intl.message(
      'Next',
      name: 'buttonContinue',
      desc: 'Continue button text',
      args: [],
    );
  }

  /// `Code`
  String get fieldCodeHint {
    return Intl.message(
      'Code',
      name: 'fieldCodeHint',
      desc: 'Code field hint text',
      args: [],
    );
  }

  /// `Country`
  String get fieldCountryHint {
    return Intl.message(
      'Country',
      name: 'fieldCountryHint',
      desc: 'Country field hint text',
      args: [],
    );
  }

  /// `Phone number`
  String get fieldPhoneHint {
    return Intl.message(
      'Phone number',
      name: 'fieldPhoneHint',
      desc: 'Phone field hint text',
      args: [],
    );
  }

  /// `Phone number invalid`
  String get fieldPhoneValidationInvalid {
    return Intl.message(
      'Phone number invalid',
      name: 'fieldPhoneValidationInvalid',
      desc: 'Phone field invalid value validation text',
      args: [],
    );
  }

  /// `Start typing a value`
  String get fieldTypeAutocompleteValidationEmpty {
    return Intl.message(
      'Start typing a value',
      name: 'fieldTypeAutocompleteValidationEmpty',
      desc: 'Autocomplete field empty value validation text',
      args: [],
    );
  }

  /// `Select a value from the list`
  String get fieldTypeAutocompleteValidationInvalid {
    return Intl.message(
      'Select a value from the list',
      name: 'fieldTypeAutocompleteValidationInvalid',
      desc: 'Autocomplete field invalid value validation text',
      args: [],
    );
  }

  /// `Enter a value`
  String get fieldTypeTextValidationEmpty {
    return Intl.message(
      'Enter a value',
      name: 'fieldTypeTextValidationEmpty',
      desc: 'Text field empty value validation text',
      args: [],
    );
  }

  /// `Incorrect value entered`
  String get fieldTypeTextValidationInvalid {
    return Intl.message(
      'Incorrect value entered',
      name: 'fieldTypeTextValidationInvalid',
      desc: 'Text field invalid value validation text',
      args: [],
    );
  }

  /// `{countryCode, select, AD {Andorra} AE {United Arab Emirates} AF {Afghanistan} AG {Antigua & Barbuda} AI {Anguilla} AL {Albania} AM {Armenia} AO {Angola} AR {Argentina} AS {American Samoa} AT {Austria} AU {Australia} AW {Aruba} AZ {Azerbaijan} BA {Bosnia & Herzegovina} BB {Barbados} BD {Bangladesh} BE {Belgium} BF {Burkina Faso} BG {Bulgaria} BH {Bahrain} BI {Burundi} BJ {Benin} BM {Bermuda} BN {Brunei Darussalam} BO {Bolivia} BQ {Bonaire, Sint Eustatius & Saba} BR {Brazil} BS {Bahamas} BT {Bhutan} BW {Botswana} BY {Belarus} BZ {Belize} CA {Canada} CD {Congo (Dem. Rep.)} CF {Central African Rep.} CG {Congo (Rep.)} CH {Switzerland} CI {Côte d'Ivoire} CK {Cook Islands} CL {Chile} CM {Cameroon} CN {China} CO {Colombia} CR {Costa Rica} CU {Cuba} CV {Cape Verde} CW {Curaçao} CY {Cyprus} CZ {Czech Republic} DE {Germany} DJ {Djibouti} DK {Denmark} DM {Dominica} DO {Dominican Rep.} DZ {Algeria} EC {Ecuador} EE {Estonia} EG {Egypt} ER {Eritrea} ES {Spain} ET {Ethiopia} FI {Finland} FJ {Fiji} FK {Falkland Islands} FM {Micronesia} FO {Faroe Islands} FR {France} GA {Gabon} GB {United Kingdom} GD {Grenada} GE {Georgia} GF {French Guiana} GH {Ghana} GI {Gibraltar} GL {Greenland} GM {Gambia} GN {Guinea} GP {Guadeloupe} GQ {Equatorial Guinea} GR {Greece} GT {Guatemala} GU {Guam} GW {Guinea-Bissau} GY {Guyana} HK {Hong Kong} HN {Honduras} HR {Croatia} HT {Haiti} HU {Hungary} ID {Indonesia} IE {Ireland} IL {Israel} IN {India} IO {Diego Garcia} IQ {Iraq} IR {Iran} IS {Iceland} IT {Italy} JM {Jamaica} JO {Jordan} JP {Japan} KE {Kenya} KG {Kyrgyzstan} KH {Cambodia} KI {Kiribati} KM {Comoros} KN {Saint Kitts & Nevis} KP {North Korea} KR {South Korea} KW {Kuwait} KY {Cayman Islands} KZ {Kazakhstan} LA {Laos} LB {Lebanon} LC {Saint Lucia} LI {Liechtenstein} LK {Sri Lanka} LR {Liberia} LS {Lesotho} LT {Lithuania} LU {Luxembourg} LV {Latvia} LY {Libya} MA {Morocco} MC {Monaco} MD {Moldova} ME {Montenegro} MG {Madagascar} MH {Marshall Islands} MK {North Macedonia} ML {Mali} MM {Myanmar} MN {Mongolia} MO {Macau} MP {Northern Mariana Islands} MQ {Martinique} MR {Mauritania} MS {Montserrat} MT {Malta} MU {Mauritius} MV {Maldives} MW {Malawi} MX {Mexico} MY {Malaysia} MZ {Mozambique} NA {Namibia} NC {New Caledonia} NE {Niger} NF {Norfolk Island} NG {Nigeria} NI {Nicaragua} NL {Netherlands} NO {Norway} NP {Nepal} NR {Nauru} NU {Niue} NZ {New Zealand} OM {Oman} PA {Panama} PE {Peru} PF {French Polynesia} PG {Papua New Guinea} PH {Philippines} PK {Pakistan} PL {Poland} PM {Saint Pierre & Miquelon} PR {Puerto Rico} PS {Palestine} PT {Portugal} PW {Palau} PY {Paraguay} QA {Qatar} RE {Réunion} RO {Romania} RS {Serbia} RU {Russian Federation} RW {Rwanda} SA {Saudi Arabia} SB {Solomon Islands} SC {Seychelles} SD {Sudan} SE {Sweden} SG {Singapore} SH {Saint Helena} SI {Slovenia} SK {Slovakia} SL {Sierra Leone} SM {San Marino} SN {Senegal} SO {Somalia} SR {Suriname} SS {South Sudan} ST {São Tomé & Príncipe} SV {El Salvador} SX {Sint Maarten} SY {Syria} SZ {Eswatini} TC {Turks & Caicos Islands} TD {Chad} TG {Togo} TH {Thailand} TJ {Tajikistan} TK {Tokelau} TL {Timor-Leste} TM {Turkmenistan} TN {Tunisia} TO {Tonga} TR {Turkey} TT {Trinidad & Tobago} TV {Tuvalu} TW {Taiwan} TZ {Tanzania} UA {Ukraine} UG {Uganda} US {USA} UY {Uruguay} UZ {Uzbekistan} VC {Saint Vincent & the Grenadines} VE {Venezuela} VG {British Virgin Islands} VI {US Virgin Islands} VN {Vietnam} VU {Vanuatu} WF {Wallis & Futuna} WS {Samoa} XK {Kosovo} YE {Yemen} ZA {South Africa} ZM {Zambia} ZW {Zimbabwe} other {}}`
  String country(Object countryCode) {
    return Intl.select(
      countryCode,
      {
        'AD': 'Andorra',
        'AE': 'United Arab Emirates',
        'AF': 'Afghanistan',
        'AG': 'Antigua & Barbuda',
        'AI': 'Anguilla',
        'AL': 'Albania',
        'AM': 'Armenia',
        'AO': 'Angola',
        'AR': 'Argentina',
        'AS': 'American Samoa',
        'AT': 'Austria',
        'AU': 'Australia',
        'AW': 'Aruba',
        'AZ': 'Azerbaijan',
        'BA': 'Bosnia & Herzegovina',
        'BB': 'Barbados',
        'BD': 'Bangladesh',
        'BE': 'Belgium',
        'BF': 'Burkina Faso',
        'BG': 'Bulgaria',
        'BH': 'Bahrain',
        'BI': 'Burundi',
        'BJ': 'Benin',
        'BM': 'Bermuda',
        'BN': 'Brunei Darussalam',
        'BO': 'Bolivia',
        'BQ': 'Bonaire, Sint Eustatius & Saba',
        'BR': 'Brazil',
        'BS': 'Bahamas',
        'BT': 'Bhutan',
        'BW': 'Botswana',
        'BY': 'Belarus',
        'BZ': 'Belize',
        'CA': 'Canada',
        'CD': 'Congo (Dem. Rep.)',
        'CF': 'Central African Rep.',
        'CG': 'Congo (Rep.)',
        'CH': 'Switzerland',
        'CI': 'Côte d\'Ivoire',
        'CK': 'Cook Islands',
        'CL': 'Chile',
        'CM': 'Cameroon',
        'CN': 'China',
        'CO': 'Colombia',
        'CR': 'Costa Rica',
        'CU': 'Cuba',
        'CV': 'Cape Verde',
        'CW': 'Curaçao',
        'CY': 'Cyprus',
        'CZ': 'Czech Republic',
        'DE': 'Germany',
        'DJ': 'Djibouti',
        'DK': 'Denmark',
        'DM': 'Dominica',
        'DO': 'Dominican Rep.',
        'DZ': 'Algeria',
        'EC': 'Ecuador',
        'EE': 'Estonia',
        'EG': 'Egypt',
        'ER': 'Eritrea',
        'ES': 'Spain',
        'ET': 'Ethiopia',
        'FI': 'Finland',
        'FJ': 'Fiji',
        'FK': 'Falkland Islands',
        'FM': 'Micronesia',
        'FO': 'Faroe Islands',
        'FR': 'France',
        'GA': 'Gabon',
        'GB': 'United Kingdom',
        'GD': 'Grenada',
        'GE': 'Georgia',
        'GF': 'French Guiana',
        'GH': 'Ghana',
        'GI': 'Gibraltar',
        'GL': 'Greenland',
        'GM': 'Gambia',
        'GN': 'Guinea',
        'GP': 'Guadeloupe',
        'GQ': 'Equatorial Guinea',
        'GR': 'Greece',
        'GT': 'Guatemala',
        'GU': 'Guam',
        'GW': 'Guinea-Bissau',
        'GY': 'Guyana',
        'HK': 'Hong Kong',
        'HN': 'Honduras',
        'HR': 'Croatia',
        'HT': 'Haiti',
        'HU': 'Hungary',
        'ID': 'Indonesia',
        'IE': 'Ireland',
        'IL': 'Israel',
        'IN': 'India',
        'IO': 'Diego Garcia',
        'IQ': 'Iraq',
        'IR': 'Iran',
        'IS': 'Iceland',
        'IT': 'Italy',
        'JM': 'Jamaica',
        'JO': 'Jordan',
        'JP': 'Japan',
        'KE': 'Kenya',
        'KG': 'Kyrgyzstan',
        'KH': 'Cambodia',
        'KI': 'Kiribati',
        'KM': 'Comoros',
        'KN': 'Saint Kitts & Nevis',
        'KP': 'North Korea',
        'KR': 'South Korea',
        'KW': 'Kuwait',
        'KY': 'Cayman Islands',
        'KZ': 'Kazakhstan',
        'LA': 'Laos',
        'LB': 'Lebanon',
        'LC': 'Saint Lucia',
        'LI': 'Liechtenstein',
        'LK': 'Sri Lanka',
        'LR': 'Liberia',
        'LS': 'Lesotho',
        'LT': 'Lithuania',
        'LU': 'Luxembourg',
        'LV': 'Latvia',
        'LY': 'Libya',
        'MA': 'Morocco',
        'MC': 'Monaco',
        'MD': 'Moldova',
        'ME': 'Montenegro',
        'MG': 'Madagascar',
        'MH': 'Marshall Islands',
        'MK': 'North Macedonia',
        'ML': 'Mali',
        'MM': 'Myanmar',
        'MN': 'Mongolia',
        'MO': 'Macau',
        'MP': 'Northern Mariana Islands',
        'MQ': 'Martinique',
        'MR': 'Mauritania',
        'MS': 'Montserrat',
        'MT': 'Malta',
        'MU': 'Mauritius',
        'MV': 'Maldives',
        'MW': 'Malawi',
        'MX': 'Mexico',
        'MY': 'Malaysia',
        'MZ': 'Mozambique',
        'NA': 'Namibia',
        'NC': 'New Caledonia',
        'NE': 'Niger',
        'NF': 'Norfolk Island',
        'NG': 'Nigeria',
        'NI': 'Nicaragua',
        'NL': 'Netherlands',
        'NO': 'Norway',
        'NP': 'Nepal',
        'NR': 'Nauru',
        'NU': 'Niue',
        'NZ': 'New Zealand',
        'OM': 'Oman',
        'PA': 'Panama',
        'PE': 'Peru',
        'PF': 'French Polynesia',
        'PG': 'Papua New Guinea',
        'PH': 'Philippines',
        'PK': 'Pakistan',
        'PL': 'Poland',
        'PM': 'Saint Pierre & Miquelon',
        'PR': 'Puerto Rico',
        'PS': 'Palestine',
        'PT': 'Portugal',
        'PW': 'Palau',
        'PY': 'Paraguay',
        'QA': 'Qatar',
        'RE': 'Réunion',
        'RO': 'Romania',
        'RS': 'Serbia',
        'RU': 'Russian Federation',
        'RW': 'Rwanda',
        'SA': 'Saudi Arabia',
        'SB': 'Solomon Islands',
        'SC': 'Seychelles',
        'SD': 'Sudan',
        'SE': 'Sweden',
        'SG': 'Singapore',
        'SH': 'Saint Helena',
        'SI': 'Slovenia',
        'SK': 'Slovakia',
        'SL': 'Sierra Leone',
        'SM': 'San Marino',
        'SN': 'Senegal',
        'SO': 'Somalia',
        'SR': 'Suriname',
        'SS': 'South Sudan',
        'ST': 'São Tomé & Príncipe',
        'SV': 'El Salvador',
        'SX': 'Sint Maarten',
        'SY': 'Syria',
        'SZ': 'Eswatini',
        'TC': 'Turks & Caicos Islands',
        'TD': 'Chad',
        'TG': 'Togo',
        'TH': 'Thailand',
        'TJ': 'Tajikistan',
        'TK': 'Tokelau',
        'TL': 'Timor-Leste',
        'TM': 'Turkmenistan',
        'TN': 'Tunisia',
        'TO': 'Tonga',
        'TR': 'Turkey',
        'TT': 'Trinidad & Tobago',
        'TV': 'Tuvalu',
        'TW': 'Taiwan',
        'TZ': 'Tanzania',
        'UA': 'Ukraine',
        'UG': 'Uganda',
        'US': 'USA',
        'UY': 'Uruguay',
        'UZ': 'Uzbekistan',
        'VC': 'Saint Vincent & the Grenadines',
        'VE': 'Venezuela',
        'VG': 'British Virgin Islands',
        'VI': 'US Virgin Islands',
        'VN': 'Vietnam',
        'VU': 'Vanuatu',
        'WF': 'Wallis & Futuna',
        'WS': 'Samoa',
        'XK': 'Kosovo',
        'YE': 'Yemen',
        'ZA': 'South Africa',
        'ZM': 'Zambia',
        'ZW': 'Zimbabwe',
        'other': '',
      },
      name: 'country',
      desc: '',
      args: [countryCode],
    );
  }

  /// `We have sent you a message with the code.`
  String get screenConfirmSubtitle {
    return Intl.message(
      'We have sent you a message with the code.',
      name: 'screenConfirmSubtitle',
      desc: 'Login confirm screen subtitle',
      args: [],
    );
  }

  /// `Log in YouRoutine`
  String get screenSignInTitle {
    return Intl.message(
      'Log in YouRoutine',
      name: 'screenSignInTitle',
      desc: 'Login sign in screen title',
      args: [],
    );
  }

  /// `Please confirm your country and enter your phone number.`
  String get screenSignInSubtitle {
    return Intl.message(
      'Please confirm your country and enter your phone number.',
      name: 'screenSignInSubtitle',
      desc: 'Login sign in screen subtitle',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
