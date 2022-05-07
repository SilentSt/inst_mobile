import 'package:flutter/cupertino.dart';
import 'package:image_network/image_network.dart';

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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(children: [
          Text(
            user.followersCount.toString(),
            style: AppTextStyles.h3.black(),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            AppStrings.followers,
            style: AppTextStyles.h3.black(),
          )
        ]),
        ImageNetwork(image: user.photo, height: 100, width: 100, borderRadius: BorderRadius.circular(90)),
        Column(children: [
          Text(
            user.followingCount.toString(),
            style: AppTextStyles.h3.black(),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            AppStrings.followed,
            style: AppTextStyles.h3.black(),
          )
        ]),
      ],
    );
  }
}