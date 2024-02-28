import 'package:flutter/material.dart';

class Productprice extends StatelessWidget {
  const Productprice({
    super.key,
    required this.price,
  });
  final String price;
  @override
  Widget build(BuildContext context) {
    return Text(
      '\$$price',
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
