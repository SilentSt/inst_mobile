import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:inst_mobile/resources/app_colors.dart';
import 'package:inst_mobile/ui/widget/profile_widgets/profile_stat_column.dart';

import '../../../data/models/user.dart';
import '../../../resources/app_strings.dart';
import '../../styles/app_text_styles.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key? key,
    required this.user,
  }) : super(key: key);

  final GetFullMe user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.lightGrey,
            ),
            borderRadius: BorderRadius.circular(90),
          ),
          padding: EdgeInsets.all(2),
          child: ImageNetwork(
            image: user.photo,
            height: 110,
            width: 110,
            borderRadius: BorderRadius.circular(90),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: (MediaQuery.of(context).size.width) / 3,
              child: ProfileStatColumn(
                title: AppStrings.publications,
                count: user.postsCount,
              ),
            ),
            SizedBox(
              width: (MediaQuery.of(context).size.width) / 3,
              child: ProfileStatColumn(
                title: AppStrings.followers,
                count: user.followersCount,
              ),
            ),
            SizedBox(
              width: (MediaQuery.of(context).size.width) / 3,
              child: ProfileStatColumn(
                title: AppStrings.followed,
                count: user.followingCount,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
