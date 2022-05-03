import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inst_mobile/cubit/auth/cubit.dart';
import 'package:inst_mobile/cubit/navigation/cubit.dart';
import 'package:inst_mobile/resources/app_colors.dart';
import 'package:inst_mobile/resources/app_strings.dart';
import 'package:inst_mobile/ui/controllers/text_editing_controllers.dart';
import 'package:inst_mobile/ui/styles/app_text_styles.dart';
import 'package:inst_mobile/ui/widget/custom_buttons.dart';
import 'package:inst_mobile/ui/widget/custom_text_field.dart';

import '../widget/custom_error_widget.dart';

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
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(30),
            child: AppBar(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 0,
            ),
          ),
          body: SafeArea(
              child: SingleChildScrollView(
            child: SizedBox(
              height: size.height-60,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(AppStrings.logonIconPath),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: AppColors.lightGreen,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                child: Text(
                                  AppStrings.loginTitle,
                                  textAlign: TextAlign.center,
                                  style:
                                      AppTextStyles.h1.green().bold900().size(30),
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
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  TextButton(
                      onPressed: () {
                        context.read<NavigationCubit>().pushToRegistrationScene();
                      },
                      child: Row( mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.notAccount,
                            style: AppTextStyles.h4.black().bold900(),
                          ),
                          Text(
                            AppStrings.registerSuggestion,
                            style: AppTextStyles.h4.green().bold900().underline(),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          )),
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
