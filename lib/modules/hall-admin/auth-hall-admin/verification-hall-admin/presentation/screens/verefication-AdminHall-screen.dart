import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/consts/app_colors.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import 'package:hall_gradition/core/core_components/textUtiles.dart';
import 'package:hall_gradition/modules/hall-admin/auth-hall-admin/changePassword-hall-admin/presentation/screens/ChangePasswordAdminHall-screen.dart';
import '../../../../../../core/core_components/TextFormFeild.dart';
import '../../../../../../core/core_components/app_scaffold.dart';
import '../../../changePassword-hall-admin/presentation/controller/change-Password/changePassword-binding.dart';

class VerificationHallAdminScreen extends StatelessWidget {
  // const WaitHallAdminScreen({Key? key}) : super(key: key);

  static const name = '/VerificationHallAdminScreen';
  static final page = GetPage(
      name: name,
      page: () => VerificationHallAdminScreen(),
      binding: ChangePasswordAdminHallBinding());

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery
        .of(context)
        .size;
    return AppScaffold(
      body: Stack(
        //  alignment:AlignmentDirectional.bottomCenter,
        children: [
          Container(
            height: mq.height,
            width: mq.width,
            color: AppColors.col6,
            child: Padding(
              padding: EdgeInsets.only(bottom: 77.w, left: 4.5.w, right: 4.5.w),
              child: Container(
                height: 4.w,
                width: 4.w,
                child: Image.asset("assets/images/forgetPassword.png"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 70.w),
            child: Container(
              height: mq.height * 70,
              width: mq.width * 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(19.w),
                    topLeft: Radius.circular(19.w),
                  ),
                  color: AppColors.white),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 7.5.w, left: 13.w),
                    child: Row(
                      children: [
                        TextUtiles(
                          title: "Verification",
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 13.6.w, top: 10.w),
                    child: Row(
                      children: [
                        TextUtiles(
                          title:
                          "We have sent you a verification code to",
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          colorTextStyle: Colors.black,
                        ),


                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 14.6.w),
                    child: Row(

                      children: [
                        Padding(
                          padding:EdgeInsets.only(bottom: 2.w),
                          child: TextUtiles(
                            title:
                            ".... ",
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            colorTextStyle: Colors.black,
                          ),
                        ),
                        Row(
                          children: [
                            TextUtiles(
                              title:
                              "@gmail.com",
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              colorTextStyle: Colors.black,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.w,right: 15.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFieldWhite(
                            title: "",
                            height: 13.w,
                            weight: 13.w,
                            colorContainer: AppColors.greyfield.withAlpha(40)
                        ),
                        TextFieldWhite(
                            title: "",
                            height: 13.w,
                            weight: 13.w,
                            colorContainer: AppColors.greyfield.withAlpha(40)
                        ),
                        TextFieldWhite(
                            title: "",
                            height: 13.w,
                            weight: 13.w,
                            colorContainer: AppColors.greyfield.withAlpha(40)
                        ),
                        TextFieldWhite(
                            title: "",
                            height: 13.w,
                            weight: 13.w,
                            colorContainer: AppColors.greyfield.withAlpha(40)
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 6.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtiles(
                        title: "Resend code:",
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                      TextUtiles(
                        title: "  30 sec",
                        fontWeight: FontWeight.w500,
                        colorTextStyle: AppColors.greenF,
                        fontSize: 12,
                      ),

                    ],
                  ),
                  SizedBox(height: 8.w,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          Get.toNamed(ChangePasswordAadminHallScreen.name);
                        },
                        backgroundColor: AppColors.col6,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(30.0), // دائرة الشكل
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          color: AppColors.white,
                        ),
                      ),
                    ],
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
