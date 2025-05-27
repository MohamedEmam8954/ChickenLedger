import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/deliveryOrder/cubit/delivery_order_cubit.dart';

class DeliveryFilterListView extends StatefulWidget {
  const DeliveryFilterListView({super.key});

  @override
  State<DeliveryFilterListView> createState() => _DeliveryFilterListViewState();
}

class _DeliveryFilterListViewState extends State<DeliveryFilterListView> {
  late String filterType;
  @override
  void initState() {
    filterType = context.read<DeliveryOrderCubit>().getFilter();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        buildRadioTile(title: "كل الطلبات", value: "all"),
        buildDivider(),
        buildRadioTile(title: "الأحدث أولاً", value: "Lastest Time"),
        buildDivider(),
        buildRadioTile(title: "الأقدم أولاً", value: "earliest Time"),
        buildDivider(),
        buildRadioTile(title: "جاهز", value: "ready"),
        buildDivider(),
        buildRadioTile(title: "غير جاهز", value: "unReady"),
        buildDivider(),
        buildRadioTile(title: "مدفوع", value: "Paid"),
        buildDivider(),
        buildRadioTile(title: "غير مدفوع", value: "unpaid"),
        buildDivider(),
        buildRadioTile(title: "جاري التوصيل", value: "delivering"),
        buildDivider(),
        buildRadioTile(
            title: "في قائمة الانتظار", value: "On the waiting list"),
      ],
    );
  }

  Widget buildRadioTile({required String title, required String value}) {
    return BlocBuilder<DeliveryOrderCubit, DeliveryOrderState>(
      builder: (context, state) {
        return RadioListTile<String>(
          title: Text(title),
          activeColor: kAccentColorLight,
          value: value,
          groupValue: filterType,
          onChanged: (val) async {
            filterType = val!;
            context.read<DeliveryOrderCubit>().sendFilter(filterType);
          },
        );
      },
    );
  }

  Widget buildDivider() {
    return const Divider(
      height: 1,
      color: Colors.grey,
    );
  }
}
