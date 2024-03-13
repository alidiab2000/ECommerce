import 'package:flutter/material.dart';

import 'rating_progress_indecator.dart';

class OverAllProductRating extends StatelessWidget {
  const OverAllProductRating({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            text,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        const Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RatingProgressIndecator(
                  text: '5',
                  value: 0.9,
                ),
                RatingProgressIndecator(
                  text: '4',
                  value: 0.7,
                ),
                RatingProgressIndecator(
                  text: '3',
                  value: 0.5,
                ),
                RatingProgressIndecator(
                  text: '2',
                  value: 0.3,
                ),
                RatingProgressIndecator(
                  text: '1',
                  value: 0.1,
                ),
              ],
            ))
      ],
    );
  }
}
