import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inst_mobile/cubit/profile/cubit.dart';
import 'package:inst_mobile/data/models/user.dart';
import 'package:inst_mobile/data/temp_data.dart';

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
        TextButton(
            onPressed: () {
              _cubit.followed
                  ? _cubit.unfollow(user.uuid)
                  : _cubit.follow(user.uuid);
            },
            child: Text(
              _cubit.followed ? AppStrings.unfollow : AppStrings.follow,
              style: _cubit.followed
                  ? AppTextStyles.h3
                      .green()
                      .copyWith(fontSize: 15, fontWeight: FontWeight.w300)
                  : AppTextStyles.h3
                      .white()
                      .copyWith(fontSize: 15, fontWeight: FontWeight.w300),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    _cubit.followed ? Colors.transparent : AppColors.darkGreen),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18), side: BorderSide(color: AppColors.darkGreen))))),
        IconButton(
            onPressed: () {},
            icon: SizedBox(
              height: 150,
              width: 150,
              child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.darkGreen, width: 1),
                      borderRadius: BorderRadius.circular(90)),
                  child: SvgPicture.asset(AppStrings.sendPath)),
            ))
      ],
    );
  }
}
