import 'package:get/get.dart';
import 'package:hall_gradition/modules/hall-admin/auth-hall-admin/verification-hall-admin/presentation/controller/change-Password/verefication-HallAdmin-Controller.dart';

class ChangePasswordAdminHallBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(vereficationHallAdminController());
  }

}