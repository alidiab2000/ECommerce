import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {super.key,
      required this.prefixIcon,
      required this.labelText,
      required this.keyboardType});
  final Widget prefixIcon;
  final String labelText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    bool checkobscureText = keyboardType == TextInputType.visiblePassword;

    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Invalid Input';
        }
        return null;
      },
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        labelText: labelText,
        suffix: checkobscureText ? const Icon(Icons.visibility_off) : null,
      ),
    );
  }
}
