import 'package:flutter/material.dart';
import 'package:nahlachicken/core/function/copy_text_clipboard.dart';
import 'package:nahlachicken/core/function/show_tostification.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/core/widgets/custom_item_button.dart';

class CustomCopyText extends StatefulWidget {
  const CustomCopyText({
    super.key,
    required this.textCopied,
    required this.showText,
  });

  final String textCopied;
  final String showText;

  @override
  State<CustomCopyText> createState() => _CustomCopyTextState();
}

class _CustomCopyTextState extends State<CustomCopyText> {
  bool isCopied = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        copiedTextLogic(context, widget.showText);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 5,
        children: [
          Text(
            widget.textCopied,
            style: AppStyles.style16Bold,
          ),
          CustomIconButton(
            iconSize: 15,
            padding: 8,
            icon: isCopied ? Icons.check : Icons.copy,
            onTap: () {
              copiedTextLogic(context, widget.showText);
            },
          ),
        ],
      ),
    );
  }

  void copiedTextLogic(BuildContext context, String showText) {
    copyData(text: widget.textCopied);
    setState(() {
      isCopied = true;
    });
    showTostification(context, showText, Colors.green, Icons.check);
    Future.delayed(Duration(seconds: 2), () {
      if (!mounted) return;

      setState(() {
        isCopied = false;
      });
    });
  }
}
