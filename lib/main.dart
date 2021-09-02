import 'package:flutter/material.dart';

import 'form.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: LoginScreen(title: 'Flutter Demo Home Page'),
    );
  }
}

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 42),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Color.fromRGBO(52, 88, 157, 1),
                    ),
                    child: Center(
                      child: Text(
                        'YR',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 55),
                  Text(
                    'Вход в YouRoutine',
                    style: TextStyle(
                      color: Color.fromRGBO(76, 91, 121, 1),
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Пожалуйста, укажите свою страну и\u{00A0}введите свой номер телефона.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.3,
                      color: Color.fromRGBO(76, 91, 121, 1),
                      fontSize: 15,
                    ),
                  ),
                  CustomForm()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
