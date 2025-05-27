import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:nahlachicken/core/widgets/custom_text_from_field.dart';
import 'package:nahlachicken/feature/orders/presentation/manager/searchandfilter/cubit/search_and_filter_cubit.dart';

class SearchOrder extends StatefulWidget {
  const SearchOrder({
    super.key,
  });

  @override
  State<SearchOrder> createState() => _SearchOrderState();
}

class _SearchOrderState extends State<SearchOrder> {
  final TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      focusNode: focusNode,
      controller: textEditingController,
      hintText: "البحث عن الطلب",
      suffixIcon: IconlyLight.search,
      onChanged: (value) {
        if (value.isEmpty) {
          context.read<SearchAndFilterCubit>().rest();
          return;
        }
        context.read<SearchAndFilterCubit>().searchOrder(orderId: value.trim());
      },
    );
  }
}
