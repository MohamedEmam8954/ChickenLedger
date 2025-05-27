import 'package:flutter/material.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliverywidget/custom_phone_widget.dart';

class CustomDataWidget extends StatelessWidget {
  const CustomDataWidget({
    super.key,
    required this.name,
    this.phoneNumber,
  });
  final String name;
  final String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: kAccentColorLight,
        child: Text(name[0]),
      ),
      title: Text(name, style: AppStyles.style16Bold),
      subtitle: phoneNumber != null && phoneNumber!.isNotEmpty
          ? CustomPhoneWidget(
              phoneNumber: phoneNumber,
            )
          : null,
    );
  }
}
