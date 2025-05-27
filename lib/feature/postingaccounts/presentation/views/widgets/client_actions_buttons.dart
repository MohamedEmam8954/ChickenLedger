import 'package:flutter/material.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/views/widgets/delete_client_button.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/views/widgets/trasnsition_button.dart';

class ClientActionsButton extends StatelessWidget {
  const ClientActionsButton({super.key, required this.clientId});

  final String clientId;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.ltr,
      children: [
        DeleteClientButton(
          clientId: clientId,
        ),
        TranstitionButton(
          clientId: clientId,
        ),
      ],
    );
  }
}
