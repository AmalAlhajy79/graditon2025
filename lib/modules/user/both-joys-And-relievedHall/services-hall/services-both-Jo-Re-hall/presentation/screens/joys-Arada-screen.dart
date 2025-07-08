import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import 'package:hall_gradition/modules/user/both-joys-And-relievedHall/services-hall/services-both-Jo-Re-hall/presentation/screens/relieved.dart';
import '../../../../../../../core/consts/app_colors.dart';
import '../../../../../../../core/core_components/app_scaffold.dart';
import '../../../../../../../core/core_components/button.dart';
import '../../../../../../../core/core_components/textUtiles.dart';
import '../components/girls-arada-band.dart';
import '../components/youth-arada-band.dart';
import '../controller/services-both-Jo-Re/services-both-Jo-Re-binding.dart';
import '../controller/services-both-Jo-Re/services-both-Jo-Re-hall-Controller.dart';
import 'joys.dart';



class JoysAradaServicesScreen extends GetView<BothJoysReHallController> {

  static const name = '/JoysAradaServicesScreen';
  static final page = GetPage(
      name: name,
      page: () => JoysAradaServicesScreen(),
      binding: BothJoysReHallBinding());
  final BothJoysReHallController controller = Get.put(BothJoysReHallController());

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<BothJoysReHallController>(() => BothJoysReHallController());
    var mq = MediaQuery.of(context).size;
    return AppScaffold(
      body: Stack(
        children: [
          Container(
            height: mq.height*0.82,
            width: mq.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(9.w),bottomRight: Radius.circular(9.w)),
              color: AppColors.zayteFateh,
            ),

            child: Padding(
              padding: EdgeInsets.only( left: 3.w, right: 12.w,bottom: 130.w, ),
              child: Container(
                height: 4.w,
                width: 4.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {Get.back();},
                      icon: Icon(
                        Icons.arrow_back_ios_new_sharp,
                        color: Colors.black,
                        size: 23,
                      ),
                    ),
                    SizedBox(
                      width: 28.w,
                    ),
                    TextUtiles(
                      title: "Service",
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 14.5.w, right: 6.w, left: 6.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Obx(() {
                    return ButtonScreen(
                      title: 'Youth band',
                      onTap: () {
                        controller.showAradaList1();
                      },
                      colorTextStyle: controller.isJoysAradaSelected.value ? Colors.white : Colors.black,
                      colorContainer: controller.isJoysAradaSelected.value ? AppColors.zayteGamiq : AppColors.white,
                      fontSize: 15,
                      height: 9.w,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(7), bottomLeft: Radius.circular(7)),
                      fontWeight: FontWeight.w500,
                    );
                  }),
                ),
                Expanded(
                  child: Obx(() {
                    return ButtonScreen(
                      title: 'Girls band',
                      onTap: () {
                        controller.showAradaList2();
                      },
                      colorTextStyle: controller.isJoysAradaSelected.value ? Colors.black : Colors.white,
                      colorContainer: controller.isJoysAradaSelected.value ? AppColors.white : AppColors.zayteGamiq,
                      fontSize: 15,
                      height: 9.w,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(7), bottomRight: Radius.circular(7)),
                      fontWeight: FontWeight.w500,
                    );
                  }),
                ),
              ],
            ),
          ),

      Padding(
        padding: EdgeInsets.only(left: 5.w, top: 27.9.w),
        child: Row(
          children: [
            TextUtiles(title: "All videos", fontSize: 17.5,fontWeight: FontWeight.w500),
          ],
        ),),

          Obx(() {
            return controller.showListArada.value ?JoysYouthAradaBand() :   JoysGirlsAradaBand();
          }),
        ],
      ),
    );
  }
}

