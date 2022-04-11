import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/initial/cubit.dart';
import 'package:inst_mobile/resources/app_strings.dart';
import 'package:inst_mobile/ui/scene/auth_scene.dart';
import 'package:inst_mobile/ui/widget/widget.dart' as custom_widget;

class InitialScene extends StatelessWidget {
  const InitialScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitialCubit, InitialState>(builder: (context, state) {
      if (state is InitialLoadingState) {
        return const CircularProgressIndicator();
      }
      if (state is InitialLoadedState) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AuthScene()));
      }
      if (state is InitialErrorState) {
        return custom_widget.ErrorWidget(error: (state).error);
      }
      return const custom_widget.ErrorWidget(
        error: AppStrings.unhandledException,
      );
    });
  }
}
