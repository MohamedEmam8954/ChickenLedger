import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/build_order_details.dart';
import 'package:nahlachicken/core/function/show_tostification.dart';
import 'package:nahlachicken/feature/orders/presentation/domain/entity/add_order_entity.dart';
import 'package:nahlachicken/feature/orders/presentation/manager/addorder/add_order_cubit.dart';
import 'package:nahlachicken/feature/orders/presentation/views/widgets/order_ready_widget.dart';
import 'package:share_plus/share_plus.dart';

class OrderAction extends StatelessWidget {
  const OrderAction({
    super.key,
    required this.addOrderEntity,
    required this.totalPrice,
    required this.orders,
  });

  final AddOrderEntity addOrderEntity;
  final num totalPrice;
  final List<AddOrderEntity> orders;
  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                String text =
                    buildOrderDetails(totalPrice, addOrderEntity, orders);

                SharePlus.instance.share(ShareParams(
                  text: text,
                  subject: "تفاصيل الاوردر",
                ));
              },
              icon: Icon(
                Icons.share,
                color: kAccentColorLight,
              ),
            ),
            IconButton(
              onPressed: () {
                context
                    .read<AddOrderCubit>()
                    .deleteOrder(addOrderEntity.orderId);
                showTostification(context, "تم حذف االاوردر بنجاح",
                    Colors.green, Icons.check);
              },
              icon: Icon(
                IconlyLight.delete,
                color: kAccentColorLight,
              ),
            ),
          ],
        ),
        OrderReadyWidget(
          status: addOrderEntity.isReady,
          orderId: addOrderEntity.orderId,
        ),
      ],
    );
  }
}
