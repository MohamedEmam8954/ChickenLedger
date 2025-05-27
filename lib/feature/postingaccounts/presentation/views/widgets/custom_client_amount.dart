import 'package:flutter/material.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/views/widgets/search_client_bloc_builder.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/views/widgets/search_text_field.dart';

class CustomClientAmount extends StatelessWidget {
  const CustomClientAmount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 15,
        children: [
          SeachTextField(),
          SearchClientBlocbuilder(),
        ],
      ),
    );
  }
}
