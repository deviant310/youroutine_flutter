import 'package:flutter/material.dart';

import 'palette.dart';

class Decorations {
  BuildContext context;

  Decorations(this.context);

  InputDecoration get input {
    return InputDecoration(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Palette.GreyToLight.shade500,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Palette.GreyToLight.shade200,
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
