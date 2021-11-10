import 'dart:ui' show Locale;

import 'package:flutter/material.dart' show BuildContext, Colors, MaterialApp, runApp, StatelessWidget, ThemeData, Widget;
import 'package:flutter_gen/gen_l10n/app_localizations.dart' show AppLocalizations;
import 'package:flutter_localizations/flutter_localizations.dart'
    show GlobalCupertinoLocalizations, GlobalMaterialLocalizations, GlobalWidgetsLocalizations;
import 'package:youroutine/styles/palette.dart' show Palette;
import 'package:youroutine/widgets/screens/login_screen.dart' show LoginScreen;

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'AG'),
        Locale('en', 'AU'),
        Locale('en', 'BW'),
        Locale('en', 'CA'),
        Locale('en', 'DK'),
        Locale('en', 'GB'),
        Locale('en', 'HK'),
        Locale('en', 'IE'),
        Locale('en', 'IL'),
        Locale('en', 'IN'),
        Locale('en', 'NG'),
        Locale('en', 'NZ'),
        Locale('en', 'PH'),
        Locale('en', 'SC'),
        Locale('en', 'SG'),
        Locale('en', 'US'),
        Locale('en', 'ZA'),
        Locale('en', 'ZM'),
        Locale('en', 'ZW'),
        Locale('ru', 'RU'),
      ],
      localeListResolutionCallback: (List? locales, Iterable supportedLocales) {
        //return Locale('en', 'CA');
      },
      theme: ThemeData(
        primarySwatch: Palette.primaryBlueToDark,
        scaffoldBackgroundColor: Colors.white,
      ),
      title: 'YouRoutine',
    );
  }
}
