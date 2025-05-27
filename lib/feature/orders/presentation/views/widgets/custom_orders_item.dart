import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/show_tostification.dart';
import 'package:nahlachicken/core/widgets/orderid_phonenumber.dart';
import 'package:nahlachicken/feature/orders/presentation/domain/entity/add_order_entity.dart';
import 'package:nahlachicken/feature/orders/presentation/manager/addorder/add_order_cubit.dart';

import 'package:nahlachicken/feature/orders/presentation/views/widgets/order_action.dart';
import 'package:nahlachicken/feature/orders/presentation/views/widgets/order_product_item.dart';
import 'package:nahlachicken/feature/orders/presentation/views/widgets/order_status_button.dart';
import 'package:nahlachicken/feature/orders/presentation/views/widgets/order_time.dart';
import 'package:nahlachicken/feature/orders/presentation/views/widgets/total_order.dart';

class CustomOrdersItem extends StatelessWidget {
  const CustomOrdersItem({super.key, required this.orderItem});
  final List<AddOrderEntity> orderItem;

  @override
  Widget build(BuildContext context) {
    num totalOrderPrice = calacTotalOrder();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff161819),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: orderItem[0].isPaid == "unpaid"
                  ? kAccentColorLight.withValues(alpha: 0.1)
                  : Colors.greenAccent.withValues(alpha: 0.1),
              width: 2),
          boxShadow: [
            BoxShadow(
                color: orderItem[0].isPaid == "unpaid"
                    ? kAccentColorLight
                    : Colors.greenAccent,
                blurRadius: 2.5,
                spreadRadius: 1.5),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              OrderIdAndPhoneNumber(
                orderId: orderItem[0].orderId,
                phoneNumber: orderItem[0].phoneNumber,
              ),
              Column(
                children: List.generate(orderItem.length, (index) {
                  return Directionality(
                    textDirection: TextDirection.ltr,
                    child: Dismissible(
                      direction: DismissDirection.endToStart,
                      key: ValueKey(orderItem[index].productId),
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        color: Colors.red,
                        child:
                            const Icon(IconlyLight.delete, color: Colors.white),
                      ),
                      onDismissed: (direction) {
                        if (orderItem.length == 1) {
                          context
                              .read<AddOrderCubit>()
                              .deleteOrder(orderItem[0].orderId);

                          showTostification(context, "تم حذف االاوردر بنجاح",
                              Colors.green, Icons.check);

                          return;
                        }

                        totalOrderPrice -= orderItem[index].totalPrice;
                        context.read<AddOrderCubit>().deleteProduct(
                            orderItem[index].orderId,
                            orderItem[index].productId);
                        showTostification(context, "تم حذف المنتج بنجاح",
                            Colors.green, Icons.check);
                      },
                      child: OrderProductItems(
                        orderItem: orderItem[index],
                      ),
                    ),
                  );
                }),
              ),
              Divider(
                color: const Color(0xff313439),
              ),
              TotalOrder(
                price: totalOrderPrice,
              ),
              OrderAction(
                orders: orderItem,
                totalPrice: totalOrderPrice,
                addOrderEntity: orderItem[0],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: OrderStatusBotton(
                  orderId: orderItem[0].orderId,
                  isPaid: orderItem[0].isPaid,
                ),
              ),
              OrderTime(
                orderDate: orderItem[0].dateTime,
              ),
            ],
          ),
        ),
      ),
    );
  }

  num calacTotalOrder() =>
      orderItem.fold(0, (sum, item) => sum + item.totalPrice);
}
