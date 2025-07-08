import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';

import '../controller/rejester-user/rejester-user-controller.dart';


class ChooseRoleDropdown extends GetView<RejesterUserControllerrr> {

  final List<String> options = ['owner', 'assistant', 'client','carSer'];

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

            height: 12.w,
            width: 86.w,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
              borderRadius: BorderRadius.all(Radius.circular(5.w))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Padding(
                  padding:  EdgeInsets.only(left: 2.w),
                  child: Row(
                    children: [
                      Icon(Icons.person_outline, size: 23),
                      SizedBox( width: 2.w),
                      Text('Chose your role'),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.keyboard_arrow_down_rounded, size: 28),
                    SizedBox( width: 3.w),
                  ],
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }
}
