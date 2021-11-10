import 'package:flutter/material.dart'
    show
        BorderSide,
        BuildContext,
        Center,
        Column,
        Container,
        CrossAxisAlignment,
        EdgeInsets,
        Expanded,
        FontWeight,
        Form,
        FormState,
        GlobalKey,
        Key,
        MainAxisAlignment,
        Navigator,
        Row,
        Scaffold,
        SingleChildScrollView,
        Size,
        SizedBox,
        State,
        StatefulWidget,
        Text,
        TextAlign,
        TextButton,
        TextEditingController,
        TextStyle,
        Widget;
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart' as FontAwesome;
import 'package:youroutine/core/flutter/services/mask_text_input_formatter.dart';
import 'package:youroutine/widgets/commons/logo.dart';
import 'package:youroutine/widgets/commons/text_field.dart';
import 'package:youroutine/styles/palette.dart' show Palette;

class LoginConfirmScreen extends StatefulWidget {
  final String phoneNumber;
  final String phoneDisplayNumber;

  LoginConfirmScreen({
    Key? key,
    required this.phoneNumber,
    required this.phoneDisplayNumber,
  }) : super(key: key);

  @override
  _LoginConfirmScreenState createState() => _LoginConfirmScreenState();
}

class _LoginConfirmScreenState extends State<LoginConfirmScreen> {
  final _formKey = GlobalKey<FormState>();
  final _formCodeEditingController = TextEditingController();
  final _formCodeMaskFormatter = MaskTextInputFormatter(
    masks: ['###-###'],
    validator: (char) {
      if (char == '#') return RegExp(r'\d');
    },
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _formCodeEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 42),
                child: Column(children: [
                  SizedBox(height: 65),
                  Logo(),
                  SizedBox(height: 55),
                  Text(
                    widget.phoneDisplayNumber,
                    style: TextStyle(
                      color: Palette.textBlueToLight,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    AppLocalizations.of(context)!.screenConfirmSubtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.2,
                      color: Palette.textBlueToLight,
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
                              child: TextField(
                                controller: _formCodeEditingController,
                                hintText: AppLocalizations.of(context)!.fieldCodeHint,
                                icon: FontAwesome.FaIcon(
                                  FontAwesome.FontAwesomeIcons.solidKey,
                                  color: Palette.textBlueToLight.shade300,
                                  size: 20,
                                ),
                                inputFormatters: [_formCodeMaskFormatter],
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return AppLocalizations.of(context)!.fieldTypeTextValidationEmpty;
                                  }
                                  return null;
                                },
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 46),
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  minimumSize: Size(double.infinity, 45),
                                  side: BorderSide(
                                    color: Palette.primaryBlueToLight.shade700,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  AppLocalizations.of(context)!.buttonBack.toUpperCase(),
                                  style: TextStyle(
                                    color: Palette.textBlueToLight,
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
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
