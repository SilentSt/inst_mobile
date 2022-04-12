import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/navigation/cubit.dart';
import 'package:inst_mobile/cubit/registration/cubit.dart';
import 'package:inst_mobile/ui/controllers/text_editing_controllers.dart';
import 'package:inst_mobile/ui/scene/auth_scene.dart';
import 'package:inst_mobile/ui/widget/widget.dart' as custom_widget;
import 'package:inst_mobile/resources/app_strings.dart';

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
            body: SafeArea(
                child: Column(
              children: [
                Text("logn"),
                TextField(
                  controller: RegistrationSceneControllers.loginController,
                ),
                Text("password"),
                TextField(
                    controller:
                        RegistrationSceneControllers.passwordController),
                Text("nickname"),
                TextField(
                    controller:
                        RegistrationSceneControllers.nicknameController),
                TextButton(
                    onPressed: () {
                      _cubit.registrate(
                          username:
                              RegistrationSceneControllers.loginController.text,
                          password: RegistrationSceneControllers
                              .passwordController.text,
                          nickname: RegistrationSceneControllers
                              .nicknameController.text);
                    },
                    child: Text("registrate"))
              ],
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
              TextButton(onPressed: (){
                context.read<NavigationCubit>().pushToAuthScene();
              }, child: const Text('Ок'))
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
