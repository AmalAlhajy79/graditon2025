import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hall_gradition/core/consts/app_colors.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';

import '../../../../../../../core/core_components/textUtiles.dart';
import '../controller/joys-hall-services/joys-hall-services-Controller.dart';

class TextAndCheckBoxScreen extends StatelessWidget {
  String title;
  bool value;
  double? fontSize;
  Function (bool?) onChanged;
  TextAndCheckBoxScreen(
      {required this.title,
      required this.value,
        this.fontSize,
        required this.onChanged
      });

  @override
  Widget build(BuildContext context) {
    JoysHallServicesController controller=JoysHallServicesController();
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtiles(
            title: title,
            fontWeight: FontWeight.w500,
            fontSize:fontSize!=null?fontSize: 16,
            colorTextStyle: Colors.black87,
          ),
          Checkbox(
              value:value,
              onChanged:onChanged,
                  checkColor: Colors.white,
                  activeColor:Colors.green,
            ),
        ],
      );
  }
}
