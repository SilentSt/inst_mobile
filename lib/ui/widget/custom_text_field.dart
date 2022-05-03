import 'package:flutter/material.dart';
import 'package:inst_mobile/resources/app_colors.dart';
import 'package:inst_mobile/resources/app_strings.dart';
import 'package:inst_mobile/ui/controllers/text_editing_controllers.dart';

import 'package:inst_mobile/ui/styles/app_text_styles.dart';

class CustomTextField extends StatelessWidget{
  CustomTextField({required this.title, required this.controller, this.obfuscation=false, this.maxLines=1, this.titleStyle, this.textStyle}) : super();
  final String title;
  final TextEditingController controller;
  final bool obfuscation;
  final int maxLines;
  TextStyle? titleStyle;
  TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12,bottom: 12),
      child: TextField(

        maxLines: maxLines,
        minLines: 1,
        obscureText: obfuscation,
        style: textStyle??AppTextStyles.h3.green().bold900(),
        decoration:
        InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
          label:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(title,style: titleStyle??AppTextStyles.h3.bold900(),),
          ),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.darkGreen, width: 3)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.darkGreen, width: 3),
              borderRadius: BorderRadius.circular(29)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.darkGreen, width: 3),
              borderRadius: BorderRadius.circular(29)),
        ),
        controller: controller,
      ),
    );
  }

}