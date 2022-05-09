import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inst_mobile/cubit/navigation/cubit.dart';
import 'package:inst_mobile/cubit/news/cubit.dart';
import 'package:inst_mobile/cubit/profile/cubit.dart';
import 'package:inst_mobile/data/temp_data.dart';
import 'package:inst_mobile/resources/app_colors.dart';
import 'package:inst_mobile/ui/widget/dialogs/base_dialog.dart';

import '../../resources/app_strings.dart';

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({
    Key? key,
    this.homePage = false,
    this.searchPage = false,
    this.notificationPage = false,
    this.userPage = false,
    this.addPage = false,
  }) : super(key: key);
  final bool homePage;
  final bool searchPage;
  final bool addPage;
  final bool notificationPage;
  final bool userPage;

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
                  homePage ? AppStrings.homeHPath : AppStrings.homePath,
                ),
              ),
              IconButton(
                onPressed: () {
                  context.read<NavigationCubit>().pushToGlobalSearchScene();
                },
                icon: SvgPicture.asset(
                  searchPage ? AppStrings.searchHPath : AppStrings.searchPath,
                ),
              ),
              IconButton(
                onPressed: () {
                  //context.read<NavigationCubit>().pushToCreatePostScene();
                  showBottomSheet(
                    context: context,
                    builder: (context) => BaseDialog(
                      size: Size(
                        MediaQuery.of(context).size.width,
                        125,
                      ),
                      child: Column(
                        children: [
                          Text('Публикация'),
                          Text('История'),
                        ],
                      ),
                    ),
                  );
                },
                icon: SvgPicture.asset(
                  addPage ? AppStrings.addHPath : AppStrings.addPath,
                ),
              ),
              IconButton(
                onPressed: () {
                  //context.read<NavigationCubit>().pushToGlobalSearchScene();
                },
                icon: SvgPicture.asset(
                  notificationPage ? AppStrings.bellHPath : AppStrings.bellPath,
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
                  userPage ? AppStrings.userHPath : AppStrings.userPath,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
