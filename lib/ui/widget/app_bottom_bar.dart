import 'package:flutter/material.dart';
import 'package:inst_mobile/resources/app_colors.dart';

import '../../resources/app_strings.dart';

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 3.0,
      shape: const CircularNotchedRectangle(),
      color: AppColors.lightGreen,
      child: SizedBox(
        height: 90,
        child: Align(
          alignment: Alignment.topCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: (){}, icon: Image.asset(AppStrings.homePath)),
              IconButton(onPressed: (){}, icon: Image.asset(AppStrings.chatPath)),
              const SizedBox(),
              const SizedBox(),
              IconButton(onPressed: (){}, icon: Image.asset(AppStrings.searchPath)),
              IconButton(onPressed: (){}, icon: Image.asset(AppStrings.whiteBellPath))
            ],
          ),
        ),
      ),
    );
  }
}
