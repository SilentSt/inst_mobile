import 'package:flutter/cupertino.dart';

import '../../../data/models/user.dart';
import '../../styles/app_text_styles.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
    required this.user,
  }) : super(key: key);

  final GetFullMe user;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '@' + user.nickname,
              style: AppTextStyles.h2.black().bold900(),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              user.bio == null
                  ? 'Здесь мог бы быть замечательный статус'
                  : user.bio!,
              style: AppTextStyles.h3.black(),
            ),
          ],
        ),
      ),
    );
  }
}
