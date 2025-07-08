import 'package:get/get.dart';
import 'fetch-userBooking-controller.dart';

class FetchBookingUserHallBinding extends Bindings {

  @override
  void dependencies() {
    Get.put<FetchBookingUserHallController>(FetchBookingUserHallController());
  }

}