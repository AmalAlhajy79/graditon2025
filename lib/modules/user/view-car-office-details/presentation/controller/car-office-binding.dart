import 'package:get/get.dart';

import 'car-office-controller.dart';
class UserCarOfficeDetailsBinding extends Bindings {

  @override
  void dependencies() {
    Get.put<UserCarOfficeDetailsController>(UserCarOfficeDetailsController());
  }

}