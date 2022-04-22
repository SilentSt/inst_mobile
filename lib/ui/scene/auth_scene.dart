import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/auth/cubit.dart';
import 'package:inst_mobile/cubit/navigation/cubit.dart';
import 'package:inst_mobile/resources/app_colors.dart';
import 'package:inst_mobile/resources/app_strings.dart';
import 'package:inst_mobile/ui/controllers/text_editing_controllers.dart';
import 'package:inst_mobile/ui/styles/app_text_styles.dart';
import 'package:inst_mobile/ui/widget/custom_buttons.dart';
import 'package:inst_mobile/ui/widget/custom_text_field.dart';

class AuthScene extends StatelessWidget {
  const AuthScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      var size = MediaQuery.of(context).size;
      var _cubit = context.read<AuthCubit>();
      if (state is AuthLoadingState) {
        _cubit.checkAppReadyToStart();
        return const Center(child: CircularProgressIndicator());
      }
      if (state is AuthLoadedState) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          body: SafeArea(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: size.height*0.9,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                  Image.asset(AppStrings.logonIconPath),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: AppColors.lightGreen,
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Text(AppStrings.loginTitle,
                              style: AppTextStyles.h1.green().bold900().size(30),
                              ),
                        ),
                        CustomTextField(
                            title: AppStrings.emailTitle,
                            controller:
                            AuthSceneControllers.loginController),
                        CustomTextField(
                            title: AppStrings.passwordTitle,
                            controller:
                            AuthSceneControllers.passwordController,
                            obfuscation: true),
                        CustomDarkButton(
                          func: () {
                            _cubit.login(
                                username: AuthSceneControllers
                                    .loginController.text,
                                password: AuthSceneControllers
                                    .passwordController.text);
                          },
                          size: size,
                          text: AppStrings.loginButton,
                        )
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.12,
                  ),
                  TextButton(
                      onPressed: () {
                        context.read<NavigationCubit>().pushToRegistrationScene();
                      },
                      child: Text(
                        AppStrings.registerSuggestion,
                        style: AppTextStyles.h4.green(),
                      ))
            ],
          ),
                ),
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
