import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/core/widgets/custom_empty_widget.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/manager/clientAmountCubit/cubit/client_amount_cubit.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/views/widgets/custom_client_amount.dart';

class ClientAmountBlocbuilder extends StatelessWidget {
  const ClientAmountBlocbuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientAmountCubit, ClientAmountState>(
      builder: (context, state) {
        if (state is ClientAmountEmpty) {
          return CustomEmptyWidget(title: "لا يوجد عملاء");
        } else {
          return CustomClientAmount();
        }
      },
    );
  }
}
