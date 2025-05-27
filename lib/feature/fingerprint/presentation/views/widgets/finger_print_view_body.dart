import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/core/function/navgaition.dart';
import 'package:nahlachicken/core/helper/helper.dart';
import 'package:nahlachicken/core/utils/app_router.dart';
import 'package:nahlachicken/core/utils/assets.dart';
import 'package:nahlachicken/core/widgets/custom_loading.dart';
import 'package:nahlachicken/feature/fingerprint/presentation/manager/cubit/local_auth_cubit.dart';

class FingerPrintViewBody extends StatelessWidget {
  const FingerPrintViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocalAuthCubit, LocalAuthState>(
      listener: (context, state) {
        if (state is LocalAuthSucess) {
          Future.delayed(const Duration(seconds: 2), () {
            navToWithoutBack(context, AppRouter.navigation);
          });
        }
      },
      builder: (context, state) {
        return Container(
            height: context.getHeight(),
            width: context.getWidth(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.imagesFingerPrintBackground),
                fit: BoxFit.cover,
              ),
            ),
            child: state is LocalAuthSucess ? CustomLoading() : null);
      },
    );
  }
}
