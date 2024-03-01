import 'package:e_commerce/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class Productprice extends StatelessWidget {
  const Productprice({
    super.key,
    required this.price,
  });
  final String price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: CustomSizes.sm),
      child: Text(
        '\$$price',
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
