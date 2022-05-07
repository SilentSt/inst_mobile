import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/navigation/cubit.dart';
import 'package:inst_mobile/cubit/registration/cubit.dart';
import 'package:inst_mobile/ui/controllers/text_editing_controllers.dart';
import 'package:inst_mobile/ui/styles/app_text_styles.dart';
import 'package:inst_mobile/ui/widget/buttons/app_button.dart';
import 'package:inst_mobile/resources/app_strings.dart';
import 'package:inst_mobile/ui/widget/text_fields/app_textfield.dart';

import '../widget/app_error.dart';

class RegistrationScene extends StatelessWidget {
  const RegistrationScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      builder: (context, state) {
        var _cubit = context.read<RegistrationCubit>();
        if (state is RegistrationLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is RegistrationLoadedState) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 50),
              child: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                shadowColor: Colors.transparent,
                title: Text(
                  AppStrings.registrationTitle,
                  style: AppTextStyles.h2.black().bold700(),
                ),
                centerTitle: true,
              ),
            ),
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox.shrink(),
                      Column(
                        children: [
                          AppTextField(
                              label: AppStrings.nickName,
                              controller: RegistrationSceneControllers
                                  .nicknameController),
                          AppTextField(
                            label: AppStrings.emailTitle,
                            controller:
                                RegistrationSceneControllers.loginController,
                          ),
                          AppTextField(
                            label: AppStrings.passwordTitle,
                            controller:
                                RegistrationSceneControllers.passwordController,
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
                      AppButton.accent(
                        action: () {
                          _cubit.createUser(
                            username: RegistrationSceneControllers
                                .nicknameController.text,
                            password: RegistrationSceneControllers
                                .passwordController.text,
                            email: RegistrationSceneControllers
                                .loginController.text,
                          );
                        },
                        size: Size(343, 30),
                        text: AppStrings.registerButton,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.alreadyHaveAccount,
                            style: AppTextStyles.h4.black(),
                          ),
                          GestureDetector(
                            onTap:
                                context.read<NavigationCubit>().pushToAuthScene,
                            child: Text(
                              AppStrings.loginButton,
                              style: AppTextStyles.h4.accent().underline(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        if (state is RegistrationWrongDataState) {
          return AppError(
            error: state.error,
            action: () {
              _cubit.acceptError();
            },
          );
        }
        if (state is RegistrationErrorState) {
          return AppError(
            error: state.error,
            action: () {
              _cubit.acceptError();
            },
          );
        }
        if (state is RegistrationSuccessState) {
          return SimpleDialog(
            title: const Text(AppStrings.successRegistration),
            children: [
              TextButton(
                  onPressed: () {
                    _cubit.acceptError();
                    context.read<NavigationCubit>().pushToAuthScene();
                  },
                  child: const Text('Ок'))
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
