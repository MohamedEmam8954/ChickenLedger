import 'package:flutter/material.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/feature/postingaccounts/domain/entities/client_account_entity.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/views/widgets/add_amount_to_client.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/views/widgets/drop_amount_from_client.dart';

class AddAndPostAmount extends StatefulWidget {
  const AddAndPostAmount({super.key, required this.clientAmountEntity});
  final ClientAccountEntity clientAmountEntity;

  @override
  State<AddAndPostAmount> createState() => _AddAndPostAmountState();
}

class _AddAndPostAmountState extends State<AddAndPostAmount> {
  bool isAdding = true;
  bool isPosting = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: BorderSide(color: kAccentColorDark),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomRight: Radius.circular(12)),
                    ),
                    backgroundColor: isAdding ? kAccentColorDark : null),
                onPressed: () {
                  isAdding = true;
                  isPosting = false;
                  setState(() {});
                },
                child: Text(
                  "اضافه مبلغ",
                  style: AppStyles.style14Bold.copyWith(
                      color: isAdding ? Colors.black : kAccentColorLight),
                ),
              ),
            ),
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12)),
                    ),
                    side: BorderSide(color: kAccentColorDark),
                    backgroundColor: isPosting ? kAccentColorDark : null),
                onPressed: () {
                  isAdding = false;
                  isPosting = true;
                  setState(() {});
                },
                child: Text(
                  "تسقيط مبلغ",
                  style: AppStyles.style14Bold.copyWith(
                    color: isPosting ? Colors.black : kAccentColorDark,
                  ),
                ),
              ),
            ),
          ],
        ),
        if (isPosting) ...[
          DropAmountFromClient(
            clientId: widget.clientAmountEntity.clientId,
            name: widget.clientAmountEntity.name,
            totalPrice: widget.clientAmountEntity.totalPrice,
          ),
        ],
        if (isAdding) ...[
          AddAmountToClient(
              clientId: widget.clientAmountEntity.clientId,
              name: widget.clientAmountEntity.name),
        ],
      ],
    );
  }
}
