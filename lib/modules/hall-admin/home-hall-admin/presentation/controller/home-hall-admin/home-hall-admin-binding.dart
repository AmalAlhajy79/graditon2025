import 'package:get/get.dart';
import 'home-hall-admin-Controller.dart';

class HallDetailsAdminBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(HallDetailsAdminController());
  }

}