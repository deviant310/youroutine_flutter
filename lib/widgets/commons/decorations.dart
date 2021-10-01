import 'package:flutter/material.dart';

import '../../styles/palette.dart';

class Decorations {
  Decorations(this.context);

  BuildContext context;

  InputDecoration get input {
    return InputDecoration(
      hintStyle: TextStyle(
        color: Palette.textBlueToLight.shade600,
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Palette.primaryBlueToLight.shade800,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Palette.primaryBlueToLight.shade700,
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
