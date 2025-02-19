import 'package:get/get.dart';
import 'EditProfile-HallAdmin-Controller.dart';

class EditProfileAdminHallBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(EditProfileHallAdminController());
  }

}