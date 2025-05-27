import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:nahlachicken/core/widgets/custom_text_from_field.dart';
import 'package:nahlachicken/core/widgets/total_order_delivery.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/deliveryentity/delivery_entity.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/showdeliveryorder/cubit/show_delivery_order_cubit.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/showdeliverywidget/search_delivery_order_blocbuilder.dart';

class SearchAndShowDeliveryOrdersList extends StatelessWidget {
  const SearchAndShowDeliveryOrdersList({
    super.key,
    required this.deliveryEntity,
  });

  final DeliveryEntity deliveryEntity;

  @override
  Widget build(BuildContext context) {
    var showOrdersCubit = context.read<ShowDeliveryOrderCubit>();
    num total =
        showOrdersCubit.calcTotalPriceDependOnStatus(deliveryEntity.orders);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 15,
        children: [
          CustomTextFormField(
            hintText: "البحث عن طلب",
            suffixIcon: IconlyLight.search,
            onChanged: (value) {
              showOrdersCubit.searchOrder(deliveryEntity.deliveryid, value);
            },
          ),
          SearchShowDeliveryOrderBlocBuilder(deliveryEntity: deliveryEntity),
          TotalOrderDelivery(totalPrice: total),
        ],
      ),
    );
  }
}
