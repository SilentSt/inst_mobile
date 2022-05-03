import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inst_mobile/cubit/navigation/cubit.dart';
import 'package:inst_mobile/cubit/registration/cubit.dart';
import 'package:inst_mobile/resources/app_colors.dart';
import 'package:inst_mobile/ui/controllers/text_editing_controllers.dart';
import 'package:inst_mobile/ui/styles/app_text_styles.dart';
import 'package:inst_mobile/ui/widget/custom_buttons.dart';
import 'package:inst_mobile/ui/widget/custom_text_field.dart';
import 'package:inst_mobile/resources/app_strings.dart';

import '../widget/custom_error_widget.dart';

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
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              shadowColor: Colors.transparent,
              leading: IconButton(icon:SvgPicture.asset(AppStrings.arrowBackPath,), onPressed: (){ context.read<NavigationCubit>().pushToAuthScene(); },),
            ),
            body: SafeArea(
                child: SingleChildScrollView(
                  child: Expanded(
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                      SvgPicture.asset(AppStrings.logonIconPath),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          color: AppColors.lightGreen,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 15),
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
                                      RegistrationSceneControllers.passwordController,
                                  obfuscation: true,),
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
                        ),
                      ),
                      SizedBox(
                          height: size.height * 0.01,
                        ),
                      
              ],
            ),
                    ),
                  ),
                )),
          );
        }
        if (state is RegistrationWrongDataState) {
          return CustomErrorWidget(
            error: state.error,
            action: (){
              context.read<NavigationCubit>().pushToAuthScene();
            },
          );
        }
        if (state is RegistrationErrorState) {
          return CustomErrorWidget(
            error: state.error,
            action: (){
              context.read<NavigationCubit>().pushToAuthScene();
            },
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
