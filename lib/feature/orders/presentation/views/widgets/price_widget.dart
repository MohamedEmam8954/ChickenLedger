import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nahlachicken/core/models/decial_input_formatter.dart';
import 'package:nahlachicken/core/widgets/custom_text_from_field.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    super.key,
    this.onpriceWithOutOfferChanged,
    required this.priceWithOutOffer,
  });
  final Function(String?)? onpriceWithOutOfferChanged;

  final TextEditingController priceWithOutOffer;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      inputFormatters: [
        DecimalTextInputFormatter(),
        LengthLimitingTextInputFormatter(11)
      ],
      controller: priceWithOutOffer,
      hintText: "سعر المنتج",
      onChanged: onpriceWithOutOfferChanged,
      onFieldSubmitted: (value) {
        if (value.isNotEmpty) {}
      },
      textInputType: TextInputType.number,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "الرجاء إدخال السعر";
        }
        return null;
      },
    );
  }
}
