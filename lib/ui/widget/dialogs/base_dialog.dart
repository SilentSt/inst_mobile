import 'package:flutter/material.dart';
import 'package:inst_mobile/resources/app_colors.dart';

class BaseDialog extends StatelessWidget {
  const BaseDialog({
    Key? key,
    required this.child,
    required this.size,
  }) : super(key: key);

  final Widget child;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      enableDrag: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: size.height,
          width: size.width,
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
              const SizedBox(
                height: 24,
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
