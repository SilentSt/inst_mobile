import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/navigation/cubit.dart';
import 'package:inst_mobile/cubit/registration/cubit.dart';
import 'package:inst_mobile/resources/app_colors.dart';
import 'package:inst_mobile/ui/controllers/text_editing_controllers.dart';
import 'package:inst_mobile/ui/styles/app_text_styles.dart';
import 'package:inst_mobile/ui/widget/custom_buttons.dart';
import 'package:inst_mobile/ui/widget/custom_text_field.dart';
import 'package:inst_mobile/resources/app_strings.dart';

class RegistrationScene extends StatelessWidget {
  const RegistrationScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      builder: (context, state) {
        var size = MediaQuery.of(context).size;
        var _cubit = context.read<RegistrationCubit>();
        if (state is RegistrationLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is RegistrationLoadedState) {
          return Scaffold(
            body: SafeArea(
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: size.height*0.9,
                    child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                    Image.asset(AppStrings.logonIconPath),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: AppColors.lightGreen,
                      child: Column(children: [
                        Text(AppStrings.registrationTitle,
                            style: AppTextStyles.h1.copyWith(
                                fontSize: 38,
                                fontWeight: FontWeight.w900,
                                color: AppColors.darkGreen)),
                        CustomTextField(
                            title: AppStrings.emailTitle,
                            controller:
                                RegistrationSceneControllers.loginController),
                        CustomTextField(
                            title: AppStrings.passwordTitle,
                            controller:
                                RegistrationSceneControllers.passwordController),
                        CustomTextField(
                            title: AppStrings.nickName,
                            controller:
                                RegistrationSceneControllers.nicknameController),
                        CustomDarkButton(
                          func: () {
                            _cubit.registrate(
                                username: RegistrationSceneControllers
                                    .loginController.text,
                                password: RegistrationSceneControllers
                                    .passwordController.text,
                                nickname: RegistrationSceneControllers
                                    .nicknameController.text);
                          },
                          size: size,
                          text: AppStrings.registerButton,
                        )
                      ]),
                    ),
                    SizedBox(
                      height: size.height * 0.2,
                    )
              ],
            ),
                  ),
                )),
          );
        }
        if (state is RegistrationWrongDataState) {
          return ErrorWidget(
            error: state.error,
          );
        }
        if (state is RegistrationErrorState) {
          return ErrorWidget(
            error: state.error,
          );
        }
        if (state is RegistrationSuccessState) {
          return SimpleDialog(
            title: const Text(AppStrings.successRegistration),
            children: [
              TextButton(
                  onPressed: () {
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

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({Key? key, required this.error}) : super(key: key);

  final String error;

  @override
  Widget build(BuildContext context) {
    var _cubit = context.read<RegistrationCubit>();
    return AlertDialog(
      title: Text(AppStrings.errorDialogTitle),
      content: Text(error),
      actions: [
        TextButton(onPressed: () => _cubit.acceptError(), child: Text('Ок'))
      ],
    );
  }
}
