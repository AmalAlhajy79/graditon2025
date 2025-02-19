import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/consts/app_colors.dart';
import 'package:hall_gradition/core/core_components/button.dart';
import 'package:hall_gradition/core/core_components/textUtiles.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import '../../../../../../core/core_components/TextFormFeild.dart';
import '../../../../../../core/core_components/app_scaffold.dart';
import '../controller/EditProfile-hallAdmin/EditProfile-HallAdmin-binding.dart';

class EditProfileHallAdminScreen extends StatelessWidget {
  // const WaitHallAdminScreen({Key? key}) : super(key: key);

  static const name = '/EditProfileHallAdminScreen';
  static final page = GetPage(
      name: name,
      page: () => EditProfileHallAdminScreen(),
      binding: EditProfileAdminHallBinding());

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return AppScaffold(
        body: Container(
      child: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.only(left: 3.6.w, top: 6.w, right: 30.w, bottom: 5.w),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      size: 14,
                    )),
                SizedBox(
                  width: 24.w,
                ),
                TextUtiles(
                  title: "Edit Profile",
                  fontWeight: FontWeight.w600,
                )
              ],
            ),
          ),
          Container(
            child: Stack(
              //alignment: AlignmentDirectional.bottomCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 6.w),
                  child: Container(
                    height: 70.w,
                    width: 88.w,
                    decoration: BoxDecoration(
                      color: AppColors.col6,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8.w),
                          topLeft: Radius.circular(8.w)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 25.w, right: 25.w, top: 6.w, bottom: 43.w),
                      child: Container(
                        // height: 10.w,
                        // width: 13.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white, //.withAlpha(200)
                        ),
                        child: Icon(
                          Icons.person,
                          color: AppColors.greyfield,
                          size: 77,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 23.1.w, left: 52.5.w, right: 6.w, bottom: 42.w),
                  child: Container(
                    height: 4.w,
                    width: 4.5.w,
                    //child:
                    // Padding(
                    //   padding: EdgeInsets.only(top:0,bottom: 28),
                    //   child: IconButton(
                    //     onPressed: () {},
                    //     icon: Icon(Icons.camera_alt_outlined,size: 14,color: Colors.black),
                    //   ),
                    // ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only( top: 19.4.w, left: 48.9.w, right: 15.w, bottom: 59.w),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.camera_alt_outlined,size: 14,color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 43.w, left: 6.w, right: 6.w),
                  child: Container(
                    height: 85.w,
                    width: 95.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(13.w),
                          topLeft: Radius.circular(13.w),
                        ),
                        color: Colors.white,
                        border: Border(
                          right: BorderSide(
                            width: 0.5,
                            color: Colors.grey,
                          ),
                          left: BorderSide(
                            width: 0.5,
                            color: Colors.grey,
                          ),
                        )),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 11.5.w,
                        ),
                        TextFieldWhite(
                          title: "Enter Full name",
                          icon: Icon(Icons.person_outline, size: 23),
                          colorContainer: AppColors.color3.withAlpha(80),
                          weight: 79.w,
                        ),
                        SizedBox(
                          height: 2.7.w,
                        ),
                        TextFieldWhite(
                          title: "Enter your email",
                          icon: Icon(Icons.email_outlined, size: 23),
                          colorContainer: AppColors.color3.withAlpha(80),
                          weight: 79.w,
                        ),
                        SizedBox(
                          height: 2.7.w,
                        ),
                        TextFieldWhite(
                          title: "Enter your number",
                          icon: Icon(Icons.phone_outlined, size: 23),
                          colorContainer: AppColors.color3.withAlpha(80),
                          weight: 79.w,
                        ),
                        SizedBox(
                          height: 14.5.w,
                        ),
                        ButtonScreen(
                          title: "Save Change",
                          onTap: () {},
                          weight: 74.w,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 6.8.w,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 0.1),
              child: Row(
                children: [
                  Container(
                    height: 13.w,
                    width: mq.width * 0.70,
                    child: Image.asset("assets/images/round4.png",
                        fit: BoxFit.values.first),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
