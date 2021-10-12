import 'package:flutter/material.dart' as Material;
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart' as FontAwesome;
import 'package:youroutine/styles/palette.dart' as Palette;

class TextField extends Material.StatelessWidget {
  const TextField({
    Material.Key? key,
    this.controller,
    this.focusNode,
    this.hintText,
    this.icon,
    this.inputFormatters,
    this.keyboardType,
    this.validator,
  }) : super(key: key);

  final Material.TextEditingController? controller;
  final Material.FocusNode? focusNode;
  final String? hintText;
  final FontAwesome.FaIcon? icon;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
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
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      style: Material.TextStyle(
        color: Palette.textBlueToLight,
        fontSize: 14,
        fontWeight: Material.FontWeight.w500,
      ),
      validator: validator,
    );
  }
}
