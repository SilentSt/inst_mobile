import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/news/cubit.dart';
import 'package:inst_mobile/ui/widget/widget.dart' as custom_widget;

import 'package:inst_mobile/resources/app_strings.dart';

class NewsScene extends StatelessWidget{
  const NewsScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(builder: (context, state) {
      if(state is NewsLoadingState){
        return const CircularProgressIndicator();
      }
      if(state is NewsLoadedState){
        return Column();
      }
      if(state is NewsEmptyState){
        return const SizedBox.shrink();
      }
      if(state is NewsErrorState){
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