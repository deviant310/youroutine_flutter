import 'package:flutter/material.dart' as Material
    show BorderRadius, BoxDecoration, BuildContext, Center, Container, Colors, Key, StatelessWidget, Text, TextStyle, Widget;
import 'package:youroutine/styles/palette.dart' show Palette;

class Logo extends Material.StatelessWidget {
  const Logo({Material.Key? key}) : super(key: key);

  @override
  Material.Widget build(Material.BuildContext context) {
    return Material.Container(
      width: 110,
      height: 110,
      decoration: Material.BoxDecoration(
        borderRadius: Material.BorderRadius.circular(60),
        color: Palette.primaryBlueToDark,
      ),
      child: Material.Center(
        child: Material.Text(
          'YR',
          style: Material.TextStyle(
            color: Material.Colors.white,
            fontSize: 45,
          ),
        ),
      ),
    );
  }
}
