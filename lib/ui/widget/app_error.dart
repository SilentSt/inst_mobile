import 'package:flutter/material.dart';
import 'package:inst_mobile/ui/styles/app_text_styles.dart';

import '../../resources/app_strings.dart';

class AppError extends StatelessWidget {
  const AppError({Key? key, required this.error, required this.action})
      : super(key: key);

  final String error;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(AppStrings.errorDialogTitle),
      content: Text(
        error,
        style: AppTextStyles.h1.green(),
      ),
      actions: [
        TextButton(
          onPressed: () => action(),
          child: const Text(AppStrings.acceptError),
        )
      ],
    );
  }
}
