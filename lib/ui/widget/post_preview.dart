import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../resources/app_lists.dart';

class PostPreview extends StatelessWidget {
  const PostPreview({
    Key? key,
    required this.files,
  }) : super(key: key);
  final List<XFile>? files;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Center(
        child: SizedBox(
          width: 262,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SingleChildScrollView(
                physics: const PageScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(

                  children: files!=null? List.generate(files!.length, (index) {
                    var file = files![index];
                    var fileType = file.name.split('.').last;
                    if (AppLists.imageFormats.contains(fileType)) {
                      return
                        SizedBox(
                          height: 350,
                          child: Image.file(
                            File(file.path),

                          ),
                        );
                    }
                    else return SizedBox.shrink();
                  }):[],
                ),
              )),
        ),
      ),
    );
  }
}
