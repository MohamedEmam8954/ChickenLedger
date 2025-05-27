import 'package:flutter/material.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/feature/products/domain/entities/add_price_entity.dart';
import 'package:nahlachicken/feature/products/presentation/views/widgets/custom_delete_product_bottom.dart';

class OnSaleItem extends StatelessWidget {
  const OnSaleItem({super.key, required this.addPriceEntity});
  final AddPriceEntity addPriceEntity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
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
                addPriceEntity.category != "اخري"
                    ? SizedBox(
                        height: 60,
                        child: Image.asset(
                          productsImage[addPriceEntity.type]!,
                        ),
                      )
                    : SizedBox(),
                Text(
                  addPriceEntity.type,
                  style: AppStyles.style16Bold.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 5),
                Text(
                  "${addPriceEntity.numberOfKilo} كيلو او اكتر",
                  style: AppStyles.style16Bold.copyWith(
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Flexible(
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Text(
                          "${addPriceEntity.priceWithDiscount} ج",
                          style: AppStyles.style16Bold.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "بدلا من",
                      style: AppStyles.style16Bold.copyWith(
                        color: Colors.white.withValues(alpha: 0.5),
                      ),
                    ),
                    Flexible(
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Text(
                          "${addPriceEntity.priceWithOutDiscount} ج",
                          style: AppStyles.style16Bold.copyWith(
                            color: Colors.white.withValues(alpha: 0.5),
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.red,
                            decorationThickness: 2.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          CustomDeleteProductBottom(
            productId: addPriceEntity.productId,
          ),
        ],
      ),
    );
  }
}
