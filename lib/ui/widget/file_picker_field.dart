import 'package:flutter/material.dart';
import 'package:inst_mobile/resources/app_colors.dart';
import 'package:inst_mobile/ui/styles/app_text_styles.dart';

class FilePickerField extends StatelessWidget{
  const FilePickerField({required this.title, this.obfuscation=false}) : super();
  final String title;
  final bool obfuscation;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
      child: TextField(
        obscureText: obfuscation,
        style: AppTextStyles.h3.green(),
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
      ),
    );
  }

}