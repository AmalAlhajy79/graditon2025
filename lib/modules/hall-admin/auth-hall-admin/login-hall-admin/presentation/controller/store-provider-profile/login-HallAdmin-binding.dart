import 'package:get/get.dart';
import 'package:hall_gradition/modules/hall-admin/auth-hall-admin/login-hall-admin/presentation/controller/store-provider-profile/login-HallAdmin-controller.dart';

class LoginHallAdminBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(LoginHallAdminController());
  }

}