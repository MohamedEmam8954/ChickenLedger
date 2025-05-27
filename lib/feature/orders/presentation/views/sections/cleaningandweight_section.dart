import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nahlachicken/core/models/decial_input_formatter.dart';
import 'package:nahlachicken/core/widgets/custom_text_from_field.dart';
import 'package:nahlachicken/feature/orders/presentation/views/widgets/weight_weight.dart';

class CleaningAndWeightSection extends StatelessWidget {
  const CleaningAndWeightSection(
      {super.key,
      this.onNumberOfKiloChanged,
      this.onCleaningChanged,
      required this.numberOfKilo,
      required this.cleaning,
      this.onnumberOfChickenChanged,
      required this.numberOfChicken});

  final Function(String?)? onNumberOfKiloChanged,
      onCleaningChanged,
      onnumberOfChickenChanged;

  final TextEditingController numberOfKilo, cleaning, numberOfChicken;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        Expanded(
          flex: 1,
          child: WeightWidget(
            hintText: "الكميه",
            textValidator: "الرجاء ادخال الكميه",
            numberOfKilo: numberOfChicken,
            onNumberOfKiloChanged: onnumberOfChickenChanged,
          ),
        ),
        Expanded(
          flex: 1,
          child: WeightWidget(
              hintText: "الوزن",
              textValidator: "الرجاء ادخال الوزن",
              numberOfKilo: numberOfKilo,
              onNumberOfKiloChanged: onNumberOfKiloChanged),
        ),
        Expanded(
          flex: 1,
          child: CustomTextFormField(
            inputFormatters: [
              DecimalTextInputFormatter(),
              LengthLimitingTextInputFormatter(11)
            ],
            controller: cleaning,
            hintText: "تنضيف",
            onChanged: onCleaningChanged,
            onFieldSubmitted: (value) {
              if (value.isNotEmpty) {}
            },
            textInputType: TextInputType.number,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return "الرجاء ادخال سعر التنظيف";
              }
              return null;
            },
          ),
        )
      ],
    );
  }
}
