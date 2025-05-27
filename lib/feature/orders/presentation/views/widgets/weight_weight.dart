import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nahlachicken/core/models/decial_input_formatter.dart';
import 'package:nahlachicken/core/widgets/custom_text_from_field.dart';

class WeightWidget extends StatelessWidget {
  const WeightWidget({
    super.key,
    required this.numberOfKilo,
    required this.onNumberOfKiloChanged,
    required this.hintText,
    required this.textValidator,
  });

  final TextEditingController numberOfKilo;
  final Function(String? p1)? onNumberOfKiloChanged;
  final String hintText;
  final String textValidator;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      inputFormatters: [
        DecimalTextInputFormatter(),
        LengthLimitingTextInputFormatter(11)
      ],
      controller: numberOfKilo,
      hintText: hintText,
      onChanged: onNumberOfKiloChanged,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return textValidator;
        }
        return null;
      },
      onFieldSubmitted: (value) {
        if (value.isNotEmpty) {}
      },
      textInputType: TextInputType.number,
    );
  }
}
