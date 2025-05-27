import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/calc_order_status.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/feature/orders/presentation/data/models/order_status.dart';
import 'package:nahlachicken/feature/orders/presentation/data/models/wallet_card_data.dart';
import 'package:nahlachicken/feature/orders/presentation/manager/addorder/add_order_cubit.dart';
import 'package:nahlachicken/feature/orders/presentation/views/widgets/wallet_card.dart';

class CalcTotalOrder extends StatelessWidget {
  const CalcTotalOrder({super.key});

  @override
  Widget build(BuildContext context) {
    var list = context.read<AddOrderCubit>().ordersList;
    final OrderStats statsResult = calculateOrderStats(list);

    final stats = [
      WalletCardData("اجمالي الاوردرات", "${statsResult.total} جنيه",
          Icons.calculate, Colors.blueAccent),
      WalletCardData("عدد الاوردرات", "${list.length} اوردر",
          Icons.receipt_long, Colors.orangeAccent),
      WalletCardData("مدفوع كاش", "${statsResult.totalCash} جنيه",
          Icons.payments_outlined, Colors.greenAccent),
      WalletCardData("مدفوع انستاباي", "${statsResult.totalInstaPay} جنيه",
          Icons.mobile_friendly, Colors.lightBlueAccent),
      WalletCardData("غير مدفوع", "${statsResult.unpaidOrders} اوردر",
          Icons.warning_amber_rounded, Colors.redAccent),
      WalletCardData("اوردرات جاهزة", "${statsResult.orderReady} اوردر",
          Icons.check_circle_outline, Colors.tealAccent),
      WalletCardData("غير جاهزة", "${statsResult.orderUnReady} اوردر",
          Icons.hourglass_empty, Colors.deepOrangeAccent),
      WalletCardData(
          "اوردرات توصيل",
          "${statsResult.numberOfOrderDelivery} اوردر",
          Icons.delivery_dining,
          Colors.cyanAccent),
      WalletCardData(
          "اوردرات من المحل",
          "${statsResult.numberOfRecievedFromPlace} اوردر",
          Icons.storefront,
          Colors.amberAccent),
    ];

    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff161819),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: kAccentColorLight.withAlpha(25), width: 2),
        boxShadow: [
          BoxShadow(
            color: kAccentColorLight.withAlpha(38),
            blurRadius: 3,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "احصائيات اليوم - ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
            style: AppStyles.style16Bold.copyWith(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            shrinkWrap: true,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 8 / 7,
            children: stats
                .map((stat) => WalletCard(
                      title: stat.title,
                      value: stat.value,
                      icon: stat.icon,
                      color: stat.color,
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
