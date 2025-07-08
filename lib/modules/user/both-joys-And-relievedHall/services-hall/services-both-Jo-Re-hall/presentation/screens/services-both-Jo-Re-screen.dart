import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import 'package:hall_gradition/modules/user/both-joys-And-relievedHall/services-hall/services-both-Jo-Re-hall/presentation/screens/relieved.dart';
import '../../../../../../../core/consts/app_colors.dart';
import '../../../../../../../core/core_components/app_scaffold.dart';
import '../../../../../../../core/core_components/button.dart';
import '../../../../../../../core/core_components/textUtiles.dart';
import '../controller/services-both-Jo-Re/services-both-Jo-Re-binding.dart';
import '../controller/services-both-Jo-Re/services-both-Jo-Re-hall-Controller.dart';
import 'joys.dart';



class BothRe_JoysHallServicesScreen extends GetView<BothJoysReHallController> {

  static const name = '/BothRe_JoysHallServicesScreen';
  static final page = GetPage(
      name: name,
      page: () => BothRe_JoysHallServicesScreen(),
      binding: BothJoysReHallBinding());
  final BothJoysReHallController controller = Get.put(BothJoysReHallController());

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<BothJoysReHallController>(() => BothJoysReHallController());
    var mq = MediaQuery.of(context).size;
    return AppScaffold(
      body:
      Stack(
        children: [
          Container(
            height: mq.height,
            width: mq.width,
            color: AppColors.zayteFateh,
            child:
            Padding(
              padding: EdgeInsets.only(bottom: 152.w, left: 2.w, right: 12.w),
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
                      width: 28.w,
                    ),
                    TextUtiles(
                      title: "Service",
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 18.w, right: 7.w, left: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Obx(() {
                    return ButtonScreen(
                      title: 'Joys',
                      onTap: () {
                        controller.showList1();
                      },
                      colorTextStyle: controller.isJoysSelected.value ? Colors.white : Colors.black,
                      colorContainer: controller.isJoysSelected.value ? AppColors.zayteGamiq : AppColors.white,
                      fontSize: 15,
                      height: 10.w,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(7), bottomLeft: Radius.circular(7)),
                      fontWeight: FontWeight.w500,
                    );
                  }),
                ),
                Expanded(
                  child: Obx(() {
                    return ButtonScreen(
                      title: 'Relieved',
                      onTap: () {
                        controller.showList2();
                      },
                      colorTextStyle: controller.isJoysSelected.value ? Colors.black : Colors.white,
                      colorContainer: controller.isJoysSelected.value ? AppColors.white : AppColors.zayteGamiq,
                      fontSize: 15,
                      height: 10.w,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(7), bottomRight: Radius.circular(7)),
                      fontWeight: FontWeight.w500,
                    );
                  }),
                ),
              ],
            ),
          ),

          Obx(() {
            return controller.showList.value ?BothJoysServicesScreen() :   BothRelievedServicesScreen();
          }),
        ],
      ),
    );
  }
}

