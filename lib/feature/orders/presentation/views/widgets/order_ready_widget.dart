import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/show_tostification.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/feature/orders/presentation/manager/addorder/add_order_cubit.dart';
import 'package:nahlachicken/feature/orders/presentation/manager/orderSatus/cubit/order_status_cubit.dart';
import 'package:nahlachicken/feature/orders/presentation/views/widgets/order_status.dart';

class OrderReadyWidget extends StatefulWidget {
  const OrderReadyWidget(
      {super.key, required this.status, required this.orderId});
  final String status;
  final String orderId;

  @override
  State<OrderReadyWidget> createState() => _OrderReadyWidgetState();
}

class _OrderReadyWidgetState extends State<OrderReadyWidget> {
  late String status;
  @override
  void initState() {
    status = widget.status;
    super.initState();
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
        return DropdownButton(
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
            DropdownMenuItem(
              value: "unReady",
              child: OrderStaus(color: kAccentColorLight, text: "غير جاهز"),
            ),
            DropdownMenuItem(
              value: "ready",
              child: OrderStaus(
                text: "جهز",
                color: Colors.green,
              ),
            ),
          ],
          onChanged: (value) {
            status = value!;
            setState(() {});

            context
                .read<OrderStatusCubit>()
                .updateOrderStatus(orderId: widget.orderId, orderReady: status);

            context.read<AddOrderCubit>().filterOrder(
                filterType: context.read<AddOrderCubit>().getFilterType());
          },
        );
      },
    );
  }
}
