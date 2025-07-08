import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hall_gradition/core/core_components/textUtiles.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import 'package:hall_gradition/modules/hall-admin/auth-hall-admin/login-hall-admin/presentation/screens/LoginHallAdmin.dart';
import 'package:hall_gradition/modules/hall-admin/profile-hall-admin/edit-profile-hall-admin/presentation/screens/EditProfile-AdminHall-screen.dart';
import '../../../../../../core/consts/app_colors.dart';
import '../../../../../../core/core_components/app_scaffold.dart';
import '../../../../../../core/core_components/navigationBar.dart';
import '../../../core/consts/api_const.dart';
import '../auth/login-Client/presentation/screens/LoginClient.dart';
import '../auth/rejester/rejester-user/presentation/controller/rejester-user/rejester-user-controller.dart';

class ViewProfileClientScreen extends StatelessWidget {
  static const name = '/ViewProfileClientScreen';
  // static final page = GetPage(
  //     name: name,
  //     page: () => ViewProfileClientScreen(),
  //     binding: ViewProfileAdminHallBinding());
  RejesterUserControllerrr rejesterUserControllerrr=Get.find();
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
                color: AppColors.zayteGamiq,
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
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundImage: rejesterUserControllerrr.userPhoto != null
                            ? NetworkImage(ApiConst.urlImage+rejesterUserControllerrr.userPhoto!)
                            : null,
                        child: rejesterUserControllerrr.userPhoto == null
                            ?  Container()
                            : null,
                          maxRadius: 11.w
                      ),
                      // CircleAvatar(
                      //     backgroundImage:
                      //         AssetImage("assets/images/adminHall.png"),
                      //     maxRadius: 11.w),
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
                    title: TextUtiles(title: rejesterUserControllerrr.userName,//"Ahmad Ahmad",
                        fontSize: 17.5),
                    onTap: () {},
                    subtitle: TextUtiles(
                      title: rejesterUserControllerrr.userPhoto,//"0987654321",
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
                              leading: Icon(Icons.logout_outlined),
                              title: TextUtiles(
                                  title: 'Log out',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  colorTextStyle: Colors.black87),
                              onTap: () {
                                final box = GetStorage();
                                box.remove('api_token');
                                Get.toNamed(LoginClient.name);
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
    );
  }
}
