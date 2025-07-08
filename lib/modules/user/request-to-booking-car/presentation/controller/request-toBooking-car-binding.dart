import 'package:get/get.dart';
import 'package:hall_gradition/modules/user/request-to-booking-car/presentation/controller/request-tobooking-car-controller.dart';

class BookingCarUserBinding extends Bindings {

  @override
  void dependencies() {
    Get.put<BookingCarUserController>(BookingCarUserController());
  }

}