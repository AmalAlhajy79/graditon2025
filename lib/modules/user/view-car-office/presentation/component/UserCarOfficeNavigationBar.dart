
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hall_gradition/core/core_components/textUtiles.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import '../../../../../core/consts/app_colors.dart';
import '../../../user-Message-CarOffice/presentation/screens/User-Message-CarOffice-Screen.dart';
import '../../../user-profile/vieProfile-Client-screen.dart';
import '../screens/view-car-office-screen.dart';

class UserCarOfficeNavigationBar extends StatelessWidget {
  final UserCarOfficeNavigationBarController controller =
  Get.put(UserCarOfficeNavigationBarController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      height: 12.w,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(3.w),
          topRight: Radius.circular(3.w),
          bottomRight: Radius.circular(3.w),
          bottomLeft: Radius.circular(3.w),
        ),
        border: Border(
            left: BorderSide(width: 1),
            right: BorderSide(width: 1),
            top: BorderSide(width: 1),
            bottom: BorderSide(width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.all(0.2.w),
            child: Container(
              height: 10.w,
              decoration: BoxDecoration(
                color: controller.selectedIndex.value == 0
                    ? AppColors.zayteGamiq
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(3.w),
                  topRight: Radius.circular(3.w),
                  bottomRight: Radius.circular(3.w),
                  bottomLeft: Radius.circular(3.w),
                ),
              ),
              //Colors.yellowAccent,
              child: Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.notifications_none_outlined,
                      color: controller.selectedIndex.value == 0
                          ? Colors.white
                          : Colors.black,size: 31,),
                    onPressed: () {
                      controller.changeIndex(0);
                      //   Get.toNamed(HomeHallAdminScreen.name);
                    },
                  ),
                  // Positioned(
                  //   bottom: 0.1,
                  //   //right: 1.w,
                  //   left: 0.w,
                  //   top: 7.6.w,
                  //   child: TextUtiles(
                  //     title:"notification" ,
                  //     colorTextStyle: controller.selectedIndex.value == 0 ? AppColors.zayteGamiq:Colors.black87,
                  //     fontSize: 7.8,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(0.2.w),
            child: Container(
              height: 10.w,
              decoration: BoxDecoration(
                color: controller.selectedIndex.value == 1
                    ? AppColors.zayteGamiq
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(3.w),
                  topRight: Radius.circular(3.w),
                  bottomRight: Radius.circular(3.w),
                  bottomLeft: Radius.circular(3.w),
                ),
              ),

              //Colors.yellowAccent,
              child: Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.home,size: 29,
                        color: controller.selectedIndex.value == 1
                            ? Colors.white
                            : Colors.black54),
                    onPressed: () {
                      controller.changeIndex(1);
                      Get.to(HomeUserCarOfficeScreen());
                    },
                  ),
                  // Positioned(
                  //   bottom: 0.01,
                  //   right: 1.w,
                  //   left: 2.w,
                  //   top: 7.w,
                  //   child: TextUtiles(
                  //     title: "Home" ,
                  //     colorTextStyle: controller.selectedIndex.value == 1 ? AppColors.zayteGamiq:Colors.black87,
                  //     fontSize: 10,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          Container(
            height: 10.w,
            decoration: BoxDecoration(
              color: controller.selectedIndex.value == 2
                  ? AppColors.zayteGamiq
                  : Colors.grey.shade300,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(3.w),
                topRight: Radius.circular(3.w),
                bottomRight: Radius.circular(3.w),
                bottomLeft: Radius.circular(3.w),
              ),
            ),
            //Colors.yellowAccent,
            child: Stack(
              children: [
                IconButton(
                  icon: Icon(Icons.email_outlined,
                    color: controller.selectedIndex.value == 2
                        ? Colors.white
                        : Colors.black,size: 29,),
                  onPressed: () {
                    controller.changeIndex(2);
                 Get.to(UserMessageCarOfficeScreen());
                  },
                ),
                // Positioned(
                //   bottom: 0.1,
                //   right: 1.w,
                //   left: 1.w,
                //   top: 7.5.w,
                //   child: TextUtiles(
                //     title: "message",
                //     colorTextStyle: controller.selectedIndex.value == 2 ? AppColors.zayteGamiq:Colors.black87,
                //     fontSize: 7.8,
                //   ),
                // ),
              ],
            ),
          ),

        ],
      ),
    ));
  }
}

class UserCarOfficeNavigationBarController extends GetxController {
  var selectedIndex = 1.obs; // تعيين Home كأيقونة افتراضية

  void changeIndex(int index) {
    selectedIndex.value = index; // تحديث الأيقونة المحددة
  }
}
