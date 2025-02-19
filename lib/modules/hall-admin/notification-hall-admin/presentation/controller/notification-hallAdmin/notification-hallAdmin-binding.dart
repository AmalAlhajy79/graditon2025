import 'package:get/get.dart';
import 'notification-hallAdmin-Controller.dart';

class NotificationAdminHallBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(NotificationHallAdminController());
  }

}