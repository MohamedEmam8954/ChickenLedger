import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/cubit/delivery_cubit.dart';
import 'package:nahlachicken/feature/orders/presentation/views/widgets/order_status.dart';

class DeliveryStatus extends StatefulWidget {
  const DeliveryStatus(
      {super.key, required this.status, required this.deliveryId});
  final String status;
  final String deliveryId;
  @override
  State<DeliveryStatus> createState() => _DeliveryStatusState();
}

class _DeliveryStatusState extends State<DeliveryStatus> {
  late String status;
  @override
  void initState() {
    status = widget.status;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeliveryCubit, DeliveryState>(
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
              value: 'unPaid',
              child: OrderStaus(color: kAccentColorLight, text: "غير مدفوع"),
            ),
            DropdownMenuItem<String>(
              value: "cash",
              child: OrderStaus(
                text: "تم الدفع",
                color: Colors.green,
              ),
            ),
          ],
          onChanged: (value) {
            if (value != null) {
              status = value;
              context.read<DeliveryCubit>().updateDeliveryStaus(
                  status: status, deliveryId: widget.deliveryId);
            }
          },
        );
      },
    );
  }
}
