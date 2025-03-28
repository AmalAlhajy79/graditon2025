import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/consts/app_colors.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import 'package:hall_gradition/core/core_components/textUtiles.dart';
import '../../../../../core/core_components/app_scaffold.dart';
import '../../../../../core/core_components/button.dart';
import '../controller/lougeInformation-hall-admin/lougeInformation-hall-admin-binding.dart';
import '../controller/lougeInformation-hall-admin/lougeInformation-hall-admin-controller.dart';

class WaitHallAdminScreen extends StatelessWidget {
  // const WaitHallAdminScreen({Key? key}) : super(key: key);

  static const name = '/waitHallAdminScreen';
  static final page = GetPage(
      name: name,
      page: () => WaitHallAdminScreen(),
      binding: LougeInformationHallAdminBinding());

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return AppScaffold(
      body:
      Stack(
        //  alignment:AlignmentDirectional.bottomCenter,
        children: [
          Container(
              height: mq.height,
              width: mq.width,
              color: AppColors.col6,
              child: Padding(
                padding: EdgeInsets.only(bottom: 75.w, left: 12.w, right: 12.w),
                child: Container(
                  height: 4.w,
                  width: 4.w,
                  child: Image.asset("assets/images/clock.png"),
                ),
              ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 90.w),
            child: Container(
              height: mq.height * 20,
              width: mq.width * 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25.w),
                    topLeft: Radius.circular(25.w),
                  ),
                  color: AppColors.white),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16.5.w, left: 16.w),
                    child: Row(
                      children: [
                        TextUtiles(
                          title: "Wait...",
                          fontSize: 21,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.6.w),
                    child: Row(
                      children: [
                        TextUtiles(
                          title: "your request is bein processed\n to sign in",
                          fontSize: 14.5,
                          fontWeight: FontWeight.normal,
                          colorTextStyle: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 18.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.w, right: 8.w),
                    child: Row(
                      children: [
                        ButtonScreen(
                          title: "Sign in",
                          borderRadius: BorderRadius.zero,
                          weight: 77.w,
                          height: 13.w,
                          colorContainer: AppColors.col6.withAlpha(126),
                          onTap: (){},
                          //colorContainer:AppColors.col6.withAlpha(126),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
