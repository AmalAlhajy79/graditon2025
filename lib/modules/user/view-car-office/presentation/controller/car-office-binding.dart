import 'package:get/get.dart';

import 'car-office-controller.dart';
class HomeUserCarOfficeBinding extends Bindings {

  @override
  void dependencies() {
    Get.put<HomeUserCarOfficeController>(HomeUserCarOfficeController());
  }

}