import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/navigation/navigation_cubit.dart';
import '../../resources/app_strings.dart';
import '../styles/app_text_styles.dart';

class PostDetailsAppBar extends StatelessWidget {
  const PostDetailsAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              context.read<NavigationCubit>().pushToNewsScene();
            },
            icon: Image.asset(AppStrings.arrowBackPath)),
        const Text(
          AppStrings.postDetailsTitle,
          style: AppTextStyles.h1,
        ),
        const SizedBox(width: 40,)
      ],
    );
  }
}
