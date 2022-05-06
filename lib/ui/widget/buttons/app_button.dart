import 'package:flutter/material.dart';
import 'package:inst_mobile/resources/app_colors.dart';
import 'package:inst_mobile/ui/styles/app_text_styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.action,
    this.textStyle,
    required this.size,
    required this.buttonColor,
    required this.text,
    required this.borderSide,
  }) : super(key: key);

  final Function action;
  final TextStyle? textStyle;
  final Size size;
  final Color buttonColor;
  final String text;
  final BorderSide borderSide;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){action();},
      child: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.fromBorderSide(borderSide),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: textStyle??AppTextStyles.h4.white().bold700(),
          ),
        ),
      ),
    );
  }

  factory AppButton.outlined(
          {required Function action,
          required TextStyle textStyle,
          required Size size,
          required String text}) =>
      AppButton(
        action: action,
        textStyle: textStyle,
        size: size,
        buttonColor: Colors.transparent,
        text: text,
        borderSide: BorderSide(
          color: AppColors.borderColor,
          width: 1,
        ),
      );

  factory AppButton.accent(
      {required Function action,
        required Size size,
        required String text}) =>
      AppButton(
        action: action,
        size: size,
        buttonColor: AppColors.accentColor,
        text: text,
        borderSide: BorderSide.none,
      );
}
