import 'package:flutter/material.dart' as Material;
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart' as FontAwesome;
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:youroutine/widgets/commons/text_field.dart';
import 'package:youroutine/styles/palette.dart' as Palette;

class ConfirmScreen extends Material.StatefulWidget {
  ConfirmScreen({
    Material.Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  final String phoneNumber;

  @override
  _ConfirmScreenState createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends Material.State<ConfirmScreen> {
  final _formKey = Material.GlobalKey<Material.FormState>();
  final codeEditingController = Material.TextEditingController();
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
  Material.Widget build(Material.BuildContext context) {
    return Material.Scaffold(
      body: Material.Center(
        child: Material.Column(
          mainAxisAlignment: Material.MainAxisAlignment.start,
          children: [
            Material.SizedBox(height: 65),
            Material.Container(
              padding: Material.EdgeInsets.symmetric(horizontal: 42),
              child: Material.Column(
                children: [
                  Material.Container(
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
                  ),
                  Material.SizedBox(height: 55),
                  Material.Text(
                    phoneMaskFormatter.getMaskedText(),
                    style: Material.TextStyle(
                      color: Palette.textBlueToLight,
                      fontSize: 25,
                      fontWeight: Material.FontWeight.w500,
                    ),
                  ),
                  Material.SizedBox(height: 20),
                  Material.Text(
                    'Мы отправили вам SMS сообщение с\u{00A0}кодом.',
                    textAlign: Material.TextAlign.center,
                    style: Material.TextStyle(
                      height: 1.2,
                      color: Palette.textBlueToLight,
                      fontSize: 14,
                    ),
                  ),
                  Material.SizedBox(height: 35),
                  Material.Form(
                    key: _formKey,
                    child: Material.Column(
                      crossAxisAlignment: Material.CrossAxisAlignment.start,
                      children: [
                        Material.Row(
                          children: [
                            Material.Expanded(
                              child: TextField(
                                controller: codeEditingController,
                                hintText: 'Код',
                                icon: FontAwesome.FaIcon(
                                  FontAwesome.FontAwesomeIcons.solidKey,
                                  color: Palette.textBlueToLight.shade300,
                                  size: 20,
                                ),
                                inputFormatters: [codeMaskFormatter],
                                keyboardType: TextInputType.number,
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
                        Material.SizedBox(height: 46),
                        Material.Row(
                          children: [
                            Material.Expanded(
                              child: Material.TextButton(
                                style: Material.TextButton.styleFrom(
                                  minimumSize: Material.Size(double.infinity, 45),
                                  side: Material.BorderSide(
                                    color: Palette.primaryBlueToLight.shade700,
                                  ),
                                ),
                                onPressed: () {
                                  Material.Navigator.pop(context);
                                },
                                child: Material.Text(
                                  'Назад'.toUpperCase(),
                                  style: Material.TextStyle(
                                    color: Palette.textBlueToLight,
                                    fontSize: 13,
                                    fontWeight: Material.FontWeight.bold,
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
