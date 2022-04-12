import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/global_search/cubit.dart';
import 'package:inst_mobile/ui/widget/widget.dart' as custom_widget;
import '../../resources/app_strings.dart';

class GlobalSearchScene extends StatelessWidget {
  const GlobalSearchScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalSearchCubit, GlobalSearchState>(
      buildWhen: (previous, current) {
        context.read<GlobalSearchCubit>().loadData().then((value) {
          return true;
        });
        return false;
      },
      builder: (context, state) {
        var _cubit = context.read<GlobalSearchCubit>();
        if (state is GlobalSearchLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is GlobalSearchLoadedState) {
          return Scaffold(
            appBar: AppBar(),
            body: Column(),
            bottomNavigationBar: const custom_widget.AppBottomBar(),
          );
        }
        if (state is GlobalSearchEmptyState) {
          return const SizedBox.shrink();
        }
        if (state is GlobalSearchErrorState) {
          return ErrorWidget(
            error: state.error,
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({Key? key, required this.error}) : super(key: key);

  final String error;

  @override
  Widget build(BuildContext context) {
    var _cubit = context.read<GlobalSearchCubit>();
    return AlertDialog(
      title: Text(AppStrings.errorDialogTitle),
      content: Text(error),
      actions: [
        TextButton(onPressed: () => _cubit.acceptError(), child: Text('Ок'))
      ],
    );
  }
}
