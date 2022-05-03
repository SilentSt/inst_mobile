import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resources/app_colors.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    Key? key,
    required this.action,
    required this.iconPath,
  }) : super(key: key);

  final Function action;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: action(),
      icon: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: AppColors.snow,
          borderRadius: BorderRadius.circular(90),
        ),
        child: SvgPicture.asset(iconPath,),
      ),
    );
  }
}
