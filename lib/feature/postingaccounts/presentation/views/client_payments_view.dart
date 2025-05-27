import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/navgaition.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/manager/clientAmountCubit/cubit/client_amount_cubit.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/views/widgets/client_payments_body.dart';

class ClientPaymentsView extends StatelessWidget {
  const ClientPaymentsView(
      {super.key, required this.clientAmountCubit, required this.clientId});
  final ClientAmountCubit clientAmountCubit;
  final String clientId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: clientAmountCubit..getClientPaymentsById(clientId),
      child: PopScope(
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            clientAmountCubit.getAllClientAmount();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                popFromScreen(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: kAccentColorDark,
              ),
            ),
            backgroundColor: Colors.transparent,
            title: Text(
              "التحويلات",
              style: AppStyles.style18Bold,
            ),
            centerTitle: true,
          ),
          body: ClientPaymentsBody(),
        ),
      ),
    );
  }
}
