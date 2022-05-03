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
import '../widget/app_bottom_bar.dart';
import '../widget/custom_error_widget.dart';
import '../widget/other_user_actions.dart';
import '../widget/profile_header.dart';
import '../widget/user_actions.dart';
import '../widget/user_content.dart';
import '../widget/user_info.dart';

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
            leading: IconButton(
              onPressed: () {
                context.read<NewsCubit>().loadData();
                context.read<NavigationCubit>().pushToNewsScene();
              },
              icon: SvgPicture.asset(AppStrings.arrowBackPath),
            )),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
        var _cubit = context.read<ProfileCubit>();
        if (state is ProfileLoadingState) {
          return Center(child: const CircularProgressIndicator(color: AppColors.darkGreen,));
        }
        if (state is ProfileLoadedState) {
          _cubit.loadImages(_cubit.userPosts, context);
          return SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height*0.95,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      children: [
                        ProfileHeader(
                          user: _cubit.user!,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        UserInfo(user: _cubit.user!),
                        const SizedBox(
                          height: 20,
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
                    const SizedBox(height: 15,),
                    SingleChildScrollView(child: UserContent(cubit: _cubit))
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
          return CustomErrorWidget(
            error: state.error,
            action: () {
              context.read<NewsCubit>().loadData();
              context.read<NavigationCubit>().pushToNewsScene();
            },
          );
        }
        return const Center(child: CircularProgressIndicator(color: AppColors.darkGreen,));
      }),
      bottomNavigationBar: const AppBottomBar(),
    );

  }
}
