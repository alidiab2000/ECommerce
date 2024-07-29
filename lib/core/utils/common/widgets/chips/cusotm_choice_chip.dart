import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../helpers/helper_functions.dart';
import '../containers/circular_container.dart';

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip(
      {super.key, required this.text, required this.selected, this.onSelected});
  final String text;
  final bool selected;
  final void Function(bool)? onSelected;
  @override
  Widget build(BuildContext context) {
    final isColor = HelperFunctions.getColor(text) != null;
    return ChoiceChip(
      label: isColor ? const SizedBox() : Text(text),
      selected: selected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: selected ? AppColors.white : null),
      labelPadding: isColor ? EdgeInsets.zero : null,
      padding: isColor ? EdgeInsets.zero : null,
      avatar: isColor
          ? CustomCircularContainer(
              width: 50,
              height: 40,
              backgroundColor: HelperFunctions.getColor(text)!,
            )
          : null,
      shape: isColor ? const CircleBorder() : null,
    );
  }
}
