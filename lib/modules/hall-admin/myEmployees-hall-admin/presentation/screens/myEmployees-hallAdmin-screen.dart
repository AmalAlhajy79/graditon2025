import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/core_components/button.dart';
import 'package:hall_gradition/core/core_components/textUtiles.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import '../../../../../../core/core_components/app_scaffold.dart';
import '../../../../../core/consts/app_colors.dart';
import '../../../../../core/core_components/navigationBar.dart';
import '../controller/myEmployees-hallAdmin/myEmployees-hallAdmin-binding.dart';

class MyEmployeesHallAdminScreen extends StatelessWidget {
  static const name = '/myEmployeesHallAdminScreen';
  static final page = GetPage(
      name: name,
      page: () => MyEmployeesHallAdminScreen(),
      binding: MyEmployeesAdminHallBinding());

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return AppScaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 2.w),
              child: Container(
                height: 20.w,
                decoration: BoxDecoration(
                  color: AppColors.col6,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 1, // مدى انتشار الظل
                      blurRadius: 4, // مدى تمويه الظل
                      offset: Offset(0, 3), // الإزاحة (يمين، أسفل)
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 4.w),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_sharp,
                            size: 17,
                            color: Colors.white,
                            weight: 15.w,
                          )),
                      SizedBox(
                        width: 20.w,
                      ),
                      TextUtiles(
                        title: "Employees",
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        colorTextStyle: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 1.w,),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Container(
                      //  color: Colors.white10,
                      child: Dialog(
                        // backgroundColor: Colors.white, //
                        child: Container(
                          height: 50.w,
                          width: 82.w,
                          decoration: BoxDecoration(
                            //     color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                border: Border(
                                  left: BorderSide(color: AppColors.col6.withAlpha(80),width: 2),
                                  right: BorderSide(color: AppColors.col6.withAlpha(80),width: 2),
                                  top: BorderSide(color: AppColors.col6.withAlpha(80),width: 2),
                                  bottom: BorderSide(color: AppColors.col6.withAlpha(80),width: 2),
                                )),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 4.1.w,
                                  bottom: 4.1.w,
                                  left: 3.w,
                                  right: 3.w),
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 4.5.w, top: 5.w),
                                    child: Row(
                                      children: [
                                        TextUtiles(
                                          title: "Raghad Ahmad",
                                          fontWeight: FontWeight.w800,
                                          fontSize: 21,
                                          colorTextStyle: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 7.w),
                                  Padding(
                                    padding: EdgeInsets.only(left: 6.7.w),
                                    child: Row(
                                      children: [
                                        Icon(Icons.email_outlined),
                                        SizedBox(width: 3.w),
                                        TextUtiles(
                                          title: "raghadahmad@gmail.com",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          colorTextStyle: Colors.black54,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 4.w),
                                  Padding(
                                    padding: EdgeInsets.only(left: 6.7.w),
                                    child: Row(
                                      children: [
                                        Icon(Icons.numbers),
                                        SizedBox(width: 3.w),
                                        TextUtiles(
                                          title: "0987654323",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          colorTextStyle: Colors.black54,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                  height: 28.w,
                  decoration: BoxDecoration(
                      color: AppColors.col6.withAlpha(30),
                      // color: Colors.grey.withAlpha(70),
                      border: Border(
                        bottom: BorderSide(color: Colors.black87, width: 1.2),
                        // top:
                      )),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 3.w,
                      ),
                      ListTile(
                        title: TextUtiles(
                          title: "Raghad Ahmad",
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        onTap: () {},
                        leading: CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/geirl.jpg"),
                            maxRadius: 7.w),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 6.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ButtonScreen(
                                title: 'cancel',
                                onTap: () {},
                                weight: 19.4.w,
                                fontSize: 13.8,
                                height: 7.5.w,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2.w))),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
