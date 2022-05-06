import 'package:flutter/material.dart';
import 'package:inst_mobile/resources/app_colors.dart';
import 'package:inst_mobile/ui/styles/app_text_styles.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    Key? key,
    required this.controller,
    required this.label,
    this.obscureWidgetActive,
    this.obscuredField = false,
    this.size = const Size(344, 60),
    this.obscureWidgetDisabled,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final Widget? obscureWidgetActive;
  final Widget? obscureWidgetDisabled;
  final bool obscuredField;
  final Size size;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.height,
      width: widget.size.width,
      child: TextField(
        decoration: InputDecoration(
          border: baseBorder(),
          disabledBorder: baseBorder(),
          enabledBorder: baseBorder(),
          errorBorder: baseBorder(),
          focusedBorder: baseBorder(),
          focusedErrorBorder: baseBorder(),
          labelStyle: AppTextStyles.h4.bold500().size(14),
          labelText: widget.label,
          suffixIcon: widget.obscuredField
              ? isObscured
                  ? GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            isObscured = false;
                          },
                        );
                      },
                      child: widget.obscureWidgetActive)
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          isObscured = true;
                        });
                      },
                      child: widget.obscureWidgetDisabled)
              : SizedBox.shrink(),
        ),
        style: AppTextStyles.h3.black(),
        obscureText: widget.obscuredField ? isObscured : false,
      ),
    );
  }

  InputBorder baseBorder(){
    return UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.inputBorderColor,
      ),
    );
  }
}
