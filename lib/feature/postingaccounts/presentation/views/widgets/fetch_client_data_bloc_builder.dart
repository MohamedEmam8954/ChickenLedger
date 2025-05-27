import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/core/widgets/custom_empty_widget.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/manager/clientAmountCubit/cubit/client_amount_cubit.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/views/widgets/accounting_posting_listview.dart';

class FetchClientDataBlocBuilder extends StatelessWidget {
  const FetchClientDataBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientAmountCubit, ClientAmountState>(
      builder: (context, state) {
        if (state is ClientAmountSucess) {
          return AccountingPostingListView(
            clientList: state.clientsList,
          );
        } else {
          return CustomEmptyWidget(title: "لا يوجد عملاء");
        }
      },
    );
  }
}
