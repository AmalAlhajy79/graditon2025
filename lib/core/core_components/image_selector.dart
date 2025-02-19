import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import '../consts/app_colors.dart';
import '../file_manager/file_manager.dart';

class ImageSelector extends StatefulWidget {
  const ImageSelector({Key? key, this.onSelected}) : super(key: key);
  final ValueChanged<String?>? onSelected;
  @override
  State<ImageSelector> createState() => _ImageSelectorState();
}

class _ImageSelectorState extends State<ImageSelector> {

  String? path;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _tap,
      child: Container(
        margin: EdgeInsets.all(3.75.w),
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          shape: BoxShape.circle,
         // borderRadius: BorderRadius.circular(5.w),
          image: path != null ?
              DecorationImage(
                  image: FileImage(File(path!)),
                  fit: BoxFit.cover
              ):null
        ),
        child: Visibility(
          visible: path == null,
          child: Icon(
            Icons.add_a_photo_outlined,
            size: 15.w,
            color: AppColors.fontOnLight,
          ),
        ),
      ),
    );
  }

  void _tap()async{
    path = await FileManager().getFileImagePath();
    setState(() {
      widget.onSelected?.call(path);
    });
  }

}
