import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/navigation/cubit.dart';
import 'package:inst_mobile/cubit/news/cubit.dart';
import 'package:inst_mobile/cubit/profile/cubit.dart';
import 'package:inst_mobile/data/models/user.dart';
import 'package:inst_mobile/data/temp_data.dart';
import 'package:inst_mobile/ui/widget/widget.dart' as custom_widget;
import 'package:inst_mobile/resources/app_strings.dart';

import '../widget/custom_error_widget.dart';
import '../widget/other_user_actions.dart';
import '../widget/profile_header.dart';
import '../widget/user_actions.dart';
import '../widget/user_content.dart';
import '../widget/user_info.dart';

class ProfileScene extends StatelessWidget {
  const ProfileScene({Key? key, this.user, this.smallUser}) : super(key: key);
  final GetFullUser? user;
  final GetSmallUser? smallUser;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      var _cubit = context.read<ProfileCubit>();
      if(user==null)
        {
          if(smallUser==null) {
            return CustomErrorWidget(
            error: AppStrings.unhandledException,
            action: () {
              context.read<NewsCubit>().loadData();
              context.read<NavigationCubit>().pushToNewsScene();
            },
          );
          }
          _cubit.loadData(userUuid: smallUser!.uuid);
        }
      if (state is ProfileLoadingState) {
        return const CircularProgressIndicator();
      }
      if (state is ProfileLoadedState) {
        _cubit.loadImages(user!);
        return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {
                  context.read<NewsCubit>().loadData();
                  context.read<NavigationCubit>().pushToNewsScene();
                },
                icon: Image.asset(AppStrings.arrowBackPath),
              )),
          body: SingleChildScrollView(
              child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  children: [
                    ProfileHeader(user: user!),
                    const SizedBox(
                      height: 10,
                    ),
                    UserInfo(user: user!),
                    const SizedBox(
                      height: 20,
                    ),
                    user!.uuid == TempData.myId
                        ? UserActions(
                            user: user!,
                          )
                        : OtherUserActions(
                            user: user!,
                          ),
                  ],
                ),
                UserContent(cubit: _cubit)
              ],
            ),
          )),
          bottomNavigationBar: const custom_widget.AppBottomBar(),
        );
      }
      if (state is ProfileEmptyState) {
        return const SizedBox.shrink();
      }
      if (state is ProfileErrorState) {
        return CustomErrorWidget(
          error: AppStrings.unhandledException,
          action: () {
            context.read<NewsCubit>().loadData();
            context.read<NavigationCubit>().pushToNewsScene();
          },
        );
      }
      return const Center(child: CircularProgressIndicator());
    });
  }
}
