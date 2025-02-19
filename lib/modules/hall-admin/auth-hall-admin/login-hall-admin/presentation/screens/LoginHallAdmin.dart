import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:hall_gradition/core/core_components/app_scaffold.dart';
import 'package:hall_gradition/core/core_components/button.dart';
import 'package:hall_gradition/core/core_components/textUtiles.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';

import '../../../../../../core/consts/app_colors.dart';
import '../../../../../../core/core_components/TextFormFeild.dart';
import '../controller/store-provider-profile/login-HallAdmin-binding.dart';

class LoginHallAdmin extends StatelessWidget {
  LoginHallAdmin({Key? key}) : super(key: key);
  static const name = '/LoginHallAdmin';
  static final page = GetPage(
      name: name,
      page: () => LoginHallAdmin(),
      binding: LoginHallAdminBinding());

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return AppScaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 45.w,
              width: mq.width,
              child: Image.asset("assets/images/round.png",
                  fit: BoxFit.values.first),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Row(
                children: [
                  TextUtiles(title: "Login", fontSize: 21),
                ],
              ),
            ),
            SizedBox(
              height: 15.w,
            ),
            TextFieldWhite(
              title: "Enter your email",
              icon: Icon(Icons.email_outlined, size: 23),
              colorContainer: AppColors.color3.withAlpha(80),
              weight: 85.w,
            ),
            SizedBox(
              height: 2.6.w,
            ),
            TextFieldWhite(
              title: "Enter your password",
              icon: Icon(Icons.lock_outlined, size: 23),
              colorContainer: AppColors.color3.withAlpha(80),
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
                  TextUtiles(title: "Forgit password?", fontSize: 12.6),
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
                onTap: (){},
              ),
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
                      fontSize: 11.3,
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
              padding: EdgeInsets.only(left: 20.w,right: 20.w),
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
                    child: Image.asset("assets/images/facebook.png",height: 3),
                  ),
                   Container(
                    height: 10.w,
                    width: 9.w,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.all(Radius.circular(9)),
                       color: Colors.grey.shade200,
                     ),
                    child: Padding(
                      padding:  EdgeInsets.all(2.w),
                      child: Container(
                          child: Image.asset("assets/images/gog.png" ,)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0.01.w,
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
            // Padding(
            //   padding: EdgeInsets.only(left: 19.w),
            //   child: Row(
            //     children: [
            //       Container(
            //         height: 4.6.w,
            //         width: 4.6.w,
            //         decoration: BoxDecoration(
            //          // borderRadius: BorderRadius.all(Radius.circular(9)),
            //           color: AppColors.col6,
            //           shape: BoxShape.circle
            //         ),
            //         //child: Image.asset("assets/images/facebook.png",height: 3),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 0.5.w,
            // ),
            // Padding(
            //   padding: EdgeInsets.only(left: 1.w),
            //   child:
            //   Row(
            //     children: [
            //       SizedBox(
            //         child: Container(
            //           height: 11.w,
            //           width: 10.w,
            //           decoration: BoxDecoration(
            //             // borderRadius: BorderRadius.all(Radius.circular(9)),
            //               color: AppColors.col6,
            //               shape: BoxShape.circle
            //           ),
            //           //child: Image.asset("assets/images/facebook.png",height: 3),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

          ],
        ),
      ),
    );
  }
}