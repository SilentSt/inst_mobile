import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inst_mobile/cubit/navigation/cubit.dart';
import 'package:inst_mobile/cubit/news/cubit.dart';
import 'package:inst_mobile/cubit/profile/cubit.dart';
import 'package:inst_mobile/data/temp_data.dart';
import 'package:inst_mobile/resources/app_colors.dart';

import '../../resources/app_strings.dart';

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 3.0,
      shape: const CircularNotchedRectangle(),
      color: AppColors.snow,
      child: SizedBox(
        height: 50,
        child: Align(
          alignment: Alignment.topCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  context.read<NewsCubit>().loadData();
                  context.read<NavigationCubit>().pushToNewsScene();
                },
                icon: SvgPicture.asset(
                  AppStrings.homePath,
                ),
              ),
              IconButton(
                onPressed: () {
                  context.read<NavigationCubit>().pushToGlobalSearchScene();
                },
                icon: SvgPicture.asset(
                  AppStrings.searchPath,
                ),
              ),
              IconButton(
                onPressed: () {
                  context.read<NavigationCubit>().pushToCreatePostScene();
                },
                icon: SvgPicture.asset(
                  AppStrings.addPath,
                ),
              ),
              IconButton(
                onPressed: () {
                  //context.read<NavigationCubit>().pushToGlobalSearchScene();
                },
                icon: SvgPicture.asset(
                  AppStrings.bellPath,
                ),
              ),
              IconButton(
                onPressed: () {
                  context.read<ProfileCubit>().clearData();
                  context
                      .read<NavigationCubit>()
                      .pushToProfileScene(TempData.me!.toSmallUser());
                },
                icon: SvgPicture.asset(
                  AppStrings.userPath,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
