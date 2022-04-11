import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/global_search/cubit.dart';
import 'package:inst_mobile/ui/widget/widget.dart' as custom_widget;

import '../../resources/app_strings.dart';

class GlobalSearchScene extends StatelessWidget{
  const GlobalSearchScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalSearchCubit, GlobalSearchState>(builder: (context, state) {
      if(state is GlobalSearchLoadingState){
        return const CircularProgressIndicator();
      }
      if(state is GlobalSearchLoadedState){
        return Column();
      }
      if(state is GlobalSearchEmptyState){
        return const SizedBox.shrink();
      }
      if(state is GlobalSearchErrorState){
        return custom_widget.ErrorWidget(
          error: state.error,
        );
      }
      return const custom_widget.ErrorWidget(
        error: AppStrings.unhandledException,
      );
    },);
  }

}