import 'package:flutter/material.dart';
import 'package:inst_mobile/data/models/user.dart';
import 'package:inst_mobile/data/temp_data.dart';

import '../../resources/app_colors.dart';
import '../../resources/app_strings.dart';
import '../styles/app_text_styles.dart';

class OtherUserActions extends StatelessWidget {
  const OtherUserActions({
    Key? key, required this.user,
  }) : super(key: key);

  final GetFullUser user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            onPressed: () {},
            child: Text(
              AppStrings.follow,
              style: AppTextStyles.h3.white().copyWith(
                  fontSize: 15, fontWeight: FontWeight.w300),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    AppColors.darkGreen),
                shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(18))))),
        IconButton(
            onPressed: () {},
            icon: SizedBox(
              height: 150,
              child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: AppColors.darkGreen,
                      borderRadius: BorderRadius.circular(90)),
                  child: Image.asset(AppStrings.sendPath)),
            ))
      ],
    );
  }
}