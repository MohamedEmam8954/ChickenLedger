import 'package:flutter/material.dart';
import 'package:nahlachicken/feature/postingaccounts/domain/entities/client_account_entity.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/views/widgets/posting_amount_item.dart';

class AccountingPostingListView extends StatelessWidget {
  const AccountingPostingListView({super.key, required this.clientList});
  final List<ClientAccountEntity> clientList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: clientList.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return PostingAccountItem(
            clientAmountEntity: clientList[index],
          );
        },
      ),
    );
  }
}
