import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/cubit/delivery_cubit.dart';

class DeliveryFilterViewBody extends StatefulWidget {
  const DeliveryFilterViewBody({super.key});

  @override
  State<DeliveryFilterViewBody> createState() => _DeliveryFilterViewBodyState();
}

class _DeliveryFilterViewBodyState extends State<DeliveryFilterViewBody> {
  late String getfilter;
  @override
  void initState() {
    getfilter = deliveryCubit().getFilter();
    super.initState();
  }

  DeliveryCubit deliveryCubit() => context.read<DeliveryCubit>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocBuilder<DeliveryCubit, DeliveryState>(
        builder: (context, state) {
          return Column(
            children: [
              RadioListTile(
                  title: Text("غير مدفوع"),
                  value: 'unPaid',
                  activeColor: kAccentColorDark,
                  groupValue: getfilter,
                  onChanged: (value) {
                    getfilter = value!;
                    deliveryCubit().sendFilter(value);
                  }),
              Divider(
                color: Colors.white.withValues(alpha: 0.5),
                thickness: 2,
              ),
              RadioListTile(
                  title: Text("مدفوع"),
                  activeColor: kAccentColorDark,
                  value: "cash",
                  groupValue: getfilter,
                  onChanged: (value) {
                    getfilter = value!;
                    deliveryCubit().sendFilter(value);
                  }),
            ],
          );
        },
      ),
    );
  }
}
