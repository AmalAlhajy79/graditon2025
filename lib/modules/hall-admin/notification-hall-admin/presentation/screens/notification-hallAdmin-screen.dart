import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/core_components/button.dart';
import 'package:hall_gradition/core/core_components/textUtiles.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import '../../../../../../core/core_components/app_scaffold.dart';
import '../../../../../core/consts/app_colors.dart';
import '../../../../../core/core_components/navigationBar.dart';
import '../controller/notification-hallAdmin/notification-hallAdmin-binding.dart';

class NotificationHallAdminScreen extends StatelessWidget {
  static const name = '/notificationHallAdminScreen';
  static final page = GetPage(
      name: name,
      page: () => NotificationHallAdminScreen(),
      binding: NotificationAdminHallBinding());

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return AppScaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.col555,
            AppColors.col1,
            AppColors.col4,
            AppColors.col3,
            AppColors.col22,
            AppColors.col4,
            AppColors.col1,
            AppColors.col1,
            Colors.white70,
           Colors.white70,
            Colors.white38,
            Colors.white12,
            Colors.white
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 3.6.w, top: 6.w, right: 30.w, bottom: 5.w),
            child: Row(
              children: [
                IconButton(
                    onPressed: () { Get.back();},
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      size: 16,
                      color: Colors.black,
                    )),
                SizedBox(
                  width: 24.w,
                ),
                TextUtiles(
                  title: "Notifications",
                  fontWeight: FontWeight.w400,
                  fontSize: 19,
                )
              ],
            ),
          ),
          Container(
              height: 30.w,
              decoration: BoxDecoration(
                  color: Colors.white.withAlpha(95),
                  // color: Colors.grey.withAlpha(70),
                  border: Border(
                      bottom: BorderSide(color: Colors.black87, width: 2))),
              child: Column(
                children: [
                  ListTile(
                    title: TextUtiles(title: "Raghad Ahmad", fontSize: 16.5),
                    onTap: () {},
                    subtitle: TextUtiles(
                        title: "2 hours",
                        fontSize: 12,
                        colorTextStyle: Colors.black54),
                    leading: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/geirl.jpg"),
                        maxRadius: 7.w),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonScreen(
                        title: 'accepte',
                        onTap: () {},
                        colorContainer: Color(0xE536E005),
                        weight:19.w,
                        //fontWeight: FontWeight.w500,
                        fontSize: 13,
                        height: 7.w,
                      //  decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(2.w))),
                     // ),
                      SizedBox(
                        width: 5.w,
                      ),
                      ButtonScreen(
                          title: 'cancel',
                          onTap: () {},
                          weight: 19.w,
                          fontSize: 13,
                          height: 7.w,
                          borderRadius:
                          BorderRadius.all(Radius.circular(2.w))
                      ),
                    ],
                  )
                ],
              )),
        ],
      ),
    ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
