import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:nahlachicken/core/widgets/custom_text_from_field.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/manager/clientAmountCubit/cubit/client_amount_cubit.dart';

class SeachTextField extends StatelessWidget {
  const SeachTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: "البحث عن عميل",
      suffixIcon: IconlyLight.search,
      onChanged: (value) {
        context
            .read<ClientAmountCubit>()
            .searchClient(searchText: value.trim());
      },
    );
  }
}
