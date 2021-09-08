import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'styles/palette.dart';
import 'styles/decorations.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Palette.PrimaryBlueToDark,
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
  final _formKey = GlobalKey<FormState>();
  final countryEditingController = TextEditingController(text: 'Россия');
  final phoneEditingController = TextEditingController();
  final phoneMaskFormatter = MaskTextInputFormatter(
    mask: '+# (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  void initState() {
    super.initState();

    countryEditingController.addListener(_printLatestValue);
    phoneEditingController.value = phoneMaskFormatter.formatEditUpdate(
      TextEditingValue(text: ''),
      TextEditingValue(text: '7'),
    );
  }

  @override
  void dispose() {
    countryEditingController.dispose();
    phoneEditingController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    print(countryEditingController.text);
  }

  @override
  Widget build(BuildContext context) {
    final decorations = Decorations(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 42),
              child: Column(
                children: [
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Palette.PrimaryBlueToDark,
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
                      color: Palette.TextBlueToLight,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Пожалуйста, укажите свою страну и\u{00A0}введите свой номер телефона.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.2,
                      color: Palette.TextBlueToLight,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 35),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: countryEditingController,
                                cursorColor: Palette.TextBlueToLight,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Palette.TextBlueToLight,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: decorations.input.copyWith(
                                  icon: FaIcon(
                                    FontAwesomeIcons.solidGlobe,
                                    color: Palette.TextBlueToLight.shade300,
                                    size: 20,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: phoneEditingController,
                                cursorColor: Palette.TextBlueToLight,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Palette.TextBlueToLight,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: decorations.input.copyWith(
                                  icon: FaIcon(
                                    FontAwesomeIcons.solidPhoneAlt,
                                    color: Palette.TextBlueToLight.shade300,
                                    size: 20,
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: [phoneMaskFormatter],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 30),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Palette.PrimaryBlueToDark,
                              minimumSize: Size(double.infinity, 45),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(6),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Processing Data')),
                                );
                              }
                            },
                            child: Text(
                              'Далее'.toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
