import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/consts/app_colors.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import '../../../../../core/core_components/TextFormFeild.dart';
import '../../../../../core/core_components/app_scaffold.dart';
import '../../../../../core/core_components/button.dart';
import '../../../../../core/core_components/containerScreen.dart';
import '../../../../../core/core_components/textUtiles.dart';
import '../components/dropdown-Button-loungeType.dart';
import '../components/dropdown-Button.dart';
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
          color:Colors.blueGrey.shade50
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
                      height: 6.7.w,
                    ),
Container(
  height: 113.w,
  child:   ListView(
    children: [
      Row(
        children: [
          ContainerScreen(
            title: "Insert a picture of the hall",
            height: 18.5.w,
            weight: 86.w,
            fontSize: 12.4,
            padding: Padding(padding: EdgeInsets.zero,),
            sizedBox: SizedBox(width: 0,),
            border: Border.all(width: 1.0,color: Colors.black54),
          )
        ],
      ),
      SizedBox(
        height: 3.5.w,
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
        height:  3.5.w,
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
        height:  3.5.w,
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
        height:  3.5.w,
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
        height:  3.5.w,
      ),
      Row(
        children: [
          loungeTypeDropdown()
          // ContainerScreen(
          //   title: "chose the lounge type",
          // ),
        ],
      ),
      SizedBox(
        height:  3.5.w,
      ),
      Row(
        children: [
          TypeEventsHallDropdown(),
          // ContainerScreen(
          //   title: "chose the type of events in the hall",
          // ),

        ],
      ),  SizedBox(
        height:  3.5.w,
      ),
      Row(
        children: [
          ContainerScreen(
            title: "Enter photos of your lounge",
            height: 21.w,
            weight: 86.w,
            fontSize: 12.4,
            padding: Padding(padding: EdgeInsets.zero,),
            sizedBox: SizedBox(width: 0,),
            border: Border.all(width: 1.0,color: Colors.black54),
          )
        ],
      ),
    ],
  ),
),

                    SizedBox(
                      height: 5.6.w,
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
