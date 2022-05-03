import 'package:flutter/material.dart';
import 'package:inst_mobile/resources/app_colors.dart';

class FilePickerField extends StatelessWidget {
  const FilePickerField(
      { required this.func,})
      : super();
  final Function func;
  static final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          ]);
  }
}
