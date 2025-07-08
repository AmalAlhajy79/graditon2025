import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import 'package:hall_gradition/modules/user/both-joys-And-relievedHall/services-hall/services-both-Jo-Re-hall/presentation/screens/relieved.dart';
import '../../../../../../../core/consts/app_colors.dart';
import '../../../../../../../core/core_components/app_scaffold.dart';
import '../../../../../../../core/core_components/button.dart';
import '../../../../../../../core/core_components/textUtiles.dart';
import '../../../../home-user/presentation/controller/home-user-controller.dart';
import '../../../services-hall/services-both-Jo-Re-hall/presentation/screens/joys.dart';
import '../components/joys-photo-details.dart';
import '../components/relieved-photo-details.dart';
import '../controller/both-joys-relieved-detail-pinding.dart';
import '../controller/both-joys-relived-details-controller.dart';

class BothRe_JoysHallPhotoScreen extends GetView<BothDetailsJoysReHallController> {
  static const name = '/BothRe_JoysHallPhotoScreen';
  static final page = GetPage(
      name: name,
      page: () => BothRe_JoysHallPhotoScreen(),
      binding: BothDetailsJoysReHallBinding());

  // final BothJoysReHallController controller = Get.put(BothJoysReHallController());
  HomeUserController homeUserController=Get.put(HomeUserController());

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut<BothJoysReHallController>(() => BothJoysReHallController());
    var mq = MediaQuery.of(context).size;
    return AppScaffold(
      body:Stack(
        children: [
          Container(
            height: 26.w,
            width: mq.width,
            decoration: BoxDecoration(
              color: AppColors.zayteFateh,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(7.w),
                bottomLeft: Radius.circular(7.w),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(bottom: 59, left: 2.w, right: 10.w), // تعديل أو إزالة الـ padding السفلي
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {Get.back();},
                    icon: Icon(
                      Icons.arrow_back_ios_new_sharp,
                      color: Colors.black,
                      size: 25,
                    ),
                  ),
                  SizedBox(
                    width: 28.w,
                  ),
                  TextUtiles(
                    title: "photo",
                    fontSize: 17,
                    fontWeight: FontWeight.w500,

                  ),
                ],
              ),
            ),
          ),
          // باقي العناصر في الـ Stack
          Padding(
            padding: EdgeInsets.only(top: 12.5.w, right: 7.w, left: 7.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Obx(() {
                    return ButtonScreen(
                      title: 'Joys',
                      onTap: () {
                        controller.showListPhoto1();
                        controller.fetchEventImages(homeUserController.hallId_pub);
                      },
                      colorTextStyle: controller.isJoysSelected.value
                          ? Colors.white
                          : Colors.black,
                      colorContainer: controller.isJoysSelected.value
                          ? AppColors.zayteGamiq
                          : AppColors.white,
                      fontSize: 15,
                      height: 10.w,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7),
                        bottomLeft: Radius.circular(7),
                      ),
                      fontWeight: FontWeight.w500,
                    );
                  }),
                ),
                Expanded(
                  child: Obx(() {
                    return ButtonScreen(
                      title: 'Relieved',
                      onTap: () {
                        controller.showListPhoto2();
                        controller.fetchEventImages(homeUserController.hallId_pub);
                      },
                      colorTextStyle: controller.isJoysSelected.value
                          ? Colors.black
                          : Colors.white,
                      colorContainer: controller.isJoysSelected.value
                          ? AppColors.white
                          : AppColors.zayteGamiq,
                      fontSize: 15,
                      height: 10.w,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(7),
                        bottomRight: Radius.circular(7),
                      ),
                      fontWeight: FontWeight.w500,
                    );
                  }),
                ),
              ],
            ),
          ),
          Obx(() {
            return controller.showListPhoto.value
                ? BothJoysPhotoScreen()
                : BothRelievedPhotoScreen();
          }),
        ],
      )

      // Stack(
      //   children: [
      //     Container(
      //       height: mq.height * 0.14,
      //       width: mq.width,
      //       decoration: BoxDecoration(
      //         color: AppColors.zayteFateh,
      //         borderRadius: BorderRadius.only(
      //             bottomRight: Radius.circular(7.w), bottomLeft: Radius.circular(7.w)),
      //       ),
      //       child: Padding(
      //         padding: EdgeInsets.only(bottom: 150.w, left: 2.w, right: 10.w),
      //         child: Container(
      //           height: 7.w,
      //           width: 7.w,
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             children: [
      //               IconButton(
      //                 onPressed: () {},
      //                 icon: Icon(
      //                   Icons.arrow_back_ios_new_sharp,
      //                   color: Colors.black,
      //                   size: 26,
      //                 ),
      //               ),
      //               SizedBox(
      //                 width: 28.w,
      //               ),
      //               TextUtiles(  title: "photo",
      //                 fontSize: 15,
      //                 fontWeight: FontWeight.w500,
      //                 colorTextStyle: Colors.blue,),
      //
      //
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: EdgeInsets.only(top: 12.w, right: 7.w, left: 8.w),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Expanded(
      //             child: Obx(() {
      //               return ButtonScreen(
      //                 title: 'Joys',
      //                 onTap: () {
      //                   controller.showListPhoto1();
      //                 },
      //                 colorTextStyle: controller.isJoysSelected.value
      //                     ? Colors.white
      //                     : Colors.black,
      //                 colorContainer: controller.isJoysSelected.value
      //                     ? AppColors.zayteGamiq
      //                     : AppColors.white,
      //                 fontSize: 15,
      //                 height: 10.w,
      //                 borderRadius: BorderRadius.only(
      //                     topLeft: Radius.circular(7),
      //                     bottomLeft: Radius.circular(7)),
      //                 fontWeight: FontWeight.w500,
      //               );
      //             }),
      //           ),
      //           Expanded(
      //             child: Obx(() {
      //               return ButtonScreen(
      //                 title: 'Relieved',
      //                 onTap: () {
      //                   controller.showListPhoto2();
      //                 },
      //                 colorTextStyle: controller.isJoysSelected.value
      //                     ? Colors.black
      //                     : Colors.white,
      //                 colorContainer: controller.isJoysSelected.value
      //                     ? AppColors.white
      //                     : AppColors.zayteGamiq,
      //                 fontSize: 15,
      //                 height: 10.w,
      //                 borderRadius: BorderRadius.only(
      //                     topRight: Radius.circular(7),
      //                     bottomRight: Radius.circular(7)),
      //                 fontWeight: FontWeight.w500,
      //               );
      //             }),
      //           ),
      //         ],
      //       ),
      //     ),
      //     Obx(() {
      //       return controller.showListPhoto.value
      //           ? BothJoysPhotoScreen()
      //           : BothRelievedPhotoScreen();
      //     }),
      //   ],
      // ),
    );
  }
}
