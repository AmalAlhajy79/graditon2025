import 'package:get/get.dart';

import 'booking-controller.dart';

class BookingUserBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(BookingUserController());
  }

}