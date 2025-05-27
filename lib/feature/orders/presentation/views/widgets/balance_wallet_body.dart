import 'package:flutter/material.dart';
import 'package:nahlachicken/feature/orders/presentation/views/widgets/calc_total_order.dart';

class BalenceWalletBody extends StatelessWidget {
  const BalenceWalletBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: const Column(
          children: [
            CalcTotalOrder(),
          ],
        ),
      ),
    );
  }
}
