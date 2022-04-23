import 'package:flutter/cupertino.dart';

import '../../data/models/user.dart';
import '../styles/app_text_styles.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
    required this.user,
  }) : super(key: key);

  final GetFullUser user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '@' + user.nickname,
          style: AppTextStyles.h2.black(),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 280,
          child: Text(
            'Если у тебя получилось обмануть человека, это не значит, что он дурак, это значит, что тебе доверяли больше, чем ты этого заслуживаешь',
            style: AppTextStyles.h4.grey(),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}