import 'package:flutter/material.dart';
import 'package:inst_mobile/cubit/registration/cubit.dart';
import 'package:inst_mobile/resources/app_colors.dart';
import 'package:inst_mobile/resources/app_strings.dart';
import 'package:inst_mobile/ui/controllers/text_editing_controllers.dart';
import 'package:inst_mobile/ui/styles/app_text_styles.dart';

class CustomDarkButton extends StatelessWidget {
  const CustomDarkButton({required this.size, required this.text, required this.func})
      : super();

  final String text;
  final Function func;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 25),
      child: TextButton(
          onPressed: () {
            func();
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.darkGreen),
              side: MaterialStateProperty.all(const BorderSide(width: 0)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)))),
          child: SizedBox(
            width: size.width * 0.55,
            height: 30,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: AppTextStyles.h2White,
            ),
          )),
    );
  }
}