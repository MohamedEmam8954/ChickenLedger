import 'package:flutter/material.dart';
import 'package:nahlachicken/feature/orders/presentation/views/widgets/filter_list_view.dart';

class FilterViewBody extends StatelessWidget {
  const FilterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "اختر نوع الفلترة:",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: FilterListView(),
          ),
        ],
      ),
    );
  }
}
