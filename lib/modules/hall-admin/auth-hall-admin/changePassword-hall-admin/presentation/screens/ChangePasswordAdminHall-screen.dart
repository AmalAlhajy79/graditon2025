
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import '../../../../../../core/consts/app_colors.dart';
import '../../../../../../core/core_components/app_scaffold.dart';
import '../controller/change-Password/changePassword-binding.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:hall_gradition/core/core_components/button.dart';
import 'package:hall_gradition/core/core_components/textUtiles.dart';
import '../../../../../../core/core_components/TextFormFeild.dart';

class ChangePasswordAadminHallScreen extends StatelessWidget {
  ChangePasswordAadminHallScreen({Key? key}) : super(key: key);
  static const name = '/ChangePasswordAdminHall';
  static final page = GetPage(
      name: name,
      page: () => ChangePasswordAadminHallScreen(),
      binding: ChangePasswordAdminHallBinding());

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return AppScaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 80.w,
              width: mq.width,
              child: Image.asset("assets/images/round3.png",
                  fit: BoxFit.values.first),
            ),
            Padding(
              padding: EdgeInsets.only(left: 13.w),
              child: Row(
                children: [
                  TextUtiles(title: "Change password", fontSize: 21),
                ],
              ),
            ),
            SizedBox(
              height: 8.w,
            ),
            TextFieldWhite(
              title: "Enter the new password",
              icon: Icon(Icons.lock_outlined, size: 23),
              colorContainer: AppColors.color3.withAlpha(80),
              weight: 85.w,
            ),
            SizedBox(
              height: 2.9.w,
            ),
            TextFieldWhite(
              title: "confirm password",
              icon: Icon(Icons.lock_outlined, size: 23),
              colorContainer: AppColors.color3.withAlpha(80),
              weight: 85.w,
            ),

            SizedBox(
              height: 10.w,
            ),
            Padding(
              padding: EdgeInsets.only(right: 1.5.w),
              child: ButtonScreen(
                title: "send",
                weight: 85.w,
                onTap: (){},
              ),
            ),
            SizedBox(
              height: 8.9.w,
            ),

            Expanded(
              child: Padding(
                padding:EdgeInsets.only(left:0.1),
                child: Row(
                  children: [
                    Container(
                      height:17.w,
                      width: mq.width*0.80,
                      child: Image.asset("assets/images/round2.png",
                          fit: BoxFit.values.first),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}