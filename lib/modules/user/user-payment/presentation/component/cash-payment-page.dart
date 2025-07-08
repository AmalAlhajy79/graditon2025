import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/core_components/textUtiles.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import '../../../../../../../core/consts/app_colors.dart';
import '../../../../../../../core/core_components/button.dart';
import '../../../fetch-user-MyBooking/presentation/controller/fetch-userBooking-controller.dart';
import '../../../fetch-user-MyBooking/presentation/screens/fetch-userBooking-hall-screen.dart';
import '../controller/payment-user-binding.dart';
import '../controller/payment-user-controller.dart';

//نهائي قسم الاتراح
class CashPaymentScreen extends GetView<PaymentUserController> {
  static const name = '/CashPaymentScreen';
  static final page = GetPage(
      name: name,
      page: () => CashPaymentScreen(),
      binding: PaymentUserBinding());

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut<BothJoysReHallController>(() => BothJoysReHallController());
    FetchBookingUserHallController bookingController=Get.put(FetchBookingUserHallController());
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
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 2.w,),
                              Container(

                                margin: EdgeInsets.all(4.w),
                                height: mq.height * 0.28,
                                width: mq.width * 0.85,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.all(Radius.circular(3.w)),
                                    border: Border(
                                        bottom: BorderSide(color: Colors.black54),
                                        top: BorderSide(color: Colors.black54))),
                                child: Center(
                                  child: TextUtiles(
                                      title:
                                          'To pay the full amount or the\n deposit, you must come within\n a maximum period of 1 days\n to confirm the reservation.',
                                  fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(left: 5.w,top: 1.w),
                                child: Row(
                                  children: [
                                    TextUtiles(title: 'reservation',fontSize: 17,fontWeight: FontWeight.w500,),
                                  ],
                                ),
                              ),
                              SizedBox(height: 4.w,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                 ButtonScreen(
                                      title: 'Confirm',
                                   onTap: () {
                                     showModalBottomSheet(
                                       context: context,
                                       isScrollControlled: true,
                                       backgroundColor: Colors.transparent,
                                       builder: (context) {
                                         return _AnimatedMessageSheet();
                                       },
                                     );
                                   },

                                   colorTextStyle: Colors.white,
                                      // colorContainer: controller.isPaymentTypeSelected.value
                                      //     ? AppColors.zayteFateh
                                      //     : AppColors.white,
                                      fontSize: 13,
                                      height: 9.w,
                                   weight: 33.w,
                                      //only(topLeft: Radius.circular(7), bottomLeft: Radius.circular(7)),
                                      fontWeight: FontWeight.w500,
                                      decoration: BoxDecoration(
                                          color: AppColors.zayteGamiq,

                                          borderRadius: BorderRadius.all(Radius.circular(10.w)),
                                          border: Border(
                                              bottom: BorderSide(color: Colors.black54),
                                              right: BorderSide(color: Colors.black54),
                                              left: BorderSide(color: Colors.black54),
                                              top: BorderSide(color: Colors.black54))),
                                    ),
                                  SizedBox(
                                    width: 3.w,
                                  ),

                                ],
                              ),

                            ],
                          ),
                        )
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
class _AnimatedMessageSheet extends StatefulWidget {
  @override
  State<_AnimatedMessageSheet> createState() => _AnimatedMessageSheetState();
}

class _AnimatedMessageSheetState extends State<_AnimatedMessageSheet> {
  double _bottomPosition = 0.0;

  @override
  void initState() {
    super.initState();

    // تأخير بسيط ثم بدء التحريك للأعلى
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _bottomPosition = MediaQuery.of(context).size.height * 0.25; // تحرك إلى الأعلى
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeOut,
          bottom: _bottomPosition,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.38,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20),bottom: Radius.circular(20)),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  // الخط العلوي
                  Container(
                    width: 20.w,
                    height: 5,
                    decoration: BoxDecoration(
                      color: AppColors.zayteGamiq,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(height: 10),
                  // الرسالة
                  Expanded(
                    child: Center(
                      child:
                      Container(

                        margin: EdgeInsets.all(4.w),
                        height: 33.w,
                        width:85.w,
                        decoration: BoxDecoration(
                            color: AppColors.zayteFateh,
                            borderRadius: BorderRadius.all(Radius.circular(3.w)),
                            border: Border(
                                bottom: BorderSide(color: Colors.black54),
                                top: BorderSide(color: Colors.black54),
                            left: BorderSide(color: Colors.black54),
                            right: BorderSide(color: Colors.black54)
                            )),
                        child: Center(
                          child: TextUtiles(
                            title:'When confirming the reservation,\nyou have two days to modify your\nrequest, after whitch the request\nwill be confirmed.',
                            fontSize: 15.6,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child:
                    ButtonScreen(
                      title: 'accept',
                      onTap: () {

                      },
                      colorTextStyle: Colors.white,
                      fontSize: 14,
                      height: 9.w,
                      weight: 23.w,
                      borderRadius: BorderRadius.all(Radius.circular(10.w)),
                      fontWeight: FontWeight.w500,
                      decoration: BoxDecoration(
                          color: AppColors.zayteGamiq,
                          borderRadius: BorderRadius.all(Radius.circular(10.w)),
                          border: Border(
                              bottom: BorderSide(color: Colors.black54),
                              right: BorderSide(color: Colors.black54),
                              left: BorderSide(color: Colors.black54),
                              top: BorderSide(color: Colors.black54))),
                    ),
                  ),
                  SizedBox(height: 2.w,),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
