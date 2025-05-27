import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/feature/products/domain/entities/add_price_entity.dart';
import 'package:nahlachicken/feature/products/presentation/manager/cubit/add_price_cubit.dart';
import 'package:nahlachicken/feature/products/presentation/views/section/onsale_section.dart';
import 'package:nahlachicken/feature/products/presentation/views/widgets/product_item.dart';

class ShowPrices extends StatelessWidget {
  const ShowPrices({super.key, required this.getPrice});
  final List<AddPriceEntity> getPrice;

  @override
  Widget build(BuildContext context) {
    var onSaleProducts = context.read<AddPriceCubit>().getOnSaleProducts();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "اسعار المنتجات:",
                  style: AppStyles.style18Bold,
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          onSaleProducts.isNotEmpty
              ? OnSaleSection(onSaleProducts: onSaleProducts)
              : SliverToBoxAdapter(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          ),
          ...categories.map((category) {
            List<AddPriceEntity> products = context
                .read<AddPriceCubit>()
                .getProductDependOnCategory(category: category);
            if (products.isEmpty) return SliverToBoxAdapter();
            return SliverToBoxAdapter(
              child: ProductItem(
                products: products,
                getPrice: getPrice,
                category: category,
              ),
            );
          }),
        ],
      ),
    );
  }
}
