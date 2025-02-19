import 'package:get/get.dart';
import 'home-hall-admin-Controller.dart';

class HomeHallAdminBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(HomeHallAdminController());
  }

}