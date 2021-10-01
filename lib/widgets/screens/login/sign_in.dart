import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:youroutine/assets/data/countries.dart';
import 'package:youroutine/core/page_route.dart';
import 'package:youroutine/factories/country.dart';
import 'package:youroutine/styles/palette.dart';
import 'package:youroutine/widgets/commons/decorations.dart';
import 'package:youroutine/widgets/screens/login/confirm.dart';
import 'package:youroutine/styles/animations.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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

  Route _confirmScreenRoute() {
    return ScreenRoute(
      widget: ConfirmScreen(
        title: 'Подтверждение входа',
        phoneNumber: phoneMaskFormatter.getUnmaskedText(),
      ),
      transitionDuration: Animations.screenTransitionDuration,
    );
  }

  @override
  Widget build(BuildContext context) {
    final decorations = Decorations(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 42),
                child: Column(
                  children: [
                    SizedBox(height: 65),
                    Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: Palette.primaryBlueToDark,
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
                        color: Palette.textBlueToLight,
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
                                child: LayoutBuilder(
                                    builder: (context, constraints) {
                                  return Autocomplete<Country>(
                                    fieldViewBuilder: (context, controller,
                                        focusNode, callback) {
                                      return TextFormField(
                                        controller: controller,
                                        focusNode: focusNode,
                                        cursorColor: Palette.textBlueToLight,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Palette.textBlueToLight,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        decoration: decorations.input.copyWith(
                                          icon: FaIcon(
                                            FontAwesomeIcons.solidGlobe,
                                            color: Palette
                                                .textBlueToLight.shade300,
                                            size: 20,
                                          ),
                                          hintText: 'Страна',
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Выберите значение из списка';
                                          }
                                          return null;
                                        },
                                      );
                                    },
                                    optionsViewBuilder:
                                        (context, onSelected, options) {
                                      return Align(
                                        alignment: Alignment.topLeft,
                                        child: Material(
                                          elevation: 4,
                                          color: Colors.white,
                                          child: ConstrainedBox(
                                            constraints: BoxConstraints(
                                              maxWidth:
                                                  constraints.biggest.width,
                                              maxHeight: 200,
                                            ),
                                            child: ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              itemCount: options.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                final Country option =
                                                    options.elementAt(index);
                                                return InkWell(
                                                  onTap: () {
                                                    onSelected(option);
                                                  },
                                                  child: Builder(builder:
                                                      (BuildContext context) {
                                                    final bool highlight =
                                                        AutocompleteHighlightedOption
                                                                .of(context) ==
                                                            index;
                                                    if (highlight) {
                                                      SchedulerBinding.instance!
                                                          .addPostFrameCallback(
                                                              (Duration
                                                                  timeStamp) {
                                                        Scrollable
                                                            .ensureVisible(
                                                                context,
                                                                alignment: 0.5);
                                                      });
                                                    }
                                                    return Container(
                                                      color: highlight
                                                          ? Theme.of(context)
                                                              .focusColor
                                                          : null,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              16.0),
                                                      child: Text(option.title),
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    optionsBuilder:
                                        (TextEditingValue textEditingValue) {
                                      if (textEditingValue.text == '') {
                                        return const Iterable<Country>.empty();
                                      }
                                      return countries.where((Country option) {
                                        return option.title
                                            .toLowerCase()
                                            .contains(textEditingValue.text
                                                .toLowerCase());
                                      });
                                    },
                                    displayStringForOption: (Country option) =>
                                        option.title,
                                    onSelected: (Country selection) {
                                      final title = selection.title;

                                      print('You just selected $title');
                                    },
                                  );
                                }),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: phoneEditingController,
                                  cursorColor: Palette.textBlueToLight,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Palette.textBlueToLight,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  decoration: decorations.input.copyWith(
                                    icon: FaIcon(
                                      FontAwesomeIcons.solidPhoneAlt,
                                      color: Palette.textBlueToLight.shade300,
                                      size: 20,
                                    ),
                                    hintText: 'Номер телефона',
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
                                primary: Palette.primaryBlueToDark,
                                minimumSize: Size(double.infinity, 45),
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(6),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.of(context)
                                      .push(_confirmScreenRoute());
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
      ),
    );
  }
}
