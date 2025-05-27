import 'package:flutter/material.dart';

import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/feature/orders/presentation/domain/entity/add_order_entity.dart';

class OrderProductItems extends StatelessWidget {
  const OrderProductItems({super.key, required this.orderItem});
  final AddOrderEntity orderItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: productsImage[orderItem.type] == null
          ? SizedBox()
          : Image.asset(
              productsImage[orderItem.type]!,
              width: 50,
              height: 100,
              fit: BoxFit.fill,
            ),
      title: Row(
        spacing: 5,
        children: [
          Text(
            orderItem.type,
            style: AppStyles.style14Regular,
          ),
          Text(
            orderItem.quantity,
            style: AppStyles.style16Bold,
          ),
        ],
      ),
      subtitle: Text(
        "${orderItem.numberOfKilo} kg",
        style: AppStyles.style14Regular,
      ),
      trailing: Text(
        "السعر ${orderItem.priceWithoutDiscount} جنيه",
        style: AppStyles.style14Regular,
      ),
    );
  }
}
