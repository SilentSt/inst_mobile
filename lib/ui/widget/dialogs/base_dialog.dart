import 'package:flutter/material.dart';
import 'package:inst_mobile/resources/app_colors.dart';

class BaseDialog extends StatelessWidget {
  const BaseDialog({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 6,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: AppColors.accentColor,
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
