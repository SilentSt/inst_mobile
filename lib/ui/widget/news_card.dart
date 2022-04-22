import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/news/cubit.dart';
import 'package:inst_mobile/resources/app_colors.dart';
import 'package:inst_mobile/resources/app_strings.dart';
import 'package:inst_mobile/ui/styles/app_text_styles.dart';
import 'package:inst_mobile/ui/widget/user_icon.dart';

import 'content_card.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({Key? key, required this.index})
      : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    var _cubit = context.read<NewsCubit>();
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      elevation: 0,
      color: AppColors.lightGreen,
      margin: const EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          Row(
            children: [
              //TODO: change to dynamic from NewsCubit
              const UserIcon(path: _cubit.followingPosts[index]., size: 36),
              const SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  //TODO: change to dynamic from NewsCubit
                  Text(
                    AppStrings.userName,
                    style: AppTextStyles.h1,
                  ),
                  //TODO: change to dynamic from NewsCubit
                  Text(
                    AppStrings.userNickName,
                    style: AppTextStyles.h2,
                    textAlign: TextAlign.left,
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 15),
          //TODO: change to network loading, change to dynamic linc from NewsCubit
          ContentCard(postIndex: index)
        ]),
      ),
    );
  }
}


