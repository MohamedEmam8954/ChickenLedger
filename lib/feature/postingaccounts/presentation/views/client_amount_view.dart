import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/navgaition.dart';
import 'package:nahlachicken/core/utils/app_router.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/manager/clientAmountCubit/cubit/client_amount_cubit.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/views/widgets/client_amount_body.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/views/widgets/custom_client_amount_delete_button.dart';

class ClientAmoutView extends StatelessWidget {
  const ClientAmoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClientAmountViewBody(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "تسقيط حسابات",
          style: AppStyles.style18Bold,
        ),
        centerTitle: true,
        actions: [
          CustomClientAmountDeleteButton(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "addclient",
        onPressed: () {
          navToWithBack(context, AppRouter.addClientView,
              extra: context.read<ClientAmountCubit>());
        },
        backgroundColor: kAccentColorLight,
        child: const Icon(
          IconlyLight.add_user,
          color: Colors.black,
        ),
      ),
    );
  }
}
