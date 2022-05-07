import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inst_mobile/cubit/navigation/cubit.dart';
import 'package:inst_mobile/cubit/news/cubit.dart';
import 'package:inst_mobile/cubit/profile/cubit.dart';
import 'package:inst_mobile/data/models/user.dart';
import 'package:inst_mobile/data/temp_data.dart';
import 'package:inst_mobile/resources/app_colors.dart';
import 'package:inst_mobile/resources/app_strings.dart';
import 'package:inst_mobile/ui/styles/app_text_styles.dart';
import 'package:inst_mobile/ui/widget/shimers/box.dart';
import 'package:inst_mobile/ui/widget/shimers/profile_shimmer.dart';
import '../widget/app_bottom_bar.dart';
import '../widget/app_error.dart';
import '../widget/profile_widgets/other_user_actions.dart';
import '../widget/profile_widgets/profile_header.dart';
import '../widget/profile_widgets/user_actions.dart';
import '../widget/profile_widgets/user_content.dart';
import '../widget/profile_widgets/user_info.dart';

class ProfileScene extends StatelessWidget {
  const ProfileScene({Key? key, this.smallUser}) : super(key: key);
  final GetSmallUser? smallUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 50),
        child: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          title: Text(
            smallUser?.nickname ?? AppStrings.profileMockNickName,
            style: AppTextStyles.h2.black().bold700(),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
          ],
        ),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          var _cubit = context.read<ProfileCubit>();
          if (state is ProfileLoadingState) {
            return ProfileShimmer();
          }
          if (state is ProfileLoadedState) {
            _cubit.loadImages(_cubit.userPosts, context);
            return SafeArea(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.95,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ProfileHeader(
                            user: _cubit.user!,
                          ),
                          const SizedBox(
                            height: 27,
                          ),
                          UserInfo(user: _cubit.user!),
                          const SizedBox(
                            height: 26,
                          ),
                          _cubit.user!.uuid == TempData.myId
                              ? UserActions(
                                  user: _cubit.user!,
                                )
                              : OtherUserActions(
                                  user: _cubit.user!,
                                ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SingleChildScrollView(
                        child: UserContent(
                          cubit: _cubit,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          if (state is ProfileEmptyState) {
            _cubit.loadData(userUuid: smallUser!.uuid);
            _cubit.pushForceLoaded();
          }
          if (state is ProfileErrorState) {
            return AppError(
              error: state.error,
              action: () {
                context.read<NewsCubit>().loadData();
                context.read<NavigationCubit>().pushToNewsScene();
              },
            );
          }
          return ProfileShimmer();
        },
      ),
      bottomNavigationBar: const AppBottomBar(),
    );
  }
}
