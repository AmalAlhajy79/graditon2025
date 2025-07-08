import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import 'package:hall_gradition/modules/user/both-joys-And-relievedHall/services-hall/services-both-Jo-Re-hall/presentation/screens/cars-service-hall.dart';
import 'package:hall_gradition/modules/user/both-joys-And-relievedHall/services-hall/services-both-Jo-Re-hall/presentation/screens/promoVideo-service.dart';
import 'package:hall_gradition/modules/user/both-joys-And-relievedHall/services-hall/services-both-Jo-Re-hall/presentation/screens/protiction-photography-screen.dart';
import '../../../../../../../core/consts/app_colors.dart';
import '../../../../../../../core/core_components/button.dart';
import '../controller/payment-user-binding.dart';
import '../controller/payment-user-controller.dart';



//نهائي قسم الافراح
class ElectronicPaymentScreen extends GetView<PaymentUserController> {
  static const name = '/ElectronicPaymentScreen';
  static final page = GetPage(
      name: name,
      page: () => ElectronicPaymentScreen(),
      binding: PaymentUserBinding());

  @override
  Widget build(BuildContext context) {
   // Get.lazyPut<BothJoysReHallController>(() => BothJoysReHallController());
    //  final BothJoysReHallController controller = Get.find();
    var mq = MediaQuery.of(context).size;
    //   final BothJoysReHallController controller = Get.find();

    return Padding(
      padding: EdgeInsets.only(top: 69.w, right: 1.3.w, left: 1.3.w),
      child: ListView(
        children: [
          Container(
            height: mq.height * 20,
            width: mq.width * 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8.w),
                  topLeft: Radius.circular(8.w),
                ),
                color: AppColors.zayteFateh),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 3.w, right: 3.w),
                  child: Container(
                    height: mq.height * 0.80,
                    width: mq.width * 0.90,
                    // color: Colors.red,
                    child: ListView(
                      children: [

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

