import 'package:flutter/services.dart' show TextEditingValue, TextInputFormatter, TextPosition, TextSelection;

class MaskTextInputFormatter extends TextInputFormatter {
  late final List<Mask> _masks;

  MaskTextInputFormatter({
    required List<String> masks,
    required RegExp? Function(String) validator,
  }) : super() {
    _masks = masks.map((mask) => Mask(value: mask, validator: validator)).toList();
  }

  @override
  TextEditingValue formatEditUpdate(oldValue, newValue) {
    final newUnmaskedText = unmaskText(newValue.text);

    if (newUnmaskedText.isEmpty) return oldValue;

    final oldMaskedText = oldValue.text;

    final newMaskedText = maskText(newUnmaskedText);
    final offset = oldValue.selection.baseOffset + (newMaskedText.length - oldMaskedText.length);

    return TextEditingValue(
      text: newMaskedText,
      selection: TextSelection.fromPosition(TextPosition(offset: offset)),
    );
  }

  bool validate(String maskedText, {RegExp? Function(String)? validator}) {
    var mask = _getMaskByText(maskedText, textIsMasked: true);

    if (validator != null) mask = mask.copyWith(validator: validator);

    final pattern = mask.getPattern(strict: true);

    return pattern.hasMatch(maskedText);
  }

  String unmaskText(String text) {
    final mask = _getMaskByText(text, textIsMasked: true);
    final pattern = mask.getPattern();
    final matches = pattern.allMatches(text);

    return matches.fold('', (text, match) {
      return text + List.generate(match.groupCount, match.group).sublist(1).join('');
    });
  }

  String maskText(String text) {
    final mask = _getMaskByText(text);

    var textSubstringStartFrom = 0;
    List<String> maskedTextChars = [];

    for (final char in mask.chars) {
      final substring = text.substring(textSubstringStartFrom);

      if (substring.length == 0) break;

      final charPattern = mask.validator(char);

      if (charPattern != null) {
        final match = charPattern.firstMatch(substring);

        if (match != null) {
          final char = match[0];

          if (char != null) {
            maskedTextChars.add(char);
            textSubstringStartFrom += match.start + 1;
          }
        }
      } else {
        maskedTextChars.add(char);
      }
    }

    return maskedTextChars.join('');
  }

  Mask _getMaskByText(String text, {bool textIsMasked = false}) {
    final masks = _masks;

    final sortedMasks = masks
      ..sort((nextMask, prevMask) {
        return nextMask.value.length.compareTo(prevMask.value.length);
      });

    return sortedMasks.firstWhere((mask) {
      return (textIsMasked ? mask.value.length : mask.maskedCharsCount) >= text.length;
    }, orElse: () => sortedMasks.last);
  }
}

class Mask {
  final String value;
  final RegExp? Function(String) validator;

  Mask({
    required this.value,
    required this.validator,
  });

  List<String> get chars {
    return value.split('');
  }

  int get maskedCharsCount {
    return chars.fold(0, (count, char) {
      final charPattern = validator(char);

      if (charPattern != null) count++;

      return count;
    });
  }

  RegExp getPattern({bool strict = false}) {
    final pattern = chars.map((char) {
      final charPattern = validator(char);

      if (charPattern != null) {
        return "(${charPattern.pattern}${!strict ? '*' : ''})";
      } else {
        final cleanPattern = char.replaceAllMapped(RegExp(r'(\.|\!|\@|\#|\$|\%|\^|\&|\*|\(|\)|\_|\+|\-|\=)'), (match) {
          return '\\${match.group(0)}';
        });

        return cleanPattern + (!strict ? '*' : '');
      }
    }).join('');

    return RegExp("${strict ? '^' : ''}$pattern${strict ? '\$' : ''}");
  }

  Mask copyWith({String? value, RegExp? Function(String)? validator}) {
    return Mask(
      value: value ?? this.value,
      validator: validator ?? this.validator,
    );
  }
}
