import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/core_components/textUtiles.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import 'package:hall_gradition/modules/hall-admin/profile-hall-admin/edit-profile-hall-admin/presentation/screens/EditProfile-AdminHall-screen.dart';
import '../../../../../../core/consts/app_colors.dart';
import '../../../../../../core/core_components/app_scaffold.dart';
import '../../../../../../core/core_components/navigationBar.dart';
import '../../../../lougeInformation-hall-admin/presentation/screens/lougeInformation-hall-admin-screen.dart';
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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              // AppColors.color1,
              AppColors.col555,
              AppColors.col1,
              AppColors.col4,
              AppColors.col3,
              AppColors.col22,
              AppColors.col22,
              // AppColors.col1,
              //AppColors.color1,
              AppColors.col4,
              AppColors.col1,
              AppColors.col1,
              AppColors.col1,
              AppColors.col1,
              AppColors.col1,
              //  Colors.purpleAccent.withAlpha(110),
              //    AppColors.color6,
              //    AppColors.color6,
              //    AppColors.color6,
              //    AppColors.color6,

              // Colors.white38,
              Colors.white70,
              // Colors.white
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
                    title: "My profile",
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  )
                ],
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
                        padding: EdgeInsets.only(bottom: 14.w),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.dark_mode_outlined),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.w,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.w),
                  child: ListTile(
                    title: TextUtiles(title: "Ahmad Ahmad", fontSize: 16.5),
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
                  color: Colors.black45,
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Column(
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
                        title: TextUtiles(title:'New account' ,fontSize: 14,
                            fontWeight: FontWeight.w400,
                            colorTextStyle: Colors.black87),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.edit_outlined),
                        title: TextUtiles(title:'Edit my information' ,fontSize: 14,
                            fontWeight: FontWeight.w400,
                            colorTextStyle: Colors.black87),
                        onTap: () {
                          Get.toNamed(EditProfileHallAdminScreen.name);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.local_police_outlined),
                        title: TextUtiles(title:'privacy policy' ,fontSize: 14,
                            fontWeight: FontWeight.w400,
                            colorTextStyle: Colors.black87),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.language_outlined),
                        title: TextUtiles(title:'Langouge', fontSize: 14,
                            fontWeight: FontWeight.w400,
                            colorTextStyle: Colors.black87),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
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
