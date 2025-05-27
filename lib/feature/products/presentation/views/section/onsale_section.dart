import 'package:flutter/material.dart';
import 'package:nahlachicken/feature/products/domain/entities/add_price_entity.dart';
import 'package:nahlachicken/feature/products/presentation/views/widgets/custom_onsale_text.dart';
import 'package:nahlachicken/feature/products/presentation/views/widgets/onsale_list_items.dart';

class OnSaleSection extends StatelessWidget {
  const OnSaleSection({
    super.key,
    required this.onSaleProducts,
  });

  final List<AddPriceEntity> onSaleProducts;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        spacing: 5,
        children: [
          CustomOnSaleText(),
          OnSaleListItems(onSaleProducts: onSaleProducts)
        ],
      ),
    );
  }
}
