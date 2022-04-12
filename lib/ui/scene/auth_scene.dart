import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/auth/cubit.dart';
import 'package:inst_mobile/cubit/navigation/cubit.dart';
import 'package:inst_mobile/resources/app_strings.dart';
import 'package:inst_mobile/ui/controllers/text_editing_controllers.dart';

class AuthScene extends StatelessWidget {
  const AuthScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      var _cubit = context.read<AuthCubit>();
      if (state is AuthLoadingState) {
        _cubit.checkAppReadyToStart();
        return const Center(child: CircularProgressIndicator());
      }
      if (state is AuthLoadedState) {
        return Scaffold(
          body: SafeArea(
              child: Column(
            children: [
              Text("logn"),
              TextField(controller: AuthSceneControllers.loginController),
              Text("password"),
              TextField(controller: AuthSceneControllers.passwordController),
              TextButton(
                  onPressed: () {
                    _cubit.login(
                        username: AuthSceneControllers.loginController.text,
                        password: AuthSceneControllers.passwordController.text);
                  },
                  child: const Text("login")),
              TextButton(
                  onPressed: () {
                    context.read<NavigationCubit>().pushToRegistrationScene();
                  },
                  child: const Text("registration"))
            ],
          )),
        );
      }
      if (state is AuthErrorState) {
        return ErrorWidget(
          error: (state).error,
        );
      }
      if (state is AuthWrongDataState) {
        return const ErrorWidget(
          error: AppStrings.wrongAuthData,
        );
      }
      if (state is AuthAuthorizedState) {
        context.read<NavigationCubit>().pushToNewsScene();
      }
      return const SizedBox.shrink();
    });
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({Key? key, required this.error}) : super(key: key);

  final String error;

  @override
  Widget build(BuildContext context) {
    var _cubit = context.read<AuthCubit>();
    return AlertDialog(
      title: Text(AppStrings.errorDialogTitle),
      content: Text(error),
      actions: [
        TextButton(onPressed: () => _cubit.acceptError(), child: Text('Ок'))
      ],
    );
  }
}
