import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';

part 'local_auth_state.dart';

class LocalAuthCubit extends Cubit<LocalAuthState> {
  LocalAuthCubit(this._authentication) : super(LocalAuthInitial());
  final LocalAuthentication _authentication;
  void authenticate() async {
    bool canAuthenticateWithBiometrics =
        await _authentication.canCheckBiometrics;
    if (canAuthenticateWithBiometrics) {
      bool didAuthenticate = await _authentication.authenticate(
        localizedReason: 'ادخل باستخدام بصمة الاصبع',
        options: const AuthenticationOptions(),
      );
      if (didAuthenticate) {
        emit(LocalAuthSucess());
      } else {
        exit(0);
      }
    }
  }
}
