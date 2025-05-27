import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/show_tostification.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/core/widgets/price_text_field.dart';
import 'package:nahlachicken/feature/products/domain/entities/add_price_entity.dart';
import 'package:nahlachicken/feature/products/presentation/manager/cubit/add_price_cubit.dart';

class CustomPricesItem extends StatefulWidget {
  const CustomPricesItem({
    super.key,
    required this.addPriceEntity,
  });

  final AddPriceEntity addPriceEntity;

  @override
  State<CustomPricesItem> createState() => _CustomPricesItemState();
}

class _CustomPricesItemState extends State<CustomPricesItem> {
  late TextEditingController priceController;
  @override
  void initState() {
    priceController = TextEditingController(
        text: widget.addPriceEntity.priceWithOutDiscount.toString());
    super.initState();
  }

  @override
  void dispose() {
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Column(
        children: [
          widget.addPriceEntity.category != "اخري"
              ? ClipRRect(
                  child: AspectRatio(
                    aspectRatio: 50 / 45,
                    child: Image.asset(
                      productsImage[widget.addPriceEntity.type]!,
                    ),
                  ),
                )
              : SizedBox(),
          Text(
            widget.addPriceEntity.type,
            style: AppStyles.style16Bold.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 5,
            children: [
              Text(
                "الكيلو",
                style: AppStyles.style16Bold.copyWith(
                  color: Colors.white.withValues(alpha: 0.5),
                ),
              ),
              PriceTextField(
                priceEditingController: priceController,
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    priceController.text = value;
                    context.read<AddPriceCubit>().updatePrice(
                        category: "فراخ",
                        price: num.parse(value),
                        id: widget.addPriceEntity.productId);
                    showTostification(context, "تم تعديل المنتج بنجاح",
                        Colors.green, Icons.check);
                  }
                },
              ),
              Text(
                "جنيه",
                style: AppStyles.style16Bold.copyWith(
                  color: Colors.white.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
