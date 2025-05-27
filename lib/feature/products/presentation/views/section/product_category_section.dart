import 'package:flutter/material.dart';
import 'package:nahlachicken/feature/products/domain/entities/add_price_entity.dart';
import 'package:nahlachicken/feature/products/presentation/views/widgets/custom_delete_product_bottom.dart';
import 'package:nahlachicken/feature/products/presentation/views/widgets/custom_prices_item.dart';

class ProductCategorySection extends StatelessWidget {
  const ProductCategorySection(
      {super.key, required this.products, required this.index});

  final List<AddPriceEntity> products;

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPricesItem(
          addPriceEntity: products[index],
        ),
        CustomDeleteProductBottom(
          productId: products[index].productId,
        )
      ],
    );
  }
}
