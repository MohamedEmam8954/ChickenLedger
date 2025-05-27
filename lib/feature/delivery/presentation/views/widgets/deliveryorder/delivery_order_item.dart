import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/show_tostification.dart';
import 'package:nahlachicken/feature/delivery/data/model/assign_delivery_model.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/cubit/delivery_cubit.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliveryorder/delivery_order_item_body.dart';
import 'package:nahlachicken/feature/orders/presentation/domain/entity/add_order_entity.dart';

class DeliveryOrdersItem extends StatelessWidget {
  const DeliveryOrdersItem({
    super.key,
    required this.products,
  });

  final List<AddOrderEntity> products;

  @override
  Widget build(BuildContext context) {
    final AddOrderEntity order = products[0];

    AssignDeliveryModel assignDeliveryModel = assignDeliveryOrder(order);
    num totalPrice = calcTotalPrice();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
      child: BlocBuilder<DeliveryCubit, DeliveryState>(
        builder: (context, state) {
          final cubit = context.read<DeliveryCubit>();
          final isSelected = cubit.selectedOrders
              .any((element) => element.orderId == order.orderId);

          return InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: order.deliveryDriving.isEmpty
                ? () {
                    cubit.toggleOrderSelection(
                        assignDeliveryModel: assignDeliveryModel,
                        isSelected: !isSelected);
                  }
                : () {
                    showTostification(
                        context,
                        "تم تعيين هذا الأوردر بالفعل إلى المندوب ${assignDeliveryModel.deliveryDriving}",
                        Colors.red,
                        Icons.close);
                  },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                color: const Color(0xff161819),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: !isSelected
                        ? kAccentColorLight.withValues(alpha: 0.1)
                        : Colors.greenAccent.withValues(alpha: 0.1),
                    width: 2),
                boxShadow: [
                  BoxShadow(
                      color:
                          !isSelected ? kAccentColorLight : Colors.greenAccent,
                      blurRadius: 2.5,
                      spreadRadius: 1.5),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: DeliveryOrdersItemBody(
                  products: products, totalPrice: totalPrice, order: order),
            ),
          );
        },
      ),
    );
  }

  num calcTotalPrice() {
    final totalPrice =
        products.fold<num>(0, (sum, item) => sum + item.totalPrice);
    return totalPrice;
  }

  AssignDeliveryModel assignDeliveryOrder(AddOrderEntity order) {
    final AssignDeliveryModel assignDeliveryModel = AssignDeliveryModel(
      orderId: order.orderId,
      productsNumber: products.length,
      phoneNumber: order.phoneNumber,
      totalOrder: order.totalPrice,
      orderStatus: order.isPaid,
      orderUnready: order.isReady,
      orderDate: order.dateTime.toString(),
      deliveryDriving: order.deliveryDriving,
    );
    return assignDeliveryModel;
  }
}
