import 'package:get/get.dart';

import 'home-user-controller.dart';

class HomeUserBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<HomeUserController>(() => HomeUserController());
  }

}