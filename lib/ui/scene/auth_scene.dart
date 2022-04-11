import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/auth/cubit.dart';
import 'package:inst_mobile/resources/app_strings.dart';
import 'package:inst_mobile/ui/scene/profile_scene.dart';
import 'package:inst_mobile/ui/widget/widget.dart' as custom_widget;

class AuthScene extends StatelessWidget {
  const AuthScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      if (state is AuthLoadingState) {
        return const CircularProgressIndicator();
      }
      if (state is AuthLoadedState) {
        return SafeArea(child: Column(

        ));
      }
      if (state is AuthErrorState) {
        return custom_widget.ErrorWidget(error: (state).error);
      }
      if (state is AuthWrongDataState) {
        return const custom_widget.ErrorWidget(
          error: AppStrings.wrongAuthData,
        );
      }
      if (state is AuthAuthorizedState) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScene()));
      }
      return const custom_widget.ErrorWidget(
        error: AppStrings.unhandledException,
      );
    });
  }
}
