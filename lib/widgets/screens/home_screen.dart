import 'package:flutter/material.dart' show BuildContext, Container, Key, StatelessWidget, Text, Widget;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Обзор'),
    );
  }
}
