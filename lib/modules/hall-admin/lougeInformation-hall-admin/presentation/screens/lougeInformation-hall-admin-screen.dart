import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/consts/app_colors.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import '../../../../../core/core_components/TextFormFeild.dart';
import '../../../../../core/core_components/app_scaffold.dart';
import '../../../../../core/core_components/button.dart';
import '../../../../../core/core_components/containerScreen.dart';
import '../../../../../core/core_components/textUtiles.dart';
import '../controller/lougeInformation-hall-admin/lougeInformation-hall-admin-binding.dart';
import '../controller/lougeInformation-hall-admin/lougeInformation-hall-admin-controller.dart';

class LougeInformationHallAdminScreen
    extends GetView<LougeInformationHallAdminController> {
  const LougeInformationHallAdminScreen({Key? key}) : super(key: key);

  static const name = '/LougeInformationHallAdminScreen';
  static final page = GetPage(
      name: name,
      page: () => const LougeInformationHallAdminScreen(),
      binding: LougeInformationHallAdminBinding());

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);
    return AppScaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.col4,
              AppColors.col4,
              AppColors.col4.withRed(5802),
              AppColors.col4.withRed(5801),
              AppColors.col4.withRed(5801),
              AppColors.col4.withRed(5802),
              AppColors.col4.withRed(5805),
              AppColors.col4.withRed(5811),
              AppColors.col4,
              AppColors.col4,
              AppColors.col4,
              AppColors.col4,
              AppColors.color4,

              ///////////////////////////
              //  AppColors.col4,
              //  AppColors.col4.withRed(5800),
              //  AppColors.col4.withRed(5800),
              //  AppColors.col4.withRed(5810),
              //  AppColors.col4.withRed(5820),
              // AppColors.col4,
              //  AppColors.col4,
              //  AppColors.col4,
              //   AppColors.color4,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        height: 190.w,
        width: 99.w,
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Padding(
              padding: EdgeInsets.only(left: 0.1.w, right: 0.1.w),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 12.w,
                  left: 8.w,
                  // right: 0.1.w,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        TextUtiles(title: "Welcome",fontSize:28 )
                        // Text(
                        //   "Welcome",
                        //   style: TextStyle(
                        //       fontSize: 28, fontWeight: FontWeight.bold),
                        // ),
                      ],
                    ),
                    Row(
                      children: [
                        TextUtiles(title: "Enter Your lounge information",)
                        // Text(
                        //   "Enter Your lounge information",
                        //   style: TextStyle(
                        //       fontSize: 13, fontWeight: FontWeight.bold),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 11.w,
                    ),
                    Row(
                      children: [
                        ContainerScreen(
                          title: "Insert a picture of the hall",
                          height: 17.w,
                          weight: 86.w,
                          fontSize: 12.4,
                          padding: Padding(padding: EdgeInsets.zero,),
                          sizedBox: SizedBox(width: 0,),
                          border: Border.all(width: 1.0,color: AppColors.col6),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    Row(
                      children: [
                        TextFieldWhite(
                          title: 'Enter the hall name',
                          icon: Icon(
                            Icons.person_outline,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    Row(
                      children: [
                        TextFieldWhite(
                          title: 'Enter the hall place',
                          icon: Icon(
                            Icons.person_outline,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    Row(
                      children: [
                        TextFieldWhite(
                          title: 'Enter the hall capacity',
                          icon: Icon(
                            Icons.email_outlined,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    Row(
                      children: [
                        TextFieldWhite(
                          title: 'Enter a contact number',
                          icon: Icon(
                            Icons.person_outline,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    Row(
                      children: [
                        ContainerScreen(
                          title: "chose the lounge type",
                        ),
                        // Container(
                        //   height: 12.w,
                        //   width: 86.w,
                        //   decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     border:Border(bottom: BorderSide(color: AppColors.col6,width: 1))
                        //   ),
                        //   child: Padding(
                        //     padding: EdgeInsets.only(left: 1.w),
                        //     child: Row(
                        //       children: [
                        //         Padding(
                        //           padding:
                        //               EdgeInsets.only(left: 2.5.w, top: 1.w),
                        //           child: Text(
                        //             "chose the lounge type",
                        //             style: TextStyle(
                        //                 color: Colors.black87,
                        //                 fontWeight: FontWeight.w400,
                        //                 fontSize: 3.1.w),
                        //           ),
                        //         ),
                        //         SizedBox(
                        //           width: 28.w,
                        //         ),
                        //         Padding(
                        //           padding:
                        //               EdgeInsets.only(bottom: 15.w, top: 1.w),
                        //           child: IconButton(
                        //             onPressed: () {},
                        //             icon: Icon(
                        //               Icons.arrow_drop_down,
                        //               size: 25,
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 12.w,
                    ),
                    Row(
                      children: [
                        ButtonScreen(title: "Send",onTap: (){}),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
