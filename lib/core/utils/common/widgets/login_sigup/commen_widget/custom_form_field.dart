import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {super.key,
      required this.prefixIcon,
      required this.labelText,
      required this.keyboardType,
      this.controller,
      this.validator,
      this.obscureText = false,
      this.suffix});
  final Widget prefixIcon;
  final String labelText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffix;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      decoration: InputDecoration(
        prefixIcon: SizedBox(height: 52, child: prefixIcon),
        labelText: labelText,
        suffix: suffix,
      ),
    );
  }
}
