import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/core/function/navgaition.dart';
import 'package:nahlachicken/core/function/show_delete_all_dialog.dart';
import 'package:nahlachicken/core/function/show_tostification.dart';
import 'package:nahlachicken/core/widgets/custom_bottom.dart';
import 'package:nahlachicken/core/widgets/custom_loading.dart';

import 'package:nahlachicken/feature/orders/presentation/manager/addorder/add_order_cubit.dart';
import 'package:nahlachicken/feature/orders/presentation/views/sections/cleaningandweight_section.dart';
import 'package:nahlachicken/feature/orders/presentation/views/sections/delivery_section.dart';
import 'package:nahlachicken/feature/orders/presentation/views/sections/priceandweight_section.dart';
import 'package:nahlachicken/feature/orders/presentation/views/widgets/price_widget.dart';
import 'package:nahlachicken/feature/orders/presentation/views/widgets/product_section.dart';
import 'package:uuid/uuid.dart';

class AddOrderBody extends StatefulWidget {
  const AddOrderBody({super.key});

  @override
  State<AddOrderBody> createState() => _AddOrderBodyState();
}

class _AddOrderBodyState extends State<AddOrderBody> {
  TextEditingController takeAway = TextEditingController(text: "دليفري");

  TextEditingController phoneNumber = TextEditingController();

  TextEditingController categoryController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController isOnSaleController =
      TextEditingController(text: "بدون خصم");
  TextEditingController numberOfKilo = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController orderId = TextEditingController();
  bool isOnSale = false;
  TextEditingController cleaningPrice = TextEditingController();
  TextEditingController numberOfChicken = TextEditingController();
  TextEditingController updateOrderId = TextEditingController();

  var globalKey = GlobalKey<FormState>();
  var autoValidateMode = AutovalidateMode.disabled;

  bool isGenrateid = false;

