import 'package:flutter/material.dart' as Material;

class HomeScreen extends Material.StatelessWidget {
  const HomeScreen({Material.Key? key}) : super(key: key);

  @override
  Material.Widget build(Material.BuildContext context) {
    return Material.Container(
      child: Material.Text('Главная'),
    );
  }
}
