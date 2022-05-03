import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inst_mobile/cubit/news/cubit.dart';
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
              context.read<NewsCubit>().loadData();
              context.read<NavigationCubit>().pushToNewsScene();
            },
            icon: SvgPicture.asset(AppStrings.arrowBackPath)),
        const Text(
          AppStrings.postDetailsTitle,
          style: AppTextStyles.h1,
        ),
        const SizedBox(width: 40,)
      ],
    );
  }
}
