import 'package:flutter/material.dart';
import 'package:nahlachicken/constant.dart';

class NavigationItem extends StatelessWidget {
  const NavigationItem({
    super.key,
    required this.currentIndex,
    required this.data,
    required this.index,
  });

  final int currentIndex;
  final List<IconData> data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: Alignment.center,
      duration: const Duration(microseconds: 300),
      width: 40,
      decoration: BoxDecoration(
        border: currentIndex == index
            ? const Border(
                top: BorderSide(color: Colors.white, width: 1),
              )
            : null,
        gradient: currentIndex == index
            ? LinearGradient(
                colors: [
                  Colors.white.withValues(alpha: 0.2),
                  Colors.black,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            : null,
      ),
      child: Icon(data[index],
          size: 22,
          color: index == currentIndex ? kAccentColorDark : kgrayColor),
    );
  }
}
