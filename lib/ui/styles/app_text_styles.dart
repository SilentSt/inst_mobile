import 'package:flutter/material.dart';
import 'package:inst_mobile/resources/app_colors.dart';

class AppTextStyles {
  static const TextStyle h1 = TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontFamily: 'Popins',
      fontWeight: FontWeight.w500);

  static const TextStyle h2 = TextStyle(
      color: AppColors.darkGrey,
      fontSize: 18,
      fontFamily: 'Popins',
      fontWeight: FontWeight.w100);

  static final TextStyle h2White = h2.copyWith(
      color: Colors.white);
}
