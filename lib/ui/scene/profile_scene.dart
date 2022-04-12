import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/profile/cubit.dart';
import 'package:inst_mobile/ui/widget/widget.dart' as custom_widget;
import 'package:inst_mobile/resources/app_strings.dart';

class ProfileScene extends StatelessWidget {
  const ProfileScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
        buildWhen: (previous, current) {
      context.read<ProfileCubit>().loadData().then((value) {
        return true;
      });
      return false;
    }, builder: (context, state) {
      var _cubit = context.read<ProfileCubit>();
      if (state is ProfileLoadingState) {
        return const CircularProgressIndicator();
      }
      if (state is ProfileLoadedState) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(),
          bottomNavigationBar: const custom_widget.AppBottomBar(),
        );
      }
      if (state is ProfileEmptyState) {
        return const SizedBox.shrink();
      }
      if (state is ProfileErrorState) {
        return ErrorWidget(
          error: AppStrings.unhandledException,
        );
      }
      return const Center(child: CircularProgressIndicator());
    });
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({Key? key, required this.error}) : super(key: key);

  final String error;

  @override
  Widget build(BuildContext context) {
    var _cubit = context.read<ProfileCubit>();
    return AlertDialog(
      title: Text(AppStrings.errorDialogTitle),
      content: Text(error),
      actions: [
        TextButton(onPressed: () => _cubit.acceptError(), child: Text('Ок'))
      ],
    );
  }
}
