import 'package:get/get.dart';
import '../../../data/data_source/myHalls-admin-data-source.dart';
import 'myHallsAdmin-Controller.dart';

class MyHallAdminBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(PendingAssistantController());
    Get.put(MyHallAdminController());
 // Get.lazyPut<PendingAssistantController>(() => PendingAssistantController());
 // Get.put<ApprovedAssistantController>(ApprovedAssistantController());
  // @override
  // void dependencies() {
  //   Get.put(PendingAssistantController());
 }

}