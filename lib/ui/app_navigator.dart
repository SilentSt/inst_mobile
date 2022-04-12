import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/navigation/cubit.dart';
import 'package:inst_mobile/ui/scene/auth_scene.dart';
import 'package:inst_mobile/ui/scene/global_search_scene.dart';
import 'package:inst_mobile/ui/scene/news_scene.dart';
import 'package:inst_mobile/ui/scene/profile_scene.dart';
import 'package:inst_mobile/ui/scene/registration_scene.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) => Navigator(
              pages: [
                if (state is NavigationAuthState)
                  const MaterialPage(child: AuthScene()),
                if (state is NavigationGlobalSearchState)
                  const MaterialPage(child: GlobalSearchScene()),
                if (state is NavigationNewsState)
                  const MaterialPage(child: NewsScene()),
                if (state is NavigationProfileState)
                  const MaterialPage(child: ProfileScene()),
                if (state is NavigationRegistrationState)
                  const MaterialPage(child: RegistrationScene())
              ],
              onPopPage: (route, result) {
                return route.didPop(result);
              },
            ));
  }
}
