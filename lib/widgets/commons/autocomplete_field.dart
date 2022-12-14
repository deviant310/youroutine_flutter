import 'package:flutter/material.dart' as Material
    show
        Align,
        Alignment,
        Autocomplete,
        AutocompleteHighlightedOption,
        BoxConstraints,
        BuildContext,
        Builder,
        Colors,
        ConstrainedBox,
        Container,
        EdgeInsets,
        InkWell,
        Key,
        LayoutBuilder,
        ListView,
        Material,
        RawAutocomplete,
        Scrollable,
        StatelessWidget,
        Theme,
        Widget;
import 'package:flutter/scheduler.dart' show SchedulerBinding;
import 'package:flutter/services.dart' show TextEditingValue, TextInputFormatter, TextInputType;
import 'package:font_awesome_flutter/font_awesome_flutter.dart' show FaIcon;
import 'package:youroutine/widgets/commons/text_field.dart' show TextField;

class AutocompleteField<T extends Object> extends Material.StatelessWidget {
  const AutocompleteField({
    Material.Key? key,
    this.displayStringForOption = Material.RawAutocomplete.defaultStringForOption,
    this.hintText,
    this.icon,
    this.initialValue,
    this.inputFormatters,
    this.keyboardType,
    this.onSelected,
    required this.optionsBuilder,
    required this.optionViewBuilder,
    this.validator,
  }) : super(key: key);

  final String Function(T) displayStringForOption;
  final String? hintText;
  final FaIcon? icon;
  final TextEditingValue? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final void Function(T)? onSelected;
  final Iterable<T> Function(TextEditingValue) optionsBuilder;
  final Material.Widget Function(T) optionViewBuilder;
  final String? Function(String?)? validator;

  @override
  Material.Widget build(Material.BuildContext context) {
    return Material.LayoutBuilder(builder: (context, constraints) {
      return Material.Autocomplete<T>(
        displayStringForOption: displayStringForOption,
        fieldViewBuilder: (context, controller, focusNode, callback) {
          return TextField(
            controller: controller,
            focusNode: focusNode,
            hintText: hintText,
            icon: icon,
            inputFormatters: inputFormatters,
            validator: validator,
          );
        },
        initialValue: initialValue,
        onSelected: onSelected,
        optionsBuilder: optionsBuilder,
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
                    final T option = options.elementAt(index);

                    return Material.InkWell(
                      onTap: () {
                        onSelected(option);
                      },
                      child: Material.Builder(builder: (Material.BuildContext context) {
                        final bool highlight = Material.AutocompleteHighlightedOption.of(context) == index;
                        final Material.Widget optionView = optionViewBuilder(option);

                        if (highlight) {
                          SchedulerBinding.instance!.addPostFrameCallback((Duration timeStamp) {
                            Material.Scrollable.ensureVisible(context, alignment: 0.5);
                          });
                        }

                        return Material.Container(
                          color: highlight ? Material.Theme.of(context).focusColor : null,
                          padding: const Material.EdgeInsets.all(16.0),
                          child: optionView,
                        );
                      }),
                    );
                  },
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
