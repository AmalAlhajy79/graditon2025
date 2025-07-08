import 'package:get/get.dart';
import 'package:hall_gradition/modules/user/user-Message-CarOffice/presentation/controller/user-Message-CarOffice-controller.dart';


class BookingUserBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(UserMessageCarOfficeController());
  }

}