import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({super.key, this.smallsize = true, required this.title});
  final bool smallsize;
  final String title;
  @override
  Widget build(BuildContext context) {
    final th = Theme.of(context).textTheme;
    return Text(
      title,
      style: smallsize ? th.labelLarge : th.titleSmall,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      maxLines: 1,
      textAlign: TextAlign.left,
    );
  }
}
