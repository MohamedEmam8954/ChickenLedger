import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/core/widgets/custom_empty_widget.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/manager/clientAmountCubit/cubit/client_amount_cubit.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/views/widgets/client_payments_list_view.dart';

class ClientPaymentsBody extends StatelessWidget {
  const ClientPaymentsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientAmountCubit, ClientAmountState>(
      builder: (context, state) {
        if (state is ClientPaymentsSucess) {
          return ClientPaymentsListView(paymentsList: state.clientPayments);
        } else {
          return CustomEmptyWidget(title: "لا توجد تحويلات");
        }
      },
    );
  }
}
