import 'package:flutter/material.dart';
import 'package:inst_mobile/resources/app_colors.dart';

class BaseDialog extends StatefulWidget {
  const BaseDialog({
    Key? key,
    required this.child,
    required this.size,
  }) : super(key: key);

  final Widget child;
  final Size size;

  @override
  State<BaseDialog> createState() => _BaseDialogState();
}

class _BaseDialogState extends State<BaseDialog>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onDragStart: (details) {
        Navigator.of(context).pop();
      },
      onClosing: () {},
      animationController: animationController,
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
          height: widget.size.height,
          width: widget.size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              Align(
                alignment: Alignment.centerLeft,
                child: widget.child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
