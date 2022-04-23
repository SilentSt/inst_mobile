import 'package:flutter/material.dart';
import 'package:inst_mobile/resources/app_colors.dart';
import 'package:inst_mobile/ui/styles/app_text_styles.dart';

class FilePickerField extends StatelessWidget {
  const FilePickerField({required this.title, required this.func,required this.choosedFiles}) : super();
  final String title;
  final String choosedFiles;
  final Function func;
  static final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: AppColors.darkGreen, width: 4)),
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [ Padding(
                    padding: EdgeInsets.fromLTRB(16,14,0,0),
                    child: Text(choosedFiles,
                      style: AppTextStyles.h4.green().font(),
                      textAlign: TextAlign.left,

                    ),
              ),
              IconButton(
                onPressed: () {
                  func();
                },
                icon:
                    const Icon(Icons.add, size: 32, color: AppColors.darkGreen),
              )
            ]),
      ),
    );
  }
}
