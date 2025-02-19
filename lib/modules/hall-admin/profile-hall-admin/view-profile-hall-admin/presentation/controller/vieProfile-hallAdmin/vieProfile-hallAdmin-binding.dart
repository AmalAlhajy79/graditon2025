import 'package:get/get.dart';
import 'vieProfile-hallAdmin-Controller.dart';

class ViewProfileAdminHallBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(ViewProfileHallAdminController());
  }

}