import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inst_mobile/cubit/global_search/cubit.dart';
import 'package:inst_mobile/cubit/navigation/cubit.dart';
import 'package:inst_mobile/ui/styles/app_text_styles.dart';
import 'package:inst_mobile/ui/widget/app_error.dart';
import '../../resources/app_strings.dart';
import '../controllers/text_editing_controllers.dart';
import '../widget/app_bottom_bar.dart';
import '../widget/global_search_widgets/global_search_bar.dart';
import '../widget/global_search_widgets/users_search_result.dart';

class GlobalSearchScene extends StatelessWidget {
  const GlobalSearchScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _cubit = context.read<GlobalSearchCubit>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              context.read<NavigationCubit>().pushToNewsScene();
            },
            icon: SvgPicture.asset(
              AppStrings.arrowBackPath,
            )),
        title: GlobalSearchBar(cubit: _cubit),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {
                  _cubit.find(GlobalSearchControllers.searchController.text);
                },
                icon: SvgPicture.asset(
                  AppStrings.searchGreenPath,
                )),
          )
        ],
      ),
      body: BlocBuilder<GlobalSearchCubit, GlobalSearchState>(
          builder: (context, state) {
        if (state is GlobalSearchLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is GlobalSearchLoadedState) {
          var users = state.users;
          //var posts = state.posts;
          return SingleChildScrollView(
              child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              children: [
                users.isEmpty?SizedBox.shrink():Column(
                  children: [
                    Text(
                      AppStrings.usersResult,
                      style: AppTextStyles.h2.black().bold900(),
                    ),
                    SizedBox(
                        height: users.length*90,
                        child: UsersSearchResult(users: users)),
                  ],
                ),
                // posts.isEmpty?SizedBox.shrink():Column(
                //   children: [
                //     Text(
                //       AppStrings.postsResult,
                //       style: AppTextStyles.h2.black().bold900(),
                //     ),
                //     SizedBox(
                //         height: posts.length*90,
                //         child: PostsSearchResult(posts: posts))
                //   ],
                // ),
              ],
            ),
          ));
        }
        if (state is GlobalSearchEmptyState) {
          return const SizedBox.shrink();
        }
        if (state is GlobalSearchErrorState) {
          return AppError(
            error: state.error,
            action: () {
              _cubit.acceptError();
              context.read<NavigationCubit>().pushToNewsScene();
            },
          );
        }
        return const Center(child: CircularProgressIndicator());
      }),
      bottomNavigationBar: const AppBottomBar(),
    );
  }
}
