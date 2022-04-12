import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/news/cubit.dart';
import 'package:inst_mobile/ui/widget/widget.dart' as custom_widget;

import 'package:inst_mobile/resources/app_strings.dart';

class NewsScene extends StatelessWidget {
  const NewsScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      buildWhen: (previous, current) {
        context.read<NewsCubit>().loadData().then((value) {
          return true;
        });
        return false;
      },
      builder: (context, state) {
        var _cubit = context.read<NewsCubit>();
        if (state is NewsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is NewsLoadedState) {
          return Scaffold(
            appBar: AppBar(),
            body: Column(),
            bottomNavigationBar: const custom_widget.AppBottomBar(),
          );
        }
        if (state is NewsEmptyState) {
          return const SizedBox.shrink();
        }
        if (state is NewsErrorState) {
          return ErrorWidget(
            error: state.error,

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
    var _cubit = context.read<NewsCubit>();
    return AlertDialog(
      title: const Text(AppStrings.errorDialogTitle),
      content: Text(error),
      actions: [
        TextButton(onPressed: () => _cubit.acceptError(), child: Text('Ок'))
      ],
    );
  }
}
