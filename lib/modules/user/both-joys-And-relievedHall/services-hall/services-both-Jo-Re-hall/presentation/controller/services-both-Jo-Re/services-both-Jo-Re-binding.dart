import 'package:get/get.dart';
import 'services-both-Jo-Re-hall-Controller.dart';

class BothJoysReHallBinding extends Bindings {

  @override
  void dependencies() {
    Get.put<BothJoysReHallController>(BothJoysReHallController());
  }

}