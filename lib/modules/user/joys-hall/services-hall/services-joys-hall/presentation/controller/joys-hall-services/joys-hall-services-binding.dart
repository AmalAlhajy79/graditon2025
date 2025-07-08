import 'package:get/get.dart';
import 'joys-hall-services-Controller.dart';

class JoysHallServicesBinding extends Bindings {

  @override
  void dependencies() {
    Get.put<JoysHallServicesController>(JoysHallServicesController());
  }

}