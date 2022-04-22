import 'package:flutter/cupertino.dart';

import '../../resources/app_strings.dart';

class UserIcon extends StatelessWidget {
  const UserIcon({
    Key? key,
    required this.path,
    required this.size,
  }) : super(key: key);
  final String path;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(90),
        child: Image.asset(
          AppStrings.userPhotoPath,
          height: size,
          width: size,
        ));
  }
}
