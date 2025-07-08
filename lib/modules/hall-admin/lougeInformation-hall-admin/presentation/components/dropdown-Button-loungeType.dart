import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';

import '../controller/lougeInformation-hall-admin/lougeInformation-hall-admin-controller.dart';

class loungeTypeDropdown extends GetView<HallControllerrr> {

  final List<String> options = ['joys', 'sorrows', 'both'];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PopupMenuButton<String>(
          onSelected: (value) {
            controller.toggleValue(value);
          },
          itemBuilder: (BuildContext context) {
            return options.map((String option) {
              return PopupMenuItem<String>(
                value: option,
                child: Obx(() { // Wrap the Checkbox in Obx
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(option),
                      Checkbox(
                        value: controller.isSelected(option),
                        onChanged: (bool? value) {
                          controller.toggleValue(option);
                          // add bellow line

                        },
                        checkColor: Colors.white,
                        activeColor: Colors.green,
                      ),
                    ],
                  );
                }),
              );
            }).toList();
          },
          child: Container(
            // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            // decoration: BoxDecoration(
            //   border: Border.all(color: Colors.grey),
            //   borderRadius: BorderRadius.circular(8),
            // ),
            height: 12.w,
            width: 86.w,
            decoration: BoxDecoration(
                color: Colors.white,
                border:Border(bottom: BorderSide(color: Colors.black54,width: 1))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Padding(
                  padding:  EdgeInsets.only(left: 2.w),
                  child: Text('chose the lounge type'),
                ),
                Icon(Icons.arrow_drop_down, size: 25),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
