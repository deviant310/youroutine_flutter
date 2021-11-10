import 'package:flutter/material.dart'
    show
    BorderRadius,
    BuildContext,
    Center,
    Colors,
    Column,
    Container,
    CrossAxisAlignment,
    EdgeInsets,
    ElevatedButton,
    Expanded,
    FontWeight,
    Form,
    FormState,
    GlobalKey,
    Key,
    Localizations,
    MainAxisAlignment,
    Navigator,
    RoundedRectangleBorder,
    Row,
    Scaffold,
    SingleChildScrollView,
    Size,
    SizedBox,
    State,
    StatefulWidget,
    Text,
    TextAlign,
    TextEditingController,
    TextStyle,
    Widget;
import 'package:flutter/scheduler.dart' show SchedulerBinding;
import 'package:flutter/services.dart' show TextEditingValue, TextInputType;
import 'package:flutter_gen/gen_l10n/app_localizations.dart' show AppLocalizations;
import 'package:font_awesome_flutter/font_awesome_flutter.dart' show FaIcon, FontAwesomeIcons;
import 'package:youroutine/assets/data/countries.dart' show countries;
import 'package:youroutine/core/flutter/widgets/screen_route.dart' show ScreenRoute;
import 'package:youroutine/core/flutter/services/mask_text_input_formatter.dart' show MaskTextInputFormatter;
import 'package:youroutine/factories/country.dart' show Country;
import 'package:youroutine/styles/animations.dart' show Animations;
import 'package:youroutine/styles/palette.dart' show Palette;
import 'package:youroutine/widgets/commons/autocomplete_field.dart' show AutocompleteField;
import 'package:youroutine/widgets/commons/logo.dart' show Logo;
import 'package:youroutine/widgets/commons/text_field.dart' show TextField;
import 'package:youroutine/widgets/screens/login_confirm_screen.dart' show LoginConfirmScreen;

class LoginScreen extends StatefulWidget {
  LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formPhoneEditingController = TextEditingController();
  MaskTextInputFormatter? _formPhoneMaskFormatter;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Country? _formCountry;
  String? _formPhone;

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance!.addPostFrameCallback((_) {
      final currentLocale = Localizations.localeOf(context);
      final currentLocaleCountry = countries.firstWhere((option) => option.countryCode == currentLocale.countryCode);

      setState(() {
        _formKey = GlobalKey<FormState>();
        _formCountry = currentLocaleCountry;
        _formPhone = currentLocaleCountry.phoneCode.toString();
      });
    });
  }

  @override
  void dispose() {
    _formPhoneEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formCountry = _formCountry;
    final formPhone = _formPhone;

    if (formCountry != null && formPhone != null) {
      _formPhoneMaskFormatter = MaskTextInputFormatter(
        masks: formCountry.phoneFullMasks,
        validator: (char) {
          if (char == '#') return RegExp(r'\d');
          if (RegExp(r'\d').hasMatch(char)) return RegExp(r'\d');
        },
      );
      _formPhoneEditingController.value = TextEditingValue(text: _formPhoneMaskFormatter?.maskText(formPhone) ?? '');
    }

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
                    AppLocalizations.of(context)!.screenSignInTitle,
                    style: TextStyle(
                      color: Palette.textBlueToLight,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    AppLocalizations.of(context)!.screenSignInSubtitle,
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
                        Row(children: [
                          Expanded(
                            child: AutocompleteField<Country>(
                              displayStringForOption: (country) => country.getLocalizedNameOf(context),
                              hintText: AppLocalizations.of(context)!.fieldCountryHint,
                              icon: FaIcon(
                                FontAwesomeIcons.solidGlobe,
                                color: Palette.textBlueToLight.shade300,
                                size: 20,
                              ),
                              initialValue: TextEditingValue(
                                text: _formCountry?.getLocalizedNameOf(context) ?? '',
                              ),
                              onSelected: (country) {
                                setState(() {
                                  _formKey = GlobalKey<FormState>();
                                  _formCountry = country;
                                  _formPhone = country.phoneCode.toString();
                                });
                              },
                              optionsBuilder: (textEditingValue) {
                                if (textEditingValue.text.isEmpty) {
                                  return const Iterable<Country>.empty();
                                }

                                return countries.where((country) {
                                  final lowerLocalizedTitle = country.getLocalizedNameOf(context).toLowerCase();
                                  final lowerTextEditingValue = textEditingValue.text.toLowerCase();

                                  return lowerLocalizedTitle.isNotEmpty && lowerLocalizedTitle.contains(lowerTextEditingValue);
                                });
                              },
                              optionViewBuilder: (country) => Text(country.getLocalizedNameOf(context)),
                              validator: (countryName) {
                                if (countryName == null) return null;

                                if (countryName.isEmpty)
                                  return AppLocalizations.of(context)!.fieldTypeAutocompleteValidationEmpty;

                                final countryNameIsValid = countries.any((country) {
                                  return country.getLocalizedNameOf(context) == countryName;
                                });

                                if (!countryNameIsValid)
                                  return AppLocalizations.of(context)!.fieldTypeAutocompleteValidationInvalid;
                              },
                            ),
                          ),
                        ]),
                        SizedBox(height: 20),
                        Row(children: [
                          Expanded(
                            child: TextField(
                              controller: _formPhoneEditingController,
                              hintText: AppLocalizations.of(context)!.fieldPhoneHint,
                              icon: FaIcon(
                                FontAwesomeIcons.solidPhoneAlt,
                                color: Palette.textBlueToLight.shade300,
                                size: 20,
                              ),
                              inputFormatters: [_formPhoneMaskFormatter].whereType<MaskTextInputFormatter>().toList(),
                              keyboardType: TextInputType.number,
                              onChanged: (phoneMaskedText) {
                                _formPhone = _formPhoneMaskFormatter?.unmaskText(phoneMaskedText) ?? _formPhone;
                              },
                              validator: (phoneMaskedText) {
                                if (phoneMaskedText == null) return null;
                                if (phoneMaskedText.isEmpty) return AppLocalizations.of(context)!.fieldTypeTextValidationEmpty;

                                final maskFormatter = _formPhoneMaskFormatter;

                                if (maskFormatter == null) return null;

                                final phoneIsValid = maskFormatter.validate(
                                  phoneMaskedText,
                                  validator: (maskedChar) {
                                    if (maskedChar == '#') return RegExp(r'\d');
                                  },
                                );

                                if (!phoneIsValid) return AppLocalizations.of(context)!.fieldPhoneValidationInvalid;
                              },
                            ),
                          )
                        ]),
                        SizedBox(height: 46),
                        Row(children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Palette.primaryBlueToDark,
                                minimumSize: Size(double.infinity, 45),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              onPressed: () {
                                if (!_formKey.currentState!.validate()) return;

                                final formPhoneMaskFormatter = _formPhoneMaskFormatter;
                                final formPhoneUnmaskedText = _formPhone;

                                if (formPhoneMaskFormatter == null || formPhoneUnmaskedText == null) return;

                                final formPhoneMaskedText = formPhoneMaskFormatter.maskText(formPhoneUnmaskedText);

                                Navigator.of(context).push(ScreenRoute(
                                  widget: LoginConfirmScreen(
                                      phoneNumber: formPhoneUnmaskedText,
                                      phoneDisplayNumber: formPhoneMaskedText
                                  ),
                                  transitionDuration: Animations.screenTransitionDuration,
                                ));
                              },
                              child: Text(
                                AppLocalizations.of(context)!.buttonContinue.toUpperCase(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ]),
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
