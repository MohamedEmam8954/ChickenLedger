import 'package:flutter/material.dart';

import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/core/widgets/custom_dropdown_textfield.dart';
import 'package:nahlachicken/core/widgets/custom_text_from_field.dart';

class ProductSection extends StatelessWidget {
  const ProductSection(
      {super.key,
      required this.category,
      this.onCategoryChanged,
      this.onTypeChanged,
      required this.typeController,
      this.categoryFocusNode});
  final String category;
  final Function(String?)? onCategoryChanged, onTypeChanged;

  final TextEditingController typeController;
  final FocusNode? categoryFocusNode;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        CustomDropDownFormField(
          focusNode: categoryFocusNode,
          hintText: 'ادخل الصنف',
          items: categories
              .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: AppStyles.style16Bold.copyWith(color: Colors.black),
                  )))
              .toList(),
          onChanged: onCategoryChanged,
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'الرجاء اختيار الصنف';
            }
            return null;
          },
        ),
        category == "اخري"
            ? CustomTextFormField(
                controller: typeController,
                textInputType: TextInputType.text,
                hintText: "اسم المنتج",
                onChanged: (value) {},
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "الرجاء إدخال اسم المنتج";
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  if (value.isNotEmpty) {}
                },
              )
            : CustomDropDownFormField(
                hintText: 'ادخل النوع',
                value: typeController.text.isNotEmpty &&
                        (type[category]?.contains(typeController.text) ?? false)
                    ? typeController.text
                    : null,
                items: category.isNotEmpty
                    ? type[category]!
                        .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: AppStyles.style16Bold
                                  .copyWith(color: Colors.black),
                            )))
                        .toList()
                    : [],
                onChanged: onTypeChanged,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'الرجاء اختيار النوع';
                  }
                  return null;
                },
              ),
      ],
    );
  }
}
