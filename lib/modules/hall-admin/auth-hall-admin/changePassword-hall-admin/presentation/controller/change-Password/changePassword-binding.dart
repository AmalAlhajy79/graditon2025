import 'package:get/get.dart';
import 'package:hall_gradition/modules/hall-admin/auth-hall-admin/changePassword-hall-admin/presentation/controller/change-Password/ChangePassword-Controller.dart';

class ChangePasswordAdminHallBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(ChangePasswordAdminHallController());
  }

}