import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/navigation/cubit.dart';
import 'package:inst_mobile/data/models/user.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_strings.dart';
import '../../styles/app_text_styles.dart';

class UserActions extends StatelessWidget {
  const UserActions({
    Key? key,
    required this.user,
  }) : super(key: key);

  final GetFullMe user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            onPressed: () {context.read<NavigationCubit>().pushToProfileEditScene();},
            child: Text(
              AppStrings.editProfile,
              style: AppTextStyles.h3
                  .green()
                  .copyWith(fontSize: 15, fontWeight: FontWeight.w300),
            ),
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    side:
                        const BorderSide(color: AppColors.darkGreen, width: 2),
                    borderRadius: BorderRadius.circular(18))))),
        const SizedBox(width: 10,),
        TextButton(
            onPressed: () {},
            child: Text(
              AppStrings.insights,
              style: AppTextStyles.h3
                  .green()
                  .copyWith(fontSize: 15, fontWeight: FontWeight.w300),
            ),
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    side:
                    const BorderSide(color: AppColors.darkGreen, width: 2),
                    borderRadius: BorderRadius.circular(18))))),
      ],
    );
  }
}
