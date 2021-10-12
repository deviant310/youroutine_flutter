import 'package:flutter/material.dart' as Material;
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart' as FontAwesome;
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:youroutine/assets/data/countries.dart';
import 'package:youroutine/core/page_route.dart';
import 'package:youroutine/factories/country.dart';
import 'package:youroutine/styles/palette.dart' as Palette;
import 'package:youroutine/widgets/commons/logo.dart';
import 'package:youroutine/widgets/commons/text_field.dart';
import 'package:youroutine/widgets/screens/login/confirm.dart';
import 'package:youroutine/styles/animations.dart' as Animations;

class SignInScreen extends Material.StatefulWidget {
  SignInScreen({Material.Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends Material.State<SignInScreen> {
  final _formKey = Material.GlobalKey<Material.FormState>();
  final phoneEditingController = Material.TextEditingController();
  final phoneMaskFormatter = MaskTextInputFormatter(
    mask: '+# (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  void initState() {
    super.initState();

    phoneEditingController.value = phoneMaskFormatter.formatEditUpdate(
      TextEditingValue(text: ''),
      TextEditingValue(text: '7'),
    );
  }

  @override
  void dispose() {
    phoneEditingController.dispose();
    super.dispose();
  }

  Material.Route _confirmScreenRoute() {
    return ScreenRoute(
      widget: ConfirmScreen(
        title: 'Подтверждение входа',
        phoneNumber: phoneMaskFormatter.getUnmaskedText(),
      ),
      transitionDuration: Animations.screenTransitionDuration,
    );
  }

  @override
  Material.Widget build(Material.BuildContext context) {
    return Material.Scaffold(
      body: Material.SingleChildScrollView(
        child: Material.Center(
          child: Material.Column(
            mainAxisAlignment: Material.MainAxisAlignment.start,
            children: [
              Material.Container(
                padding: Material.EdgeInsets.symmetric(horizontal: 42),
                child: Material.Column(
                  children: [
                    Material.SizedBox(height: 65),
                    Logo(),
                    Material.SizedBox(height: 55),
                    Material.Text(
                      'Вход в YouRoutine',
                      style: Material.TextStyle(
                        color: Palette.textBlueToLight,
                        fontSize: 25,
                        fontWeight: Material.FontWeight.w500,
                      ),
                    ),
                    Material.SizedBox(height: 20),
                    Material.Text(
                      'Пожалуйста, укажите свою страну и\u{00A0}введите свой номер телефона.',
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
                                child: Material.LayoutBuilder(builder: (context, constraints) {
                                  return Material.Autocomplete<Country>(
                                    fieldViewBuilder: (context, controller, focusNode, callback) {
                                      return TextField(
                                        hintText: 'Страна',
                                        icon: FontAwesome.FaIcon(
                                          FontAwesome.FontAwesomeIcons.solidGlobe,
                                          color: Palette.textBlueToLight.shade300,
                                          size: 20,
                                        ),
                                        controller: controller,
                                        focusNode: focusNode,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Выберите значение из списка';
                                          }
                                          return null;
                                        },
                                      );
                                    },
                                    optionsViewBuilder: (context, onSelected, options) {
                                      return Material.Align(
                                        alignment: Material.Alignment.topLeft,
                                        child: Material.Material(
                                          elevation: 4,
                                          color: Material.Colors.white,
                                          child: Material.ConstrainedBox(
                                            constraints: Material.BoxConstraints(
                                              maxWidth: constraints.biggest.width,
                                              maxHeight: 200,
                                            ),
                                            child: Material.ListView.builder(
                                              padding: Material.EdgeInsets.zero,
                                              shrinkWrap: true,
                                              itemCount: options.length,
                                              itemBuilder: (Material.BuildContext context, int index) {
                                                final Country option = options.elementAt(index);
                                                return Material.InkWell(
                                                  onTap: () {
                                                    onSelected(option);
                                                  },
                                                  child: Material.Builder(builder: (Material.BuildContext context) {
                                                    final bool highlight =
                                                        Material.AutocompleteHighlightedOption.of(context) == index;
                                                    if (highlight) {
                                                      SchedulerBinding.instance!
                                                          .addPostFrameCallback((Duration timeStamp) {
                                                        Material.Scrollable.ensureVisible(context, alignment: 0.5);
                                                      });
                                                    }
                                                    return Material.Container(
                                                      color: highlight ? Material.Theme.of(context).focusColor : null,
                                                      padding: const Material.EdgeInsets.all(16.0),
                                                      child: Material.Text(option.title),
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    optionsBuilder: (TextEditingValue textEditingValue) {
                                      if (textEditingValue.text == '') {
                                        return const Iterable<Country>.empty();
                                      }
                                      return countries.where((Country option) {
                                        return option.title.toLowerCase().contains(textEditingValue.text.toLowerCase());
                                      });
                                    },
                                    displayStringForOption: (Country option) => option.title,
                                    onSelected: (Country selection) {
                                      final title = selection.title;

                                      print('You just selected $title');
                                    },
                                  );
                                }),
                              ),
                            ],
                          ),
                          Material.SizedBox(height: 20),
                          Material.Row(
                            children: [
                              Material.Expanded(
                                child: TextField(
                                  controller: phoneEditingController,
                                  hintText: 'Номер телефона',
                                  icon: FontAwesome.FaIcon(
                                    FontAwesome.FontAwesomeIcons.solidPhoneAlt,
                                    color: Palette.textBlueToLight.shade300,
                                    size: 20,
                                  ),
                                  inputFormatters: [phoneMaskFormatter],
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
                                child: Material.ElevatedButton(
                                  style: Material.ElevatedButton.styleFrom(
                                    primary: Palette.primaryBlueToDark,
                                    minimumSize: Material.Size(double.infinity, 45),
                                    shape: Material.RoundedRectangleBorder(
                                      borderRadius: Material.BorderRadius.circular(6),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      Material.Navigator.of(context).push(_confirmScreenRoute());
                                    }
                                  },
                                  child: Material.Text(
                                    'Далее'.toUpperCase(),
                                    style: Material.TextStyle(
                                      color: Material.Colors.white,
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
      ),
    );
  }
}
