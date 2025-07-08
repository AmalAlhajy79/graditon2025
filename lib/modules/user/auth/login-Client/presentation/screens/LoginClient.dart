import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:hall_gradition/core/core_components/app_scaffold.dart';
import 'package:hall_gradition/core/core_components/button.dart';
import 'package:hall_gradition/core/core_components/textUtiles.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import 'package:hall_gradition/modules/hall-admin/auth-hall-admin/verification-hall-admin/presentation/screens/verefication-AdminHall-screen.dart';
import 'package:hall_gradition/modules/user/home-user/presentation/screens/homeScreen-user.dart';

import '../../../../../../core/consts/app_colors.dart';
import '../../../../../../core/core_components/TextFormFeild.dart';
import '../../../rejester/rejester-user/presentation/screens/rejester-user-screen.dart';
import '../controller/login-client/login-client-binding.dart';
import '../controller/login-client/login-client-controller.dart';

class LoginClient extends GetView<LoginClientController> {
  LoginClient({Key? key}) : super(key: key);
  static const name = '/LoginClient';
  static final page = GetPage(
      name: name, page: () => LoginClient(), binding: LoginClientBinding());

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return AppScaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 16.w,
              width: mq.width,
              color:  AppColors.zayteGamiq,
              // child: Image.asset("assets/images/round.png",
              //     fit: BoxFit.values.first),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w,top: 15.w),
              child: Row(
                children: [
                  TextUtiles(title: "Login", fontSize: 22),
                ],
              ),
            ),
            SizedBox(
              height: 15.w,
            ),
            TextFieldWhite(
              controller: controller.emailController,
              title: "Enter your email",
              icon: Icon(Icons.email_outlined, size: 23),
              colorContainer: AppColors.color3.withAlpha(80),
              weight: 85.w,
            ),
            SizedBox(
              height: 2.6.w,
            ),
            TextFieldWhite(
              controller: controller.passwordController,
              title: "Enter your password",
              icon: Icon(Icons.lock_outlined, size: 23),
              colorContainer: AppColors.color3.withAlpha(80),
              suffixIcon: controller.isPasswordVisible.value
                  ? Icon(
                      Icons.remove_red_eye_rounded,
                      color: Colors.black54,
                    )
                  : Icon(
                      Icons.visibility_off_rounded,
                      color: Colors.black54,
                    ),
              weight: 85.w,
            ),
            SizedBox(
              height: 2.6.w,
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {
                        Get.toNamed(VerificationHallAdminScreen.name);
                      },
                      child: TextUtiles(
                          title: "Forgit password?", fontSize: 12.6)),
                ],
              ),
            ),
            SizedBox(
              height: 13.7.w,
            ),
            Padding(
              padding: EdgeInsets.only(right: 1.5.w),
              child: ButtonScreen(
                title: "sign in",
                weight: 85.w,
                colorContainer: AppColors.zayteGamiq,
                onTap: () {
                  controller.loginClient();
                  Get.toNamed(HomeUserScreen.name);
                },
              ),
            ),
            SizedBox(
              height: 3.w,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextUtiles(
                    title: "Create new account ?",
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
                SizedBox(
                  width: 2.w,
                ),
                Container(
                  height: 6.w,
                  width: 19.w,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(RejesterUserScreen.name);
                    },
                    child: TextUtiles(
                      title: 'Sign up',
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                      side: MaterialStateProperty.all(
                        BorderSide(width: 1),
                      ),
                      // maximumSize: MaterialStateProperty.all()
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 7.w,
            ),
            Padding(
              padding: EdgeInsets.only(right: 7.5.w, left: 6.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 0.8,
                    width: 30.w,
                    color: Colors.black87,
                  ),
                  TextUtiles(
                      title: "or login with",
                      fontSize: 12.3,
                      fontWeight: FontWeight.normal),
                  Container(
                    height: 0.8,
                    width: 30.w,
                    color: Colors.black87,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.w,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 10.w,
                    width: 9.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      color: Colors.grey.shade200,
                    ),
                    child: Image.asset("assets/images/facebook.png", height: 3),
                  ),
                  Container(
                    height: 10.w,
                    width: 9.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      color: Colors.grey.shade200,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(2.w),
                      child: Container(
                          child: Image.asset(
                        "assets/images/gog.png",
                      )),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0.01.w,
            ),
            SizedBox(
              height: 3.w,
            ),
          ],
        ),
      ),
    );
  }
}
