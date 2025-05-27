import 'package:flutter/material.dart';
import 'package:nahlachicken/core/widgets/custom_delivery_data.dart';
import 'package:nahlachicken/feature/postingaccounts/domain/entities/client_account_entity.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/views/widgets/add_and_post_amount.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/views/widgets/client_actions_buttons.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/views/widgets/total_price.dart';

class ClientInfoAndActions extends StatelessWidget {
  const ClientInfoAndActions({
    super.key,
    required this.clientAmountEntity,
  });

  final ClientAccountEntity clientAmountEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDataWidget(
          name: clientAmountEntity.name,
          phoneNumber: clientAmountEntity.phoneNumber,
        ),
        AddAndPostAmount(clientAmountEntity: clientAmountEntity),
        TotalPrice(
          totalPrice: clientAmountEntity.totalPrice,
        ),
        ClientActionsButton(
          clientId: clientAmountEntity.clientId,
        )
      ],
    );
  }
}
