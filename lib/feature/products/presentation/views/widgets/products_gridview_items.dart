import 'package:flutter/material.dart';
import 'package:nahlachicken/feature/products/domain/entities/add_price_entity.dart';
import 'package:nahlachicken/feature/products/presentation/views/section/product_category_section.dart';

class ProductsGridViewItems extends StatelessWidget {
  const ProductsGridViewItems({
    super.key,
    required this.products,
  });

  final List<AddPriceEntity> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 7 / 12),
      itemBuilder: (context, index) {
        return ProductCategorySection(
          products: products,
          index: index,
        );
      },
    );
  }
}
