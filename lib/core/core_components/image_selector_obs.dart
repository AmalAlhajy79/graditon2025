import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import '../consts/app_colors.dart';
import '../file_manager/file_manager.dart';

class ImageSelectorObs extends StatelessWidget {
  const ImageSelectorObs({Key? key, this.onSelected}) : super(key: key);
  final ValueChanged<String?>? onSelected;
  static final Rx<String> path = '-'.obs;// use obs only on controllers


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _tap,
      child: Obx(() {
        return Container(
          margin: EdgeInsets.all(3.75.w),
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(5.w),
              image: path.value != '-' ?
              DecorationImage(
                  image: FileImage(File(path.value)),
                  fit: BoxFit.cover
              ):null
          ),
          child: Visibility(
            visible: path.value == '-',
            child: Icon(
              Icons.add_a_photo_outlined,
              size: 15.w,
              color: AppColors.fontOnLight,
            ),
          ),
        );
      }
      )
    );
  }

  void _tap()async {
    path.value = (await FileManager().getFileImagePath()) ?? '-';
    String? val ;
    if(path.value != '-') {
      val = path.value;
      print(path.value);
    }

    onSelected?.call(val);
  }


}
