import '../../../constants/colors.dart';
import '../../../helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    this.buttonTitle = "View All",
    this.showActionButton = false,
    required this.title,
    this.onPressed,
  });

  final String title, buttonTitle;
  final bool showActionButton;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall!.apply(
                color: HelperFunctions.isDarkMode(context)
                    ? AppColors.white
                    : AppColors.black,
              ),
        ),
        if (showActionButton)
          TextButton(
            onPressed: onPressed,
            child: Text(buttonTitle),
          )
      ],
    );
  }
}
