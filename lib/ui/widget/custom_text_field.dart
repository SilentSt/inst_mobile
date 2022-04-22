import 'package:flutter/material.dart';
import 'package:inst_mobile/resources/app_colors.dart';
import 'package:inst_mobile/resources/app_strings.dart';
import 'package:inst_mobile/ui/controllers/text_editing_controllers.dart';

import 'package:inst_mobile/ui/styles/app_text_styles.dart';

class CustomTextField extends StatelessWidget{
  const CustomTextField({required this.title, required this.controller}) : super();
  final String title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
      child: TextField(
        decoration:
        InputDecoration(
          label:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(title,style: AppTextStyles.h3,),
          ),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.darkGreen, width: 4)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.darkGreen, width: 4),
              borderRadius: BorderRadius.circular(29)),
        ),
        controller: controller,
      ),
    );
  }

}