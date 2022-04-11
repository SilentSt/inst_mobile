import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/registration/cubit.dart';
import 'package:inst_mobile/ui/scene/auth_scene.dart';
import 'package:inst_mobile/ui/widget/widget.dart' as custom_widget;
import 'package:inst_mobile/resources/app_strings.dart';

class RegistrationScene extends StatelessWidget {
  const RegistrationScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      builder: (context, state) {
        if (state is RegistrationLoadingState) {
          return const CircularProgressIndicator();
        }
        if (state is RegistrationLoadedState) {
          return SafeArea(child: Column());
        }
        if (state is RegistrationWrongDataState) {
          return custom_widget.ErrorWidget(error: state.error);
        }
        if (state is RegistrationErrorState) {
          return custom_widget.ErrorWidget(
            error: state.error,
          );
        }
        if (state is RegistrationSuccessState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AuthScene()));
        }
        return const custom_widget.ErrorWidget(
          error: AppStrings.unhandledException,
        );
      },
    );
  }
}
