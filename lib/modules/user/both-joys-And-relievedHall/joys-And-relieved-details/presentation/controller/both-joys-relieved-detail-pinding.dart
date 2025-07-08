import 'package:get/get.dart';

import 'both-joys-relived-details-controller.dart';

class BothDetailsJoysReHallBinding extends Bindings {

  @override
  void dependencies() {
    Get.put<BothDetailsJoysReHallController>(BothDetailsJoysReHallController());
  }

}