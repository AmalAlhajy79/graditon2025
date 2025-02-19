
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import 'package:hall_gradition/modules/hall-admin/home-hall-admin/presentation/screens/home-hall-admin-screen.dart';

import '../../modules/hall-admin/notification-hall-admin/presentation/screens/notification-hallAdmin-screen.dart';
import '../../modules/hall-admin/profile-hall-admin/view-profile-hall-admin/presentation/screens/vieProfile-hallAdmin-screen.dart';
import '../consts/app_colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            icon: Icon(Icons.person_outline, color: Colors.black),
            onPressed: () {
            Get.toNamed(ViewProfileHallAdminScreen.name);
            },
          ),
          IconButton(
            icon: Icon(Icons.home, color: Colors.black),
            onPressed: () {
              Get.toNamed(HomeHallAdminScreen.name);
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications_none_outlined, color: Colors.black),
            onPressed: () {
              Get.toNamed(NotificationHallAdminScreen.name);
            },
          ),
        ],
      ),
    );
  }
}
