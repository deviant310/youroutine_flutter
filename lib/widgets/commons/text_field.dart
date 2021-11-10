import 'package:flutter/material.dart' as Material
    show
        BorderSide,
        BuildContext,
        FocusNode,
        FontWeight,
        InputDecoration,
        Key,
        StatelessWidget,
        TextEditingController,
        TextFormField,
        TextStyle,
        Theme,
        UnderlineInputBorder,
        Widget;
import 'package:flutter/services.dart' show TextInputFormatter, TextInputType;
import 'package:font_awesome_flutter/font_awesome_flutter.dart' show FaIcon;
import 'package:youroutine/styles/palette.dart' show Palette;

class TextField extends Material.StatelessWidget {
  const TextField({
    Material.Key? key,
    this.controller,
    this.focusNode,
    this.hintText,
    this.icon,
    this.initialValue,
    this.inputFormatters,
    this.keyboardType,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  final Material.TextEditingController? controller;
  final Material.FocusNode? focusNode;
  final String? hintText;
  final FaIcon? icon;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Material.Widget build(Material.BuildContext context) {
    return Material.TextFormField(
      controller: controller,
      cursorColor: Palette.textBlueToLight,
      decoration: Material.InputDecoration(
        enabledBorder: Material.UnderlineInputBorder(
          borderSide: Material.BorderSide(
            color: Palette.primaryBlueToLight.shade800,
          ),
        ),
        focusedBorder: Material.UnderlineInputBorder(
          borderSide: Material.BorderSide(
            color: Palette.primaryBlueToLight.shade700,
          ),
        ),
        focusedErrorBorder: Material.UnderlineInputBorder(
          borderSide: Material.BorderSide(
            color: Material.Theme.of(context).colorScheme.error,
            width: 1,
          ),
        ),
        hintStyle: Material.TextStyle(
          color: Palette.textBlueToLight.shade600,
        ),
        hintText: hintText,
        icon: icon,
      ),
      focusNode: focusNode,
      initialValue: initialValue,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      onChanged: onChanged,
      style: Material.TextStyle(
        color: Palette.textBlueToLight,
        fontSize: 14,
        fontWeight: Material.FontWeight.w500,
      ),
      validator: validator,
    );
  }
}
