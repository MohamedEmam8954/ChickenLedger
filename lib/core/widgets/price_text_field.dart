import 'package:flutter/material.dart';

class PriceTextField extends StatelessWidget {
  const PriceTextField(
      {super.key,
      required this.onSubmitted,
      required this.priceEditingController});

  final TextEditingController priceEditingController;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      child: TextField(
        textAlign: TextAlign.center,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        cursorColor: Colors.orange,
        controller: priceEditingController,
        keyboardType: TextInputType.number,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
          ),
        ),
      ),
    );
  }
}
