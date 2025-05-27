import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/navgaition.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/manager/clientAmountCubit/cubit/client_amount_cubit.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/views/widgets/add_client_view_body.dart';

class AddClientView extends StatelessWidget {
  const AddClientView({super.key, required this.clientAmountCubit});
  final ClientAmountCubit clientAmountCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: clientAmountCubit,
      child: PopScope(
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) clientAmountCubit.getAllClientAmount();
        },
        child: Scaffold(
          body: AddClientViewBody(),
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
              "اضافه عميل",
              style: AppStyles.style18Bold,
            ),
            centerTitle: true,
          ),
        ),
      ),
    );
  }
}
