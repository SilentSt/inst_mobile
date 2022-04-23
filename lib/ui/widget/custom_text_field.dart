import 'package:flutter/material.dart';
import 'package:inst_mobile/resources/app_colors.dart';
import 'package:inst_mobile/resources/app_strings.dart';
import 'package:inst_mobile/ui/controllers/text_editing_controllers.dart';

import 'package:inst_mobile/ui/styles/app_text_styles.dart';

class CustomTextField extends StatelessWidget{
  const CustomTextField({required this.title, required this.controller, this.obfuscation=false, this.maxLines=1}) : super();
  final String title;
  final TextEditingController controller;
  final bool obfuscation;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 12),
      child: TextField(
        maxLines: maxLines,
        minLines: 1,
        obscureText: obfuscation,
        style: AppTextStyles.h4.green().font(),
        decoration:
        InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
          label:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(title,style: AppTextStyles.h3,),
          ),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.darkGreen, width: 4)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.darkGreen, width: 4),
              borderRadius: BorderRadius.circular(29)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.darkGreen, width: 4),
              borderRadius: BorderRadius.circular(29)),
        ),
        controller: controller,
      ),
    );
  }

}