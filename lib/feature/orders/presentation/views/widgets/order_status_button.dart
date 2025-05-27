import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/show_tostification.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/feature/orders/presentation/manager/addorder/add_order_cubit.dart';
import 'package:nahlachicken/feature/orders/presentation/manager/orderSatus/cubit/order_status_cubit.dart';

import 'package:nahlachicken/feature/orders/presentation/views/widgets/order_status.dart';

class OrderStatusBotton extends StatefulWidget {
  const OrderStatusBotton({
    super.key,
    required this.isPaid,
    required this.orderId,
  });

  final String isPaid;
  final String orderId;

  @override
  State<OrderStatusBotton> createState() => _OrderStatusBottonState();
}

class _OrderStatusBottonState extends State<OrderStatusBotton> {
  late String status;
  @override
  void initState() {
    super.initState();
    status = widget.isPaid;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderStatusCubit, OrderStatusState>(
      listener: (context, state) {
        if (state is UpdateOrderStatusFailure) {
          showTostification(context, state.errorMessage, Colors.red,
              IconlyLight.close_square);
        }
      },
      builder: (context, state) {
        return DropdownButton<String>(
          underline: SizedBox(),
          style: AppStyles.style16Bold,
          dropdownColor: kSecondaryColor,
          value: status,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: kAccentColorLight,
          ),
          borderRadius: BorderRadius.circular(10),
          items: [
            DropdownMenuItem<String>(
              value: "unpaid",
              child: OrderStaus(color: kAccentColorLight, text: "غير مدفوع"),
            ),
            DropdownMenuItem<String>(
              value: "cash",
              child: OrderStaus(
                text: "مدفوع كاش",
                color: Colors.green,
              ),
            ),
            DropdownMenuItem<String>(
              value: "instaPay",
              child: OrderStaus(
                text: "مدفوع انستا باي",
                color: Colors.greenAccent.shade700,
              ),
            ),
          ],
          onChanged: (value) {
            if (value != null) {
              setState(() {
                status = value;
              });
              context.read<OrderStatusCubit>().updateOrderStatus(
                  orderId: widget.orderId, orderPaid: status);
              context.read<AddOrderCubit>().filterOrder(
                    filterType: context.read<AddOrderCubit>().getFilterType(),
                  );
            }
          },
        );
      },
    );
  }
}
