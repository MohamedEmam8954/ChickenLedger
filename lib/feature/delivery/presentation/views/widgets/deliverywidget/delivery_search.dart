import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:nahlachicken/core/widgets/custom_text_from_field.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/cubit/delivery_cubit.dart';

class DeliverySearch extends StatelessWidget {
  const DeliverySearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: "البحث عن مندوب",
      suffixIcon: IconlyLight.search,
      onChanged: (value) {
        context.read<DeliveryCubit>().deliverSearch(value);
      },
    );
  }
}
