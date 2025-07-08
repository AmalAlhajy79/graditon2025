import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hall_gradition/core/core_components/textUtiles.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import '../../../../../core/consts/app_colors.dart';
import '../../../user-profile/vieProfile-Client-screen.dart';
import '../../../view-car-office/presentation/screens/view-car-office-screen.dart';

class UserBottomNavigationBar extends StatelessWidget {
  final NavigationUserController controller =
      Get.put(NavigationUserController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          height: 13.5.w,
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
                padding: EdgeInsets.all(1.2.w),
                child: Container(
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
                        icon: Icon(Icons.home,
                            color: controller.selectedIndex.value == 0
                                ? Colors.white
                                : Colors.black),
                        onPressed: () {
                          controller.changeIndex(0);
                          //Get.toNamed(ViewProfileHallAdminScreen.name);
                        },
                      ),
                      Positioned(
                        bottom: 0.1,
                        right: 1.w,
                        left: 2.w,
                        child: TextUtiles(
                          title: "Home" ,
                          colorTextStyle: controller.selectedIndex.value == 0 ? AppColors.zayteGamiq:Colors.black87,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(1.2.w),
                child: Container(
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
                        icon: Icon(Icons.insert_invitation,
                            color: controller.selectedIndex.value == 1
                                ? Colors.white
                                : Colors.black,size: 24,),
                        onPressed: () {
                          controller.changeIndex(1);
                          //   Get.toNamed(HomeHallAdminScreen.name);
                        },
                      ),
                      Positioned(
                        bottom: 0.1,
                        right: 1.w,
                        left: 2.w,
                        top: 7.6.w,
                        child: TextUtiles(
                          title:"E-Invite" ,
                          colorTextStyle: controller.selectedIndex.value == 1 ? AppColors.zayteGamiq:Colors.black87,
                          fontSize: 8.8,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(1.2.w),
                child: Container(
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
                        icon: Icon(Icons.person,
                            color: controller.selectedIndex.value == 2
                                ? Colors.white
                                : Colors.black,size: 25,),
                        onPressed: () {
                          controller.changeIndex(2);
                          Get.to(ViewProfileClientScreen());
                        },
                      ),
                      Positioned(
                        bottom: 0.1,
                        right: 1.w,
                        left: 3.w,
                        top: 7.5.w,
                        child: TextUtiles(
                          title: "Profile",
                          colorTextStyle: controller.selectedIndex.value == 2 ? AppColors.zayteGamiq:Colors.black87,
                          fontSize: 8.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(1.2.w),
                child: Container(
                  decoration: BoxDecoration(
                    color: controller.selectedIndex.value == 3
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
                        icon: Icon(Icons.local_taxi,
                            color: controller.selectedIndex.value == 3
                                ? Colors.white
                                : Colors.black),
                        onPressed: () {
                          controller.changeIndex(3);
                          Get.to(HomeUserCarOfficeScreen());
                        },
                      ),
                      SizedBox(height: 1.w,),
                      Positioned(
                        bottom: 0,
                        right: 0.w,
                        left: 4.w,
                        top: 7.w,
                        child: TextUtiles(
                          title: "Car",
                          colorTextStyle: controller.selectedIndex.value == 3 ? AppColors.zayteGamiq:Colors.black87,
                          fontSize: 10,
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class NavigationUserController extends GetxController {
  var selectedIndex = 0.obs; // تعيين Home كأيقونة افتراضية

  void changeIndex(int index) {
    selectedIndex.value = index; // تحديث الأيقونة المحددة
  }
}
