import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/core/widgets/custom_empty_widget.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/manager/clientAmountCubit/cubit/client_amount_cubit.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/views/widgets/accounting_posting_listview.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/views/widgets/fetch_client_data_bloc_builder.dart';

class SearchClientBlocbuilder extends StatelessWidget {
  const SearchClientBlocbuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientAmountCubit, ClientAmountState>(
      builder: (context, state) {
        if (state is ClientSearchSucess) {
          return AccountingPostingListView(
            clientList: state.clientsList,
          );
        } else if (state is ClientSearchEmpty) {
          return Expanded(child: CustomEmptyWidget(title: state.message));
        } else {
          return FetchClientDataBlocBuilder();
        }
      },
    );
  }
}
