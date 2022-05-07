import 'package:flutter/material.dart';
import 'package:inst_mobile/ui/styles/app_text_styles.dart';

class ProfileStatColumn extends StatelessWidget {
  const ProfileStatColumn({
    Key? key,
    required this.title,
    required this.count,
  }) : super(key: key);

  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          count.toString(),
          style: AppTextStyles.h3.black().bold600().size(15),
        ),
        const SizedBox(
          height: 1,
        ),
        Text(
          title,
          style: AppTextStyles.h3.black().size(14),
        )
      ],
    );
  }
}
