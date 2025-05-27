import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nahlachicken/core/models/decial_input_formatter.dart';
import 'package:nahlachicken/core/widgets/custom_text_from_field.dart';

class PriceWithOffer extends StatelessWidget {
  const PriceWithOffer(
      {super.key,
      this.onpriceWithOutOfferChanged,
      required this.priceWithOutOffer,
      required this.priceWithOffer,
      this.onpriceWithOfferChanged});
  final Function(String?)? onpriceWithOutOfferChanged;

  final TextEditingController priceWithOutOffer, priceWithOffer;
  final Function(String?)? onpriceWithOfferChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        Row(
          spacing: 15,
          children: [
            Expanded(
              child: CustomTextFormField(
                inputFormatters: [
                  DecimalTextInputFormatter(),
                  LengthLimitingTextInputFormatter(11)
                ],
                controller: priceWithOutOffer,
                hintText: "السعر قبل الخصم",
                onChanged: onpriceWithOutOfferChanged,
                onFieldSubmitted: (value) {
                  if (value.isNotEmpty) {}
                },
                textInputType: TextInputType.number,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "الرجاء إدخال السعر قبل الخصم";
                  }
                  return null;
                },
              ),
            ),
            Expanded(
              child: CustomTextFormField(
                inputFormatters: [
                  DecimalTextInputFormatter(),
                  LengthLimitingTextInputFormatter(11)
                ],
                controller: priceWithOffer,
                hintText: "السعر بعد الخصم",
                onChanged: onpriceWithOfferChanged,
                onFieldSubmitted: (value) {
                  if (value.isNotEmpty) {}
                },
                textInputType: TextInputType.number,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "الرجاء إدخال السعر بعد الخصم";
                  }

                  if (num.parse(priceWithOffer.text) >=
                      num.parse(priceWithOutOffer.text)) {
                    return "فين الخصم ؟";
                  }

                  return null;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
