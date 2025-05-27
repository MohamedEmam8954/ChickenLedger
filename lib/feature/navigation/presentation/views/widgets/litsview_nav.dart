import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nahlachicken/feature/navigation/presentation/views/widgets/navigation_item.dart';

class ListviewNav extends StatefulWidget {
  const ListviewNav({super.key, required this.onchanged});

  final Function(int)? onchanged;

  @override
  State<ListviewNav> createState() => _ListviewNavState();
}

class _ListviewNavState extends State<ListviewNav> {
  int currentIndex = 0;

  final List<IconData> data = const [
    IconlyLight.home,
    Icons.receipt_long,
    IconlyLight.send,
    Icons.account_balance,
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(data.length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
              widget.onchanged?.call(index);
            },
            child: NavigationItem(
              currentIndex: currentIndex,
              data: data,
              index: index,
            ),
          ),
        );
      }),
    );
  }
}
