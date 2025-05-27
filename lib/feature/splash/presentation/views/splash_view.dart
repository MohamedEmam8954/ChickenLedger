import 'package:flutter/material.dart';
import 'package:nahlachicken/feature/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff18191a),
      body: SplashViewBody(),
    );
  }
}
