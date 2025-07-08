import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import 'package:hall_gradition/modules/user/both-joys-And-relievedHall/services-hall/services-both-Jo-Re-hall/presentation/screens/relieved.dart';
import 'package:hall_gradition/modules/user/user-payment/presentation/component/cash-payment-page.dart';
import 'package:hall_gradition/modules/user/user-payment/presentation/component/electronic-payment-page.dart';
import '../../../../../../../core/consts/app_colors.dart';
import '../../../../../../../core/core_components/app_scaffold.dart';
import '../../../../../../../core/core_components/button.dart';
import '../../../../../../../core/core_components/textUtiles.dart';
import '../../../fetch-user-MyBooking/presentation/controller/fetch-userBooking-controller.dart';
import '../controller/payment-user-binding.dart';
import '../controller/payment-user-controller.dart';

class PaymentScreen extends GetView<PaymentUserController> {
  static const name = '/PaymentScreen';
  static final page = GetPage(
      name: name, page: () => PaymentScreen(), binding: PaymentUserBinding());

   final PaymentUserController controller = Get.put(PaymentUserController());

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut<BothJoysReHallController>(() => BothJoysReHallController());
    var mq = MediaQuery.of(context).size;
    return AppScaffold(
      body: Stack(
        children: [
          Container(
            height: mq.height,
            width: mq.width,
            color: Colors.grey.shade200,
            child: Padding(
              padding: EdgeInsets.only(bottom: 151.w, left: 2.w, right: 12.w),
              child: Container(
                height: 4.w,
                width: 4.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_sharp,
                        color: Colors.black,
                        size: 26,
                      ),
                    ),
                    SizedBox(
                      width: 18.w,
                    ),
                    Obx(() => TextUtiles(
                          title: controller.type_payment.toString(),
                          fontSize: 18.5,
                          fontWeight: FontWeight.w500,
                        ))
                    // TextUtiles(
                    //   title: controller.type_payment.toString(),
                    //   fontSize: 18,
                    //   fontWeight: FontWeight.w500,
                    // )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 101.w, right: 7.w, left: 8.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    TextUtiles(title: 'Full amount : ', fontSize: 17),
                    SizedBox(
                      width: 6.w,
                    ),
                    Container(
                      height: 7.5.w,
                      width: 24.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.w)),
                          color: Colors.blueGrey.shade100),
                      child: Center(
                          child: TextUtiles(
                        title: '9000\$',
                        fontSize: 14.5,
                        fontWeight: FontWeight.w500,
                      )),
                    )
                  ],
                ),
                SizedBox(
                  height: 3.w,
                ),
                Row(
                  children: [
                    TextUtiles(title: 'The Horrors : ', fontSize: 17),
                    SizedBox(
                      width: 6.w,
                    ),
                    Container(
                      height: 7.5.w,
                      width: 24.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.w)),
                          color: Colors.blueGrey.shade100),
                      child: Center(
                          child: TextUtiles(
                        title: '2500\$',
                        fontSize: 14.5,
                        fontWeight: FontWeight.w500,
                      )),
                    )
                  ],
                ),
                SizedBox(
                  height: 3.w,
                ),
                Row(
                  children: [
                    TextUtiles(title: 'Payment ', fontSize: 17.8),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 53.w, right: 7.w, left: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Obx(() {
                    return ButtonScreen(
                      title: 'Electronic payment',
                      onTap: () {
                        controller.showElectronicPage();
                      },
                      colorTextStyle: Colors.black87,
                      // colorContainer: controller.isPaymentTypeSelected.value
                      //     ? AppColors.zayteFateh
                      //     : AppColors.white,
                      fontSize: 15,
                      height: 11.w,
                      //only(topLeft: Radius.circular(7), bottomLeft: Radius.circular(7)),
                      fontWeight: FontWeight.w500,
                      decoration: BoxDecoration(
                        color:  controller.isPaymentTypeSelected.value
                            ? AppColors.zayteFateh
                            : AppColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10.w)),
                          border: Border(
                              bottom: BorderSide(color: Colors.black54,width: 2),
                              right: BorderSide(color: Colors.black54),
                              left: BorderSide(color: Colors.black54),
                              top: BorderSide(color: Colors.black54,width: 1))),
                    );
                  }),
                ),
                SizedBox(
                  width: 3.w,
                ),
                Expanded(
                  child: Obx(() {
                    return ButtonScreen(
                      title: 'Cash payment',
                      onTap: () {
                        controller.showCashPage();
                      },
                      colorTextStyle: Colors.black87,
                      fontSize: 15,
                      height: 11.w,
                      borderRadius: BorderRadius.all(Radius.circular(10.w)),
                      //only(topRight: Radius.circular(7), bottomRight: Radius.circular(7)),
                      fontWeight: FontWeight.w500,
                      decoration: BoxDecoration(
                          color:   controller.isPaymentTypeSelected.value
                              ? AppColors.white
                              : AppColors.zayteFateh,
                          borderRadius: BorderRadius.all(Radius.circular(10.w)),
                          border: Border(
                              bottom: BorderSide(color: Colors.black54,width: 2),
                              right: BorderSide(color: Colors.black54),
                              left: BorderSide(color: Colors.black54),
                              top: BorderSide(color: Colors.black54,width: 1))),
                    );
                  }),
                ),
              ],
            ),
          ),
          Obx(() {
            return controller.showList.value
                ? ElectronicPaymentScreen()
                : CashPaymentScreen();
          }),
        ],
      ),
    );
  }
}
