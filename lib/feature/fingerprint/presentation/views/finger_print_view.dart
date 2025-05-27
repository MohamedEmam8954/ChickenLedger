import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'package:nahlachicken/feature/fingerprint/presentation/manager/cubit/local_auth_cubit.dart';
import 'package:nahlachicken/feature/fingerprint/presentation/views/widgets/finger_print_view_body.dart';

class FingerPrintView extends StatelessWidget {
  const FingerPrintView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) =>
              LocalAuthCubit(LocalAuthentication())..authenticate(),
          child: FingerPrintViewBody(),
        ),
      ),
    );
  }
}
