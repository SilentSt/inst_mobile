import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/navigation/cubit.dart';
import 'package:inst_mobile/data/models/user.dart';
import 'package:inst_mobile/ui/widget/buttons/app_button.dart';

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
    return AppButton.outlined(
      action: () {
        context.read<NavigationCubit>().pushToProfileEditScene();
      },
      text: AppStrings.editProfile,
      size: Size(MediaQuery.of(context).size.width-32, 30),
      textStyle: AppTextStyles.h4.black(),
    );
  }
}
