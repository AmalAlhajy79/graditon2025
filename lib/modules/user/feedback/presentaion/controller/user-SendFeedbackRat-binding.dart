import 'package:get/get.dart';
import 'package:hall_gradition/modules/user/feedback/presentaion/controller/user-SendFeedbackRat-controller.dart';


class SendFeedbackRatUserBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(FeedbackController());
  }

}