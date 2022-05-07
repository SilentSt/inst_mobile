import 'package:flutter/material.dart';
import 'package:inst_mobile/resources/app_strings.dart';

class ImageHistory extends StatelessWidget{
  const ImageHistory({Key? key, required this.imageSrc}) : super(key: key);

  final String imageSrc;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Image.network('${AppStrings.apiUrl}/file?file_path=$imageSrc'),
    );
  }

}