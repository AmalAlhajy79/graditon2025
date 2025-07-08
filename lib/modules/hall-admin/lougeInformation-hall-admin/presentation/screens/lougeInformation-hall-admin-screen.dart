import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import '../../../../../core/consts/api_const.dart';
import '../../../../../core/core_components/TextFormFeild.dart';
import '../../../../../core/core_components/app_scaffold.dart';
import '../../../../../core/core_components/button.dart';
import '../../../../../core/core_components/textUtiles.dart';
import '../components/dropdown-Button-loungeType.dart';
import '../components/dropdown-Button.dart';
import '../controller/lougeInformation-hall-admin/lougeInformation-hall-admin-binding.dart';
import '../controller/lougeInformation-hall-admin/lougeInformation-hall-admin-controller.dart';

class LougeInformationHallAdminScreen extends GetView<HallControllerrr> {
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
      body:
      Container(
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
                      ],
                    ),
                    Row(
                      children: [
                        TextUtiles(title: "Enter Your lounge information",)
                      ],
                    ),
                    SizedBox(
                      height: 4.w,
                    ),
Container(
  height: 117.w,
  child:   ListView(
    children: [

      Row(
        children: [

      Obx(() {
        return  InkWell(
          onTap: () {
            controller.pickImage();
          },
          child: Container(
            height:  24.w,
            width: 86.w,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.zero,
                border: Border(bottom: BorderSide(color: Colors.black54, width: 1))
            ),

            child: controller.hallImage.isEmpty
                ? Text('ادخل صورة')
                : Image.file(
              File(controller.hallImage.value),
              fit: BoxFit.cover,
            ),

          )
        );
      }),

        ],
      ),
      SizedBox(
        height: 3.5.w,
      ),
      Row(

        children: [
          TextFieldWhite(
            title: 'Enter the hall name',
            controller: controller.hallNameController,
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
            controller: controller.hallPlaceController,
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
            controller: controller.hallCapacityController,
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
            controller: controller.contactNumberController,
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
          Obx(() {
            return InkWell(
              onTap: () {
                controller.pickImages();
              },
              child: Container(
                height:  24.w,
                width: 86.w, // تعديل العرض حسب الحاجة
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.zero,
                  border: Border.all(color: Colors.black54, width: 1),
                ),
                child: controller.imagePaths.isEmpty
                    ? Center(child: Text('ادخل صور'))
                    : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // عدد الأعمدة
                    childAspectRatio: 1, // نسبة العرض إلى الارتفاع
                  ),
                  itemCount: controller.imagePaths.length,
                  itemBuilder: (context, index) {
                    return Image.file(
                      File(controller.imagePaths[index]),
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            );
          }),
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
                        ButtonScreen(title: "Send",onTap: () async {
                          controller.createHall();

                        }),
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
