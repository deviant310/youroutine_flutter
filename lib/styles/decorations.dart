import 'package:flutter/material.dart';

import 'palette.dart';

class Decorations {
  BuildContext context;

  Decorations(this.context);

  InputDecoration get input {
    return InputDecoration(
      hintStyle: TextStyle(
        color: Palette.TextBlueToLight.shade600,
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          //color: Palette.GreyToLight.shade500,
          color: Palette.PrimaryBlueToLight.shade800,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          //color: Palette.GreyToLight.shade200,
          color: Palette.PrimaryBlueToLight.shade700,
        ),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.error,
          width: 1,
        ),
      ),
    );
  }
}
