import 'package:get/get.dart';
import 'package:hall_gradition/modules/user/user-payment/presentation/controller/payment-user-controller.dart';

class PaymentUserBinding extends Bindings {

  @override
  void dependencies() {
    Get.put<PaymentUserController>(PaymentUserController());
  }

}