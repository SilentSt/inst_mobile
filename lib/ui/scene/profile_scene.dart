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
        builder: (context, state) {
          if(state is ProfileLoadingState)
            {
              return const CircularProgressIndicator();
            }
          if(state is ProfileLoadedState)
            {
              return Column();
            }
          if(state is ProfileEmptyState)
            {
              return const SizedBox.shrink();
            }
          if(state is ProfileErrorState)
            {
              return const custom_widget.ErrorWidget(error: AppStrings.unhandledException);
            }

          return const custom_widget.ErrorWidget(
            error: AppStrings.unhandledException,
          );
        });
  }
}
