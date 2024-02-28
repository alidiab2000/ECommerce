import 'package:flutter/material.dart';

class ProductBarndName extends StatelessWidget {
  const ProductBarndName({
    super.key,
    required this.brandName,
  });
  final String brandName;
  @override
  Widget build(BuildContext context) {
    return Text(
      brandName,
      style: Theme.of(context).textTheme.labelMedium,
      maxLines: 1,
    );
  }
}
