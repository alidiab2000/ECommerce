import '../../constants/colors.dart';
import 'package:flutter/material.dart';

class CustomShadowStyle {
  static final productShadow = BoxShadow(
    color: AppColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}
