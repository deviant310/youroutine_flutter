import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youroutine/styles/palette.dart';
import 'package:youroutine/styles/decorations.dart';

class ConfirmScreen extends StatefulWidget {
  ConfirmScreen({
    Key? key,
    required this.title,
    required this.phoneNumber,
  }) : super(key: key);

  final String title;
  final String phoneNumber;

  @override
  _ConfirmScreenState createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  final _formKey = GlobalKey<FormState>();
  final codeEditingController = TextEditingController();
  final codeMaskFormatter = MaskTextInputFormatter(
    mask: '###-###',
    filter: {"#": RegExp(r'[0-9]')},
  );
  final phoneMaskFormatter = MaskTextInputFormatter(
    mask: '+# ### ### ####',
  );

  @override
  void initState() {
    super.initState();

    phoneMaskFormatter.formatEditUpdate(
      TextEditingValue(text: ''),
      TextEditingValue(text: widget.phoneNumber),
    );
  }

  @override
  void dispose() {
    codeEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final decorations = Decorations(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 65),
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
                    phoneMaskFormatter.getMaskedText(),
                    style: TextStyle(
                      color: Palette.TextBlueToLight,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Мы отправили вам SMS сообщение с\u{00A0}кодом.',
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
                                controller: codeEditingController,
                                cursorColor: Palette.TextBlueToLight,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Palette.TextBlueToLight,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: decorations.input.copyWith(
                                  icon: FaIcon(
                                    FontAwesomeIcons.solidKey,
                                    color: Palette.TextBlueToLight.shade300,
                                    size: 20,
                                  ),
                                  hintText: 'Код',
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: [codeMaskFormatter],
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
                        Row(
                          //padding: const EdgeInsets.symmetric(vertical: 16.0),
                          children: [
                            Expanded(
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  minimumSize: Size(double.infinity, 45),
                                  side: BorderSide(
                                    //color: Palette.GreyToLight.shade400,
                                    color: Palette.PrimaryBlueToLight.shade700,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Назад'.toUpperCase(),
                                  style: TextStyle(
                                    color: Palette.TextBlueToLight,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
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
