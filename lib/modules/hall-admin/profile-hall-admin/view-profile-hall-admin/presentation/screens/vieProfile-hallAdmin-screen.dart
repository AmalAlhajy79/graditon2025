import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/core_components/textUtiles.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import 'package:hall_gradition/modules/hall-admin/profile-hall-admin/edit-profile-hall-admin/presentation/screens/EditProfile-AdminHall-screen.dart';
import '../../../../../../core/consts/app_colors.dart';
import '../../../../../../core/core_components/app_scaffold.dart';
import '../../../../../../core/core_components/navigationBar.dart';
import '../../../../lougeInformation-hall-admin/presentation/screens/lougeInformation-hall-admin-screen.dart';
import '../../../../myEmployees-hall-admin/presentation/screens/myEmployees-hallAdmin-screen.dart';
import '../controller/vieProfile-hallAdmin/vieProfile-hallAdmin-binding.dart';

class ViewProfileHallAdminScreen extends StatelessWidget {
  static const name = '/ViewProfileHallAdminScreen';
  static final page = GetPage(
      name: name,
      page: () => ViewProfileHallAdminScreen(),
      binding: ViewProfileAdminHallBinding());

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return AppScaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only( bottom: 5.w),
              child: Container(
                height: 16.w,
                color: AppColors.col6,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 2.w),
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            size: 19,
                            color: Colors.white,
                          )),
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    TextUtiles(
                      title: "My profile",
                      fontWeight: FontWeight.w500,
                      fontSize: 18.5,
                      colorTextStyle: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 6.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/adminHall.png"),
                          maxRadius: 11.w),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.w),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.dark_mode_outlined),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 0.1.w,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.w),
                  child: ListTile(
                    title: TextUtiles(title: "Ahmad Ahmad", fontSize: 17.5),
                    onTap: () {},
                    subtitle: TextUtiles(
                      title: "0987654321",
                      fontSize: 12,
                      colorTextStyle: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  height: 2,
                  width: mq.width,
                  color: Colors.black87,
                ),
                Padding(
                  padding:  EdgeInsets.only(left: 4,right: 4),
                  child: Container(
                    height: 94.w,
                    child: ListView(
                      children: [
                        Column(
                          children: [
                            ListTile(
                              leading: Icon(Icons.person_outline),
                              title: TextUtiles(
                                  title: 'New Lounge',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  colorTextStyle: Colors.black87),
                              onTap: () {
                                Get.toNamed(LougeInformationHallAdminScreen.name);
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.person_outline),
                              title: TextUtiles(
                                  title: 'New account',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  colorTextStyle: Colors.black87),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.people_alt_outlined),
                              title: TextUtiles(
                                  title: 'My employees',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  colorTextStyle: Colors.black87),
                              onTap: () {
                               Get.toNamed(MyEmployeesHallAdminScreen.name);
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.people_alt_outlined),
                              title: TextUtiles(
                                  title: 'My lounges',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  colorTextStyle: Colors.black87),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.edit_outlined),
                              title: TextUtiles(
                                  title: 'Edit my information',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  colorTextStyle: Colors.black87),
                              onTap: () {
                                Get.toNamed(EditProfileHallAdminScreen.name);
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.local_police_outlined),
                              title: TextUtiles(
                                  title: 'privacy policy',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  colorTextStyle: Colors.black87),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.language_outlined),
                              title: TextUtiles(
                                  title: 'Langouge',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  colorTextStyle: Colors.black87),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
