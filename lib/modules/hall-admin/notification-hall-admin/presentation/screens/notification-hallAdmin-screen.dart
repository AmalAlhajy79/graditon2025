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
          color: Colors.white
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                bottom: 5.w),
            child: Container(
              height: 20.w,
              decoration:BoxDecoration(
                color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 1, // مدى انتشار الظل
              blurRadius: 4, // مدى تمويه الظل
              offset: Offset(
                  0, 3), // الإزاحة (يمين، أسفل)
            ),
          ],
        ),
              child: Padding(
                padding: EdgeInsets.only(left: 4.w),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () { Get.back();},
                        icon: Icon(
                          Icons.arrow_back_ios_new_sharp,
                          size: 17,
                          color: Colors.black87,
                          weight: 15.w,
                        )),
                    SizedBox(
                      width: 22.w,
                    ),
                    TextUtiles(
                      title: "Notifications",
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: 8.w),
            child: Row(
              children: [
                TextUtiles(title: "New", fontSize: 14),
              ],
            ),
          ),
          SizedBox(height: 2.5.w,),
          Container(
              height: 30.w,
              decoration: BoxDecoration(
                  color: AppColors.white,
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
                        maxRadius: 7.5.w),
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
