import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/show_tostification.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/core/widgets/custom_bottom.dart';
import 'package:nahlachicken/core/widgets/custom_dropdown_textfield.dart';
import 'package:nahlachicken/core/widgets/custom_loading.dart';
import 'package:nahlachicken/core/widgets/custom_text_from_field.dart';
import 'package:nahlachicken/feature/products/presentation/manager/cubit/add_price_cubit.dart';

class AddPriceBody extends StatefulWidget {
  const AddPriceBody({super.key});

  @override
  State<AddPriceBody> createState() => _AddPriceBodyState();
}

class _AddPriceBodyState extends State<AddPriceBody> {
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();
  final FocusNode _focusNode5 = FocusNode();

  var globalKey = GlobalKey<FormState>();
  var autoValidateMode = AutovalidateMode.disabled;
  final TextEditingController _categoryController =
      TextEditingController(text: "");
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _priceWithOutOffer = TextEditingController();
  final TextEditingController _priceWithOffer = TextEditingController();
  final TextEditingController _numberOfKilo = TextEditingController(text: "1");
  bool isOnSale = false;
  final TextEditingController _isOnSale =
      TextEditingController(text: "بدون خصم");

  String selectedOffer = "Nooffer";
  @override
  void dispose() {
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
    _focusNode5.dispose();
    _categoryController.dispose();
    _typeController.dispose();
    _isOnSale.dispose();
    _numberOfKilo.dispose();
    _priceWithOutOffer.dispose();
    _priceWithOffer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var addPriceCubit = context.read<AddPriceCubit>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: globalKey,
          autovalidateMode: autoValidateMode,
          child: SingleChildScrollView(
            child: Column(
              spacing: 15,
              children: [
                SizedBox(
                  height: 5,
                ),
                CustomDropDownFormField(
                  hintText: 'ادخل الصنف',
                  items: categories
                      .map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: AppStyles.style16Bold
                                .copyWith(color: Colors.black),
                          )))
                      .toList(),
                  onChanged: (value) {
                    if (value == null) return;
                    _categoryController.text = value;
                    _typeController.clear();
                    setState(() {});
                  },
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'الرجاء اختيار الصنف';
                    }
                    return null;
                  },
                ),
                _categoryController.text == "اخري"
                    ? CustomTextFormField(
                        controller: _typeController,
                        focusNode: _focusNode1,
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
                          if (value.isNotEmpty) {
                            _focusNode2.requestFocus();
                          }
                        },
                      )
                    : CustomDropDownFormField(
                        hintText: 'ادخل النوع',
                        value: _typeController.text.isNotEmpty &&
                                (type[_categoryController.text]
                                        ?.contains(_typeController.text) ??
                                    false)
                            ? _typeController.text
                            : null,
                        items: _categoryController.text.isNotEmpty
                            ? type[_categoryController.text]!
                                .map((item) => DropdownMenuItem(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: AppStyles.style16Bold
                                          .copyWith(color: Colors.black),
                                    )))
                                .toList()
                            : [],
                        onChanged: (value) {
                          if (value == null) return;
                          _typeController.text = value;
                          setState(() {});
                        },
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'الرجاء اختيار النوع';
                          }
                          return null;
                        },
                      ),
                CustomDropDownFormField(
                  value: _isOnSale.text.isNotEmpty ? _isOnSale.text : null,
                  items: [
                    DropdownMenuItem(
                      value: "خصم",
                      child: Text(
                        "خصم",
                        style:
                            AppStyles.style16Bold.copyWith(color: Colors.black),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "بدون خصم",
                      child: Text(
                        "بدون خصم",
                        style:
                            AppStyles.style16Bold.copyWith(color: Colors.black),
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    if (value == null) return;
                    _isOnSale.text = value;
                    isOnSale = value == "خصم";
                    setState(() {});
                  },
                ),
                isOnSale
                    ? Column(
                        children: [
                          CustomTextFormField(
                            controller: _numberOfKilo,
                            hintText: "عدد الكيلو",
                            focusNode: _focusNode2,
                            onChanged: (value) {},
                            onFieldSubmitted: (value) {
                              if (value.isNotEmpty) {
                                _focusNode3.requestFocus();
                              }
                            },
                            textInputType: TextInputType.number,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            spacing: 15,
                            children: [
                              Expanded(
                                child: CustomTextFormField(
                                  focusNode: _focusNode3,
                                  controller: _priceWithOutOffer,
                                  hintText: "السعر قبل الخصم",
                                  onChanged: (value) {
                                    _priceWithOutOffer.text = value;
                                    setState(() {});
                                  },
                                  onFieldSubmitted: (value) {
                                    if (value.isNotEmpty) {
                                      _focusNode4.requestFocus();
                                    }
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
                                  focusNode: _focusNode4,
                                  controller: _priceWithOffer,
                                  hintText: "السعر بعد الخصم",
                                  onChanged: (value) {
                                    _priceWithOffer.text = value;
                                    setState(() {});
                                  },
                                  onFieldSubmitted: (value) {
                                    if (value.isNotEmpty) {
                                      _focusNode4.unfocus();
                                    }
                                  },
                                  textInputType: TextInputType.number,
                                  validator: (value) {
                                    if (value?.isEmpty ?? true) {
                                      return "الرجاء إدخال السعر بعد الخصم";
                                    }

                                    if (_priceWithOutOffer.text.isEmpty) {
                                      return null;
                                    }

                                    try {
                                      final priceAfter =
                                          num.parse(_priceWithOffer.text);
                                      final priceBefore =
                                          num.parse(_priceWithOutOffer.text);

                                      if (priceAfter >= priceBefore) {
                                        return "فين الخصم ؟";
                                      }
                                    } catch (e) {
                                      return "الرجاء إدخال قيم رقمية صحيحة";
                                    }

                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : CustomTextFormField(
                        controller: _priceWithOutOffer,
                        focusNode: _focusNode2,
                        hintText: "السعر",
                        onChanged: (value) {
                          _priceWithOutOffer.text == value;
                        },
                        onFieldSubmitted: (value) {
                          if (value.isNotEmpty) {
                            _focusNode2.unfocus();
                          }
                        },
                        textInputType: TextInputType.number,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "الرجاء إدخال السعر";
                          }
                          return null;
                        },
                      ),
                BlocConsumer<AddPriceCubit, AddPriceState>(
                  listener: (context, state) {
                    if (state is AddPriceFailure) {
                      showTostification(context, state.error, Colors.red,
                          Icons.error_outline);
                    }
                    if (state is AddPriceSucess) {
                      showTostification(context, "تمت الإضافة بنجاح",
                          Colors.green, Icons.check_circle_outline);
                    }
                  },
                  builder: (context, state) {
                    return state is AddPriceloading
                        ? Loading(
                            size: 25,
                          )
                        : CustomButtom(
                            title: "إضافة",
                            onTap: () {
                              if (globalKey.currentState!.validate()) {
                                addPrice(addPriceCubit);
                                clearController();
                                setState(() {});
                              } else {
                                setState(() {
                                  autoValidateMode = AutovalidateMode.always;
                                });
                              }
                            },
                          );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void clearController() {
    _categoryController.clear();
    _typeController.clear();
    _priceWithOutOffer.clear();
    _numberOfKilo.text = "1";
    _isOnSale.text = "بدون خصم";
    isOnSale = false;
  }

  void addPrice(AddPriceCubit addPriceCubit) {
    addPriceCubit.addPrice(
      type: _typeController.text,
      price: num.parse(_priceWithOutOffer.text),
      category: _categoryController.text,
      isOnSale: isOnSale,
      numberOfKilo: _numberOfKilo.text,
      priceWithDiscount: _priceWithOffer.text.isEmpty
          ? num.parse("0.0")
          : num.parse(_priceWithOffer.text),
    );
  }
}