  @override
  void dispose() {
    takeAway.dispose();

    phoneNumber.dispose();

    categoryController.dispose();
    typeController.dispose();
    isOnSaleController.dispose();
    numberOfKilo.dispose();
    price.dispose();

    cleaningPrice.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16),
        child: Form(
          key: globalKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            spacing: 15,
            children: [
              SizedBox(
                height: 5,
              ),
              //! delivery Section
              DeliverySection(
                onOrderIdChanged: (value) {
                  if (value?.isEmpty ?? true) return;
                  updateOrderId.text = value!;
                  setState(() {});
                },
                orderIdController: updateOrderId,
                takeAway: takeAway.text,
                phoneNumberController: phoneNumber,
                onPhoneNumberChanged: (value) {
                  if (value?.isEmpty ?? true) return;
                  phoneNumber.text = value!;

                  setState(() {});
                },
                onTakeAwayChanged: (value) {
                  takeAway.text = value!;
                  setState(() {});
                },
              ),
              //! product section
              ProductSection(
                category: categoryController.text,
                typeController: typeController,
                onTypeChanged: (value) {
                  if (value == null) return;
                  typeController.text = value;
                  setState(() {});
                },
                onCategoryChanged: (value) {
                  if (value == null) return;
                  categoryController.text = value;
                  typeController.clear();
                  setState(() {});
                },
              ),
              //! on Sale Section
              // IsOnSaleSection(
              //   onSale: isOnSaleController.text,
              //   onSaleChanged: (value) {
              //     if (value == null) return;
              //     isOnSaleController.text = value;
              //     isOnSale = value == "خصم";
              //     setState(() {});
              //   },
              // ),

              (categoryController.text == "فراخ" ||
                      categoryController.text == "بط" ||
                      categoryController.text == "اخري")
                  ? CleaningAndWeightSection(
                      onnumberOfChickenChanged: (value) {
                        if (value?.isEmpty ?? true) return true;
                        numberOfChicken.text = value!;
                      },
                      numberOfChicken: numberOfChicken,
                      numberOfKilo: numberOfKilo,
                      cleaning: cleaningPrice,
                      onCleaningChanged: (value) {
                        if (value?.isEmpty ?? true) return;
                        cleaningPrice.text = value!;
                        setState(() {});
                      },
                      onNumberOfKiloChanged: (value) {
                        if (value?.isEmpty ?? true) return;
                        numberOfKilo.text = value!;
                        setState(() {});
                      },
                    )
                  : PriceAndWeightSection(
                      numberOfKilo: numberOfKilo,
                      priceWithOutOffer: price,
                      onNumberOfKiloChanged: (value) {
                        if (value?.isEmpty ?? true) return;
                        numberOfKilo.text = value!;
                        setState(() {});
                      },
                      onpriceWithOutOfferChanged: (value) {
                        price.text == value;
                        setState(() {});
                      },
                    ),
              // isOnSale
              //     ? PriceWithOffer(
              //         priceWithOutOffer: priceWithOutOffer,
              //         priceWithOffer: priceWithOffer,
              //         onpriceWithOfferChanged: (value) {
              //           if (value?.isEmpty ?? true) return;
              //           priceWithOffer.text = value!;
              //           setState(() {});
              //         },
              //         onpriceWithOutOfferChanged: (value) {
              //           if (value?.isEmpty ?? true) return;
              //           priceWithOutOffer.text = value!;
              //           setState(() {});
              //         },
              //       )
              //     :
              PriceWidget(
                priceWithOutOffer: price,
                onpriceWithOutOfferChanged: (value) {
                  price.text = value!;
                  setState(() {});
                },
              ),
              BlocConsumer<AddOrderCubit, AddOrderState>(
                listener: (context, state) {
                  if (state is AddOrderFailure) {
                    showTostification(context, state.errorMessage, Colors.red,
                        Icons.error_outline);
                  }
                  if (state is AddOrderSucess) {
                    showTostification(context, "تمت ااضافه المنتج بنجاح",
                        Colors.green, Icons.check_circle_outline);
                  }
                },
                builder: (context, state) {
                  return state is AddOrderLoading
                      ? Loading(
                          size: 25,
                        )
                      : CustomButtom(
                          onTap: () {
                            if (globalKey.currentState!.validate()) {
                              if (!isGenrateid &&
                                  orderId.text.isEmpty &&
                                  updateOrderId.text.isEmpty) {
                                orderId.text = phoneNumber.text.isEmpty
                                    ? generateId()
                                    : generateId(phoneNumber.text);
                                isGenrateid = true;
                              }
                              addOrder(context);
                              buildDialog(
                                barrierDismissible: false,
                                textFalseColor: Colors.green,
                                textFalse: "اوردر جديد",
                                context: context,
                                title: "هل تريد اضافه منتج علي هذا الاوردر",
                                onTapTrue: () {
                                  categoryController.clear();
                                  typeController.clear();
                                  isOnSaleController.text = "بدون خصم";
                                  numberOfKilo.clear();
                                  price.clear();

                                  cleaningPrice.clear();
                                  numberOfChicken.clear();
                                  isOnSale = false;
                                  setState(() {});
                                  popFromScreen(context);
                                },
                                textTrue: "نعم ,اريد",
                                onTapFalse: () {
                                  isGenrateid = false;
                                  clearAllControllers();
                                  setState(() {});
                                  popFromScreen(context);
                                },
                              );
                            } else {
                              autoValidateMode = AutovalidateMode.always;
                              setState(() {});
                            }
                          },
                          title: "اضافه الاوردر");
                },
              ),

              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addOrder(BuildContext context) {
    context.read<AddOrderCubit>().addOrder(
          phoneNumber: phoneNumber.text.isEmpty ? "" : phoneNumber.text,
          quantity: numberOfChicken.text.isEmpty ? "" : numberOfChicken.text,
          orderId:
              updateOrderId.text.isNotEmpty ? updateOrderId.text : orderId.text,
          isDelivery: takeAway.text == "دليفري" ? true : false,
          isOnsale: isOnSale,
          isFreeDelivery: false,
          category: categoryController.text,
          type: typeController.text,
          cleaningPrice:
              cleaningPrice.text.isEmpty ? 0.0 : num.parse(cleaningPrice.text),
          priceWithDiscount: 0.0,
          priceWithoutDiscount: num.parse(price.text),
          numberOfKilo: num.parse(numberOfKilo.text),
          totalPrice: totalPrice(
              num.parse(numberOfKilo.text),
              num.parse(price.text),
              cleaningPrice.text.isEmpty ? 0 : num.parse(cleaningPrice.text),
              numberOfChicken.text.isEmpty
                  ? 0
                  : num.parse(numberOfChicken.text)),
        );
  }

  void clearAllControllers() {
    takeAway.text = "دليفري";
    orderId.clear();
    phoneNumber.clear();
    categoryController.clear();
    typeController.clear();
    isOnSaleController.text = "بدون خصم";
    numberOfKilo.clear();
    price.clear();
    cleaningPrice.clear();
    numberOfChicken.clear();
    isOnSale = false;
  }
}

num totalPrice(num numberofKilo, num price, num cleaingPrice, num quantity) {
  return (numberofKilo * price) + (cleaingPrice * quantity);
}

String generateId([String? phoneNumber]) {
  var id = Uuid().v4();
  String lastId = phoneNumber == null
      ? "ord#${id.substring(0, 8)}"
      : "ord#${id.substring(0, 5)}${phoneNumber.substring(7)}";
  return lastId;
}
