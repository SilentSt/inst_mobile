import 'package:flutter/material.dart';

class FilePickerField extends StatelessWidget {
  const FilePickerField(
      { required this.func,})
      : super();
  final Function func;

  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          ]);
  }
}
