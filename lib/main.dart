import 'dart:ui' as UI;
import 'package:flutter/material.dart' as Material;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart' as Localizations;
import 'package:youroutine/styles/palette.dart' as Palette;
import 'package:youroutine/widgets/screens/login/sign_in.dart';

void main() {
  Material.runApp(App());
}

class App extends Material.StatelessWidget {
  @override
  Material.Widget build(Material.BuildContext context) {
    return Material.MaterialApp(
      home: SignInScreen(),
      localizationsDelegates: [
        AppLocalizations.delegate,
        Localizations.GlobalMaterialLocalizations.delegate,
        Localizations.GlobalWidgetsLocalizations.delegate,
        Localizations.GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        UI.Locale('en', ''),
        UI.Locale('ru', ''),
      ],
      localeListResolutionCallback: (List? locales, Iterable supportedLocales) {
        //return UI.Locale('en', '');
      },
      theme: Material.ThemeData(
        primarySwatch: Palette.primaryBlueToDark,
        scaffoldBackgroundColor: Material.Colors.white,
      ),
      title: 'YouRoutine',
    );
  }
}
