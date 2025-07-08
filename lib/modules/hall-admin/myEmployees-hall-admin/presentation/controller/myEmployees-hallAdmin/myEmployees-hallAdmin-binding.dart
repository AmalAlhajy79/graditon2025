import 'package:get/get.dart';
import '../../../data/data_source/myEmployees-hall-admin-data-source.dart';
import 'myEmployees-hallAdmin-Controller.dart';

class MyEmployeesAdminHallBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(PendingAssistantController());
    Get.put(ApprovedAssistantController());
 // Get.lazyPut<PendingAssistantController>(() => PendingAssistantController());
 // Get.put<ApprovedAssistantController>(ApprovedAssistantController());
  // @override
  // void dependencies() {
  //   Get.put(PendingAssistantController());
 }

}