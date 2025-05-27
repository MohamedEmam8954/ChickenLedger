import 'package:flutter/material.dart';
import 'package:nahlachicken/feature/products/domain/entities/add_price_entity.dart';
import 'package:nahlachicken/feature/products/presentation/views/widgets/onsale_item.dart';

class OnSaleListItems extends StatelessWidget {
  const OnSaleListItems({
    super.key,
    required this.onSaleProducts,
  });

  final List<AddPriceEntity> onSaleProducts;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          spacing: 15,
          children: List.generate(
            onSaleProducts.length,
            (index) {
              return OnSaleItem(
                addPriceEntity: onSaleProducts[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
