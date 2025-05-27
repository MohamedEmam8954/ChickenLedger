import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nahlachicken/core/function/navgaition.dart';
import 'package:nahlachicken/core/utils/app_router.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/core/utils/assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  @override
  void initState() {
    customAnimation();
    navTo();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        spacing: 5,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            Assets.imagesAnimation,
            width: 200,
            height: 200,
            fit: BoxFit.fill,
            controller: _animationController,
          ),
          FadeTransition(
            opacity: _opacityAnimation,
            child: Text(
              "Chicken Ledger",
              style: AppStyles.style24Bold,
            ),
          ),
        ],
      ),
    );
  }

  void navTo() {
    Future.delayed(Duration(seconds: 4), () {
      navToWithoutBack(context, AppRouter.fingerPrint);
    });
  }

  void customAnimation() {
    _animationController =
        AnimationController(duration: Duration(seconds: 4), vsync: this);
    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn));
    _animationController.forward();
  }
}
