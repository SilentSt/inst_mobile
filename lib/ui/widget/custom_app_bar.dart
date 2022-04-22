import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../resources/app_strings.dart';
import '../styles/app_text_styles.dart';
import 'app_bar_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      leading: AppBarButton(iconPath: AppStrings.cameraPath, action: () {}),
      centerTitle: true,
      title: const Text(AppStrings.newsAppBarTitle, style: AppTextStyles.h1),
      actions: [
        AppBarButton(action: () {}, iconPath: AppStrings.bellPath),
      ],
      automaticallyImplyLeading: false,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      actionsIconTheme: const IconThemeData(size: 40),
    );
  }
}
