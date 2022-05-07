import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inst_mobile/cubit/profile/cubit.dart';
import 'package:inst_mobile/data/models/user.dart';
import 'package:inst_mobile/data/temp_data.dart';
import 'package:inst_mobile/ui/widget/buttons/app_button.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_strings.dart';
import '../../styles/app_text_styles.dart';

class OtherUserActions extends StatelessWidget {
  const OtherUserActions({
    Key? key,
    required this.user,
  }) : super(key: key);

  final GetFullMe user;

  @override
  Widget build(BuildContext context) {
    var _cubit = context.read<ProfileCubit>();
    print(_cubit.followed);
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _cubit.followed
            ? AppButton.outlined(
                action: () {
                  _cubit.unfollow(user.uuid);
                },
                text: AppStrings.unfollow,
                size: Size(167, 30),
                textStyle: AppTextStyles.h4.black(),
              )
            : AppButton.accent(
                action: () {
                  _cubit.follow(user.uuid);
                },
                text: AppStrings.follow,
                size: Size(167, 30),
              ),
        const SizedBox(width: 10,),
        AppButton.outlined(
          action: () {
            _cubit.unfollow(user.uuid);
          },
          text: AppStrings.openChat,
          size: Size(167, 30),
          textStyle: AppTextStyles.h4.black(),
        )
      ],
    );
  }
}
