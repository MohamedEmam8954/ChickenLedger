import 'package:flutter/material.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/feature/products/domain/entities/add_price_entity.dart';
import 'package:nahlachicken/feature/products/presentation/views/widgets/products_gridview_items.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.products,
    required this.getPrice,
    required this.category,
  });

  final List<AddPriceEntity> products;
  final List<AddPriceEntity> getPrice;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 15,
      children: [
        Text(
          "$category:",
          style: AppStyles.style16Bold,
        ),
        ProductsGridViewItems(
          products: products,
        )
      ],
    );
  }
}
