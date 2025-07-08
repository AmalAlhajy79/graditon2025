import 'package:get/get.dart';
import 'login-client-controller.dart';

class LoginClientBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(LoginClientController());
  }

}