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

  static const TextStyle h3 = TextStyle(
      color: AppColors.darkGrey,
      fontSize: 16,
      fontFamily: 'Popins',
      fontWeight: FontWeight.normal);

  static const TextStyle h4 = TextStyle(
      color: AppColors.darkGrey,
      fontSize: 14,
      fontFamily: 'Popins',
      fontWeight: FontWeight.normal);

  static final TextStyle h2White = h2.copyWith(color: Colors.white);

  static final TextStyle h2Green = h2.copyWith(color: AppColors.darkGreen);
}

extension AppTextExtension on TextStyle {
  TextStyle green() => copyWith(color: AppColors.darkGreen);

  TextStyle white() => copyWith(color: Colors.white);

  TextStyle black() => copyWith(color: Colors.black);

  TextStyle accent() => copyWith(color: AppColors.accentColor);

  TextStyle grey() => copyWith(color: AppColors.darkGrey);

  TextStyle lightGrey() => copyWith(color: AppColors.lightGrey);

  TextStyle bold900() => copyWith(fontWeight: FontWeight.w900);

  TextStyle bold600() => copyWith(fontWeight: FontWeight.w600);

  TextStyle bold700() => copyWith(fontWeight: FontWeight.w700);

  TextStyle bold500() => copyWith(fontWeight: FontWeight.w500);

  TextStyle bold() => copyWith(fontWeight: FontWeight.bold);

  TextStyle light400() => copyWith(fontWeight: FontWeight.w400);

  //TextStyle font() => copyWith(fontFamily: 'Arial');

  TextStyle size(double size) => copyWith(fontSize: size);

  TextStyle underline() => copyWith(decoration: TextDecoration.underline);
}
