import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inst_mobile/resources/app_strings.dart';

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({Key? key, required this.error}) : super(key: key);

  final String error;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppStrings.errorDialogTitle),
      content: Text(error),
      titlePadding: EdgeInsets.all(5),
      contentPadding: EdgeInsets.all(5),
    );
  }
}
