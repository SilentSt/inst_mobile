import 'package:flutter/material.dart';

import '../../resources/app_strings.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({Key? key, required this.error, required this.action}) : super(key: key);

  final String error;
  final Function action;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(AppStrings.errorDialogTitle),
      content: Text(error),
      actions: [
        TextButton(onPressed: () => action(), child: const Text(AppStrings.acceptError))
      ],
    );
  }
}