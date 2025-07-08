import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';

import '../../../../../core/consts/app_colors.dart';
import '../../../../../core/core_components/button.dart';

class BookingCarUserController extends GetxController {
  var selectedDate = Rx<DateTime?>(null);
  var selectedTime = Rx<TimeOfDay?>(null);
  var carType = RxString('Sedan');
  var carCount = RxInt(1);
  var pickupLocation = ''.obs;
  var destination = ''.obs;

  final TextEditingController pickupController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();
  final TextEditingController addition_descriptionController = TextEditingController();


  final List<String> carTypes = ['Sedan', 'SUV', 'Van'];

  Future<void> sendRequest() async {
    // final data = {
    //   'date': selectedDate.value.toString(),
    //   'time': selectedTime.value?.format(Get.context!),
    //   'pickup': pickupLocation.value,
    //   'destination': destination.value,
    //   'carType': carType.value,
    //   'carCount': carCount.value.toString(),
    // };

    // Simulate request (replace with real API)
    //await Future.delayed(Duration(seconds: 2));

    Get.defaultDialog(
      title: "",
      middleText: "Your request is pending",middleTextStyle: TextStyle(fontSize: 16),
      confirm:Padding(
        padding:  EdgeInsets.only(bottom: 4.w,top: 4.w),
        child: ButtonScreen( title:'OK' ,
          onTap: () { Get.back();},
          height: 9.w,
          weight: 18.w,
          colorContainer: AppColors.zayteGamiq,
        ),
      ),
    );
  }
}