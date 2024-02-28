 

import 'package:flutter/material.dart';

import '../../constants/colors.dart';


class CustomBottomSheetTheme {

  CustomBottomSheetTheme._();


  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(

    showDragHandle: true,

    backgroundColor: AppColors.white,

    modalBackgroundColor: AppColors.white,

    constraints: const BoxConstraints(minWidth: double.infinity),

    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

  );


  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(

    showDragHandle: true,

    backgroundColor: AppColors.black,

    modalBackgroundColor: AppColors.black,

    constraints: const BoxConstraints(minWidth: double.infinity),

    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

  );

}

