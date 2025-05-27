import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:nahlachicken/core/widgets/custom_text_from_field.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/deliveryOrder/cubit/delivery_order_cubit.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliveryorder/search_delivery_order_blocbuilder.dart';

class DeliveriesOrdersSection extends StatelessWidget {
  const DeliveriesOrdersSection({
    super.key,
    required this.deliveryName,
  });
  final String deliveryName;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        CustomTextFormField(
          hintText: "البحث عن طلب",
          suffixIcon: IconlyLight.search,
          onChanged: (value) {
            context.read<DeliveryOrderCubit>().searchOrder(value);
          },
        ),
        Expanded(
          child: SearchDeliveryOrderBlocBuilder(
            deliveryName: deliveryName,
          ),
        ),
      ],
    );
  }
}
