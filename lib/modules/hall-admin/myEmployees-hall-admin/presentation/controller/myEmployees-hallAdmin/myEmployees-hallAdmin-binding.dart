import 'package:get/get.dart';
import 'myEmployees-hallAdmin-Controller.dart';

class MyEmployeesAdminHallBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(MyEmployeesHallAdminController());
  }

}