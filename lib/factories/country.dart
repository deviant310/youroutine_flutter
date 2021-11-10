import 'package:flutter/material.dart' as Material;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Country {
  final String countryCode;
  final int phoneCode;
  final List<String> phoneMasks;

  Country({
    required this.countryCode,
    required this.phoneCode,
    required this.phoneMasks,
  });

  List<String> get phoneFullMasks {
    return phoneMasks.map((mask) {
      return '+' + phoneCode.toString() + ' ' + mask;
    }).toList();
  }

  String getLocalizedNameOf(Material.BuildContext context) {
    return AppLocalizations.of(context)!.country(countryCode);
  }
}
