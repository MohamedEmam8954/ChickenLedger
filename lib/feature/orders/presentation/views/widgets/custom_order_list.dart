import 'package:flutter/material.dart';
import 'package:nahlachicken/feature/orders/presentation/views/widgets/search_bloc_builder.dart';
import 'package:nahlachicken/feature/orders/presentation/views/widgets/search_order.dart';

class CustomOrdersList extends StatelessWidget {
  const CustomOrdersList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 5),
                SearchOrder(),
              ],
            ),
          ),
          SearchBlocBuilder(),
        ],
      ),
    );
  }
}
