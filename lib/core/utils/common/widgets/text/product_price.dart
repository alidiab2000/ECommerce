import '../../../../../../core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class Productprice extends StatelessWidget {
  const Productprice({
    super.key,
    this.isLagre = false,
    required this.price,
  });
  final String price;
  final bool isLagre;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: CustomSizes.sm),
      child: Text(
        '\$$price',
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: isLagre
            ? Theme.of(context).textTheme.headlineSmall
            : Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
