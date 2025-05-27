import 'package:flutter/material.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliverywidget/delivery_search.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliverywidget/delivery_search_bloc_builder.dart';

class SearchAndDeliveryList extends StatelessWidget {
  const SearchAndDeliveryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              DeliverySearch(),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        DeliverySearchBlocBuilder(),
      ],
    );
  }
}
