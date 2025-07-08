import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hall_gradition/core/consts/app_colors.dart';
import 'package:hall_gradition/core/core_components/textUtiles.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import '../controller/booking-controller.dart';

class CustomRow extends StatelessWidget {
  final String text;
  final int index;
  final String ?price;
  final BookingUserController controller;

  CustomRow({required this.text, required this.index, required this.controller,this.price});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isSelected = controller.selectedCircles[index] ?? false;
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextUtiles(title:text,fontWeight: FontWeight.w400,fontSize: 17),
          SizedBox(width: 5.w),
          GestureDetector(
            onTap: () => controller.toggleCircle(index),
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? AppColors.zayteGamiq : Colors.white,
                border: Border(left: BorderSide(width: 1),top: BorderSide(width: 1),right: BorderSide(width: 1),bottom: BorderSide(width: 1))
              ),
            ),
          ),
          SizedBox(width: 22.w),
          Container(
            height: 10.w,
            width: 13.w,
           // padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
      borderRadius: BorderRadius.all(Radius.circular(1.w))
              ),

            child: Center(
              child: TextUtiles(
                title: '$price',
                colorTextStyle: Colors.black,fontSize: 16),
            ),

          ),
        ],
      );
    });
  }
}
