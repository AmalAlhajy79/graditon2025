import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import 'package:hall_gradition/modules/user/home-user/presentation/screens/homeScreen-user.dart';
import '../../../../../../../core/consts/app_colors.dart';
import '../../../../../../../core/core_components/TextFormFeild.dart';
import '../../../../../../../core/core_components/app_scaffold.dart';
import '../../../../../../../core/core_components/button.dart';
import '../../../../../../../core/core_components/textUtiles.dart';
import '../components/dropdown-Button-ChooseRole.dart';
import '../components/textFielgrey.dart';
import '../controller/rejester-user/rejester-user-binding.dart';
import '../controller/rejester-user/rejester-user-controller.dart';

class RejesterUserScreen extends GetView<RejesterUserControllerrr> {
  const RejesterUserScreen({Key? key}) : super(key: key);

  static const name = '/RejesterUserScreen';
  static final page = GetPage(
      name: name,
      page: () => const RejesterUserScreen(),
      binding: RejesterUserBinding());

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);
    return AppScaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white70),
        height: 190.w,
        width: 99.w,
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                Container(
                  width: mq.size.width,
                  height: 16.w,
                  color: AppColors.zayteFateh,
                  child: Center(
                    child: TextUtiles(title: 'Sign up', fontSize: 16),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 0.1.w, right: 0.1.w),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 3.w,
                      left: 8.w,
                      // right: 0.1.w,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 117.w,
                          child: ListView(
                            children: [
                              Center(
                                child: Obx(() {
                                  return InkWell(
                                      onTap: () {
                                        controller.pickImage();
                                      },
                                      child: Container(
                                        height: 18.w,
                                        width: 18.w,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            // borderRadius: BorderRadius.zero,
                                            // border: Border(bottom: BorderSide(color: Colors.black54, width: 1)),
                                            shape: BoxShape.circle),
                                        child: controller.hallImage.isEmpty
                                            ? Icon(
                                                Icons.person,
                                                size: 17.w,
                                                color: Colors.grey,
                                              )
                                            : ClipRRect(
                                          borderRadius:BorderRadius.all(Radius.circular(15.w)),
                                              child: Image.file(
                                                  File(
                                                      controller.hallImage.value),
                                                  fit: BoxFit.cover,
                                                ),
                                            ),
                                      ));
                                }),
                              ),
                              SizedBox(
                                height: 2.w,
                              ),
                              Row(
                                children: [ChooseRoleDropdown()],
                              ),
                              SizedBox(
                                height: 2.w,
                              ),
                              Row(
                                children: [
                                  TextFieldgrey(
                                    title: 'Enter your full name',
                                    controller: controller.NameController,
                                    icon: Icon(
                                      Icons.person_outline,
                                      size: 25,
                                    ),
                                    colorContainer: Colors.grey.shade200,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.w,
                              ),
                              Row(
                                children: [
                                  TextFieldgrey(
                                    title: 'Enter your email',
                                    controller: controller.emailController,
                                    icon: Icon(
                                      Icons.email_outlined,
                                      size: 25,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.w,
                              ),
                              Row(
                                children: [
                                  TextFieldgrey(
                                    title: 'Enter your password',
                                    controller:
                                        controller.passwordController,
                                    icon: Icon(
                                      Icons.lock_outlined,
                                      size: 25,
                                    ),
                                    suffixIcon: Icon(Icons.remove_red_eye_rounded,color: Colors.black54,),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.w,
                              ),
                              Row(
                                children: [
                                  TextFieldgrey(
                                    title: 'Confirm password',
                                    controller:
                                        controller.passwordConfController,
                                    icon: Icon(
                                      Icons.lock_outlined,
                                      size: 25,
                                    ),
                                    suffixIcon: Icon(Icons.remove_red_eye_rounded,color: Colors.black54,),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.w,
                              ),
                              Row(
                                children: [
                                  TextFieldgrey(
                                    title: 'Enter your location',
                                    controller:
                                        controller.locationController,
                                    icon: Icon(
                                      Icons.place_outlined,
                                      size: 25,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.w,
                              ),
                              Row(
                                children: [
                                  TextFieldgrey(
                                    title: 'Enter your number',
                                    controller:
                                        controller.numberController,
                                    icon: Icon(
                                      Icons.phone_outlined,
                                      size: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8.6.w,
                        ),
                        Row(
                          children: [
                            ButtonScreen(
                                title: "Sign up",
                                colorContainer: AppColors.zayteGamiq,
                                fontWeight: FontWeight.w500,
                                onTap: () async {
                                  controller.rejester_user();
                                }),
                          ],
                        ),
                        SizedBox(
                          height: 3.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextUtiles(title: "Already have an account ?",fontSize: 11,fontWeight: FontWeight.w500),
                            SizedBox(
                              width: 2.w,
                            ),
                            Container(
                              height: 6.w,
                              width:20.w,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.toNamed(HomeUserScreen.name);
                                },
                                child: TextUtiles(
                                  title: 'Sign in',
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => Colors.white),
                                    side: MaterialStateProperty.all(
                                      BorderSide(width: 1),
                                    ),
                                  // maximumSize: MaterialStateProperty.all()
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
