import 'package:flutter/material.dart';
import 'package:inst_mobile/resources/app_strings.dart';

class ImagePost extends StatelessWidget {
  const ImagePost({Key? key, required this.imageSrc}) : super(key: key);

  final String imageSrc;

  @override
  Widget build(BuildContext context) {
    return Image.network('${AppStrings.apiUrl}/file?file_path=$imageSrc');
  }
}
