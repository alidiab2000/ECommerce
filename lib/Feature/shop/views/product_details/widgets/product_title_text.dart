import 'package:flutter/material.dart';

class ProductTitleText extends StatelessWidget {
  const ProductTitleText(
      {super.key,
      required this.title,
      this.samllSize = false,
      this.maxLines = 2,
      this.textAlign = TextAlign.left});
  final String title;
  final bool samllSize;
  final int maxLines;
  final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: samllSize
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.titleSmall,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
