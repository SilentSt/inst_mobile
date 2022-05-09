import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/news/cubit.dart';
import 'package:inst_mobile/resources/app_colors.dart';
import 'package:inst_mobile/ui/widget/news_widgets/news_app_bar.dart';
import 'package:inst_mobile/ui/widget/shimers/news_shimmer.dart';
import '../widget/app_bottom_bar.dart';
import '../widget/app_error.dart';
import '../widget/history_widgets/history_bar.dart';
import '../widget/news_widgets/news_feed.dart';

class NewsScene extends StatelessWidget {
  const NewsScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _cubit = context.read<NewsCubit>();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 50),
        child: const NewsAppBar(),
      ),
      backgroundColor: AppColors.snow,
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is NewsLoadingState) {
            return NewsShimmer();
          }
          if (state is NewsLoadedState || state is NewsLikesLoadingState) {
            return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: const NewsFeed());
          }
          if (state is NewsEmptyState) {
            return NewsShimmer();
          }
          if (state is NewsErrorState) {
            return AppError(error: state.error, action: _cubit.acceptError);
          }
          context.read<NewsCubit>().loadData();
          return NewsShimmer();
        },
      ),
      bottomNavigationBar: const AppBottomBar(
        homePage: true,
      ),
    );
  }
}
