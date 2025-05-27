import 'package:flutter/material.dart';
import 'package:nahlachicken/feature/postingaccounts/domain/entities/client_payments_entity.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/views/widgets/client_payments_item.dart';

class ClientPaymentsListView extends StatelessWidget {
  const ClientPaymentsListView({
    super.key,
    required this.paymentsList,
  });

  final List<ClientPaymentsEntity> paymentsList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      itemCount: paymentsList.length,
      itemBuilder: (context, index) {
        return ClientPaymentsItem(
          clientPaymentsEntity: paymentsList[index],
        );
      },
    );
  }
}
