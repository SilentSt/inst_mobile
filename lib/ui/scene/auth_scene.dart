import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/auth/cubit.dart';
import 'package:inst_mobile/cubit/navigation/cubit.dart';
import 'package:inst_mobile/resources/app_strings.dart';
import 'package:inst_mobile/ui/controllers/text_editing_controllers.dart';
import 'package:inst_mobile/ui/styles/app_text_styles.dart';
import 'package:inst_mobile/ui/widget/buttons/app_button.dart';
import 'package:inst_mobile/ui/widget/text_fields/app_textfield.dart';

import '../widget/custom_error_widget.dart';

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
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBar(
              backgroundColor: Colors.white,
              shadowColor: Colors.transparent,
              elevation: 0,
              title: Text(
                AppStrings.loginTitle,
                style: AppTextStyles.h2.black().bold700(),
              ),
              centerTitle: true,
            ),
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(bottom: 60),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox.shrink(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppTextField(
                            controller: AuthSceneControllers.loginController,
                            label: AppStrings.emailTitle,
                          ),
                          AppTextField(
                            controller: AuthSceneControllers.passwordController,
                            label: AppStrings.passwordTitle,
                            obscuredField: true,
                            obscureWidgetActive: Icon(
                              Icons.visibility,
                            ),
                            obscureWidgetDisabled: Icon(
                              Icons.visibility_off,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  AppButton.accent(
                    action: () {
                      _cubit.login();
                    },
                    size: Size(343, 30),
                    text: AppStrings.loginButton,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.notAccount,
                            style: AppTextStyles.h4.black(),
                          ),
                          GestureDetector(
                            onTap: context
                                .read<NavigationCubit>()
                                .pushToRegistrationScene,
                            child: Text(
                              AppStrings.registerSuggestion,
                              style: AppTextStyles.h4.accent().underline(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        AppStrings.forgotPassword,
                        style: AppTextStyles.h4.black(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }
      if (state is AuthErrorState) {
        return CustomErrorWidget(
          error: (state).error,
          action: () {
            _cubit.acceptError();
            context.read<NavigationCubit>().pushToAuthScene();
          },
        );
      }
      if (state is AuthWrongDataState) {
        return CustomErrorWidget(
          error: AppStrings.wrongAuthData,
          action: () {
            _cubit.acceptError();
            context.read<NavigationCubit>().pushToAuthScene();
          },
        );
      }
      if (state is AuthAuthorizedState) {
        context.read<NavigationCubit>().pushToNewsScene();
      }
      return const SizedBox.shrink();
    });
  }
}
