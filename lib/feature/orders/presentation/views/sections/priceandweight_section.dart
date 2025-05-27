import 'package:flutter/material.dart';

import 'package:nahlachicken/feature/orders/presentation/views/widgets/weight_weight.dart';

class PriceAndWeightSection extends StatelessWidget {
  const PriceAndWeightSection(
      {super.key,
      this.onNumberOfKiloChanged,
      required this.numberOfKilo,
      this.onpriceWithOutOfferChanged,
      required this.priceWithOutOffer});
  final Function(String?)? onNumberOfKiloChanged;

  final TextEditingController numberOfKilo;
  final Function(String?)? onpriceWithOutOfferChanged;

  final TextEditingController priceWithOutOffer;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15,
      children: [
        Expanded(
          flex: 1,
          child: WeightWidget(
            numberOfKilo: numberOfKilo,
            onNumberOfKiloChanged: onNumberOfKiloChanged,
            hintText: "كام كيلو",
            textValidator: "الرجاء ادخال الوزن",
          ),
        ),
      ],
    );
  }
}
