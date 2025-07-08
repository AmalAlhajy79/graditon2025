
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import 'package:hall_gradition/modules/hall-admin/home-hall-admin/presentation/screens/home-hall-admin-screen.dart';
import '../../modules/hall-admin/notification-hall-admin/presentation/screens/notification-hallAdmin-screen.dart';
import '../../modules/hall-admin/profile-hall-admin/view-profile-hall-admin/presentation/screens/vieProfile-hallAdmin-screen.dart';
import '../consts/app_colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final NavigationController controller = Get.put(NavigationController());
final int hallId;

 CustomBottomNavigationBar({ required this.hallId});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      height: 14.7.w,
      decoration: BoxDecoration(
        color: AppColors.col6,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(90),
          topRight: Radius.circular(90),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.person_outline, color: controller.selectedIndex.value == 0 ? Colors.white : Colors.black),
            onPressed: () {
              controller.changeIndex(0);
              Get.toNamed(ViewProfileHallAdminScreen.name);
            },
          ),
          IconButton(
            icon: Icon(Icons.home, color: controller.selectedIndex.value == 1 ? Colors.white : Colors.black),
            onPressed: () {
              controller.changeIndex(1);
              Get.to(() => HomeHallAdminScreen(hallId: hallId));
              // Get.to(HomeHallAdminScreen(hallId: hallId));
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications_none_outlined, color: controller.selectedIndex.value == 2 ? Colors.white : Colors.black),
            onPressed: () {
              controller.changeIndex(2);
              Get.toNamed(NotificationHallAdminScreen.name);
            },
          ),
        ],
      ),
    ));
  }
}


class NavigationController extends GetxController {
  var selectedIndex = 1.obs; // تعيين Home كأيقونة افتراضية

  void changeIndex(int index) {
    selectedIndex.value = index; // تحديث الأيقونة المحددة
  }
}
