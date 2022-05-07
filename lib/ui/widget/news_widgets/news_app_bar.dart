import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inst_mobile/data/temp_data.dart';

import '../../../resources/app_strings.dart';
import '../../styles/app_text_styles.dart';

class NewsAppBar extends StatelessWidget {
  const NewsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0,
      title: Text(TempData.me?.nickname ?? AppStrings.newsAppBarTitle,
          style: AppTextStyles.h1),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            AppStrings.chatPath,
          ),
        )
      ],
      automaticallyImplyLeading: false,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      actionsIconTheme: const IconThemeData(size: 40),
    );
  }
}
