import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/news/cubit.dart';
import 'package:inst_mobile/resources/app_colors.dart';
import 'package:inst_mobile/resources/app_strings.dart';
import 'package:inst_mobile/ui/widget/custom_app_bar.dart';
import 'package:inst_mobile/ui/widget/widget.dart' as custom_widget;
import '../widget/custom_error_widget.dart';
import '../widget/history_bar.dart';
import '../widget/news_feed.dart';

class NewsScene extends StatelessWidget {
  const NewsScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        var _cubit = context.read<NewsCubit>();
        if (state is NewsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is NewsLoadedState) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  PreferredSize(
                      preferredSize:
                          Size(MediaQuery.of(context).size.width, 50),
                      child: const CustomAppBar()),
                  _cubit.followingHistories.isEmpty
                      ? const SizedBox.shrink()
                      : const HistoryBar(),
                  const NewsFeed()
                ],
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
                onPressed: () {},
                backgroundColor: AppColors.lightGreen,
                child: const Icon(Icons.add, size: 30)),
            bottomNavigationBar: const custom_widget.AppBottomBar(),
          );
        }
        if (state is NewsEmptyState) {
          return const SizedBox.shrink();
        }
        if (state is NewsErrorState) {
          return CustomErrorWidget(
              error: state.error, action: _cubit.acceptError);
        }
        context.read<NewsCubit>().loadData();
        return const SizedBox.shrink();
      },
    );
  }
}
