import 'package:flutter/material.dart';
import 'package:youroutine/styles/palette.dart';
import 'package:youroutine/widgets/screens/login/signin.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouRoutine',
      theme: ThemeData(
        primarySwatch: Palette.PrimaryBlueToDark,
        scaffoldBackgroundColor: Colors.white
      ),
      home: SignInScreen(title: 'Вход в YouRoutine')
    );
  }
}
