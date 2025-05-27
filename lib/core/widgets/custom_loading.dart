import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nahlachicken/constant.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key, this.size = 50});
  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFoldingCube(
        color: Colors.white,
        size: size,
      ),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({super.key, this.size = 50});
  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 15,
        ),
        Center(
          child: SpinKitDualRing(
            color: kAccentColorLight,
            size: size,
          ),
        ),
      ],
    );
  }
}
