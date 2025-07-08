import 'package:get/get.dart';
import 'package:hall_gradition/modules/user/inquiry/presentation/controller/user-inquiry-controller.dart';

//true code now
class ChatUserBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(ChatUserController());
  }

}