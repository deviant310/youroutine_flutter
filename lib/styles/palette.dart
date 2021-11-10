import 'package:flutter/material.dart';

class Palette {
  static final primaryBlueToDark = const MaterialColor(
    0xff34589d,
    const <int, Color>{
      50: const Color(0xff2f4f8d),
      100: const Color(0xff2a467e),
      200: const Color(0xff243e6e),
      300: const Color(0xff1f355e),
      400: const Color(0xff1a2c4f),
      500: const Color(0xff15233f),
      600: const Color(0xff101a2f),
      700: const Color(0xff0a121f),
      800: const Color(0xff050910),
      900: const Color(0xff000000),
    },
  );

  static final primaryBlueToLight = const MaterialColor(
    0xff34589d,
    const <int, Color>{
      50: const Color(0xff4869a7),
      100: const Color(0xff5d79b1),
      200: const Color(0xff718aba),
      300: const Color(0xff859bc4),
      400: const Color(0xff9aacce),
      500: const Color(0xffaebcd8),
      600: const Color(0xffc2cde2),
      700: const Color(0xffd6deeb),
      800: const Color(0xffebeef5),
      900: const Color(0xffffffff),
    },
  );

  static final textBlueToLight = const MaterialColor(
    0xff4c5b79,
    const <int, Color>{
      50: const Color(0xff5e6b86),
      100: const Color(0xff707c94),
      200: const Color(0xff828ca1),
      300: const Color(0xff949daf),
      400: const Color(0xffa6adbc),
      500: const Color(0xffb7bdc9),
      600: const Color(0xffc9ced7),
      700: const Color(0xffdbdee4),
      800: const Color(0xffedeff2),
      900: const Color(0xffffffff),
    },
  );

  static final greyToLight = const MaterialColor(
    0xffd2d2d2,
    const <int, Color>{
      50: const Color(0xffd7d7d7),
      100: const Color(0xffdbdbdb),
      200: const Color(0xffe0e0e0),
      300: const Color(0xffe4e4e4),
      400: const Color(0xffe9e9e9),
      500: const Color(0xffededed),
      600: const Color(0xfff2f2f2),
      700: const Color(0xfff6f6f6),
      800: const Color(0xfffbfbfb),
      900: const Color(0xffffffff),
    },
  );
}
