import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:nahlachicken/constant.dart';

import 'package:nahlachicken/feature/orders/presentation/manager/addorder/add_order_cubit.dart';

class FilterListView extends StatefulWidget {
  const FilterListView({super.key});

  @override
  State<FilterListView> createState() => _FilterListViewState();
}

class _FilterListViewState extends State<FilterListView> {
  late String filterType;
  @override
  initState() {
    filterType =
        Hive.box<String>(kFilterOrderType).get(kFilterOrderType) ?? "all";
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
        buildRadioTile(title: "دليفري", value: "delivery"),
        buildDivider(),
        buildRadioTile(title: "استلام من المحل", value: "receive"),
      ],
    );
  }

  Widget buildRadioTile({required String title, required String value}) {
    return BlocBuilder<AddOrderCubit, AddOrderState>(
      builder: (context, state) {
        return RadioListTile<String>(
          title: Text(title),
          activeColor: kAccentColorLight,
          value: value,
          groupValue: filterType,
          onChanged: (val) async {
            filterType = val!;
            context
                .read<AddOrderCubit>()
                .sendFilterType(filterType: filterType);
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
