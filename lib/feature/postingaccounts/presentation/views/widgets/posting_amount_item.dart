import 'package:flutter/material.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/feature/postingaccounts/domain/entities/client_account_entity.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/views/widgets/client_info_and_actions.dart';

class PostingAccountItem extends StatelessWidget {
  const PostingAccountItem({super.key, required this.clientAmountEntity});
  final ClientAccountEntity clientAmountEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff161819),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: clientAmountEntity.totalPrice == 0
                ? Colors.greenAccent.withValues(alpha: 0.1)
                : kAccentColorLight.withValues(alpha: 0.1),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: clientAmountEntity.totalPrice == 0.0
                  ? Colors.greenAccent
                  : kAccentColorLight,
              blurRadius: 2.5,
              spreadRadius: 1.5,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: ClientInfoAndActions(clientAmountEntity: clientAmountEntity),
        ),
      ),
    );
  }
}
