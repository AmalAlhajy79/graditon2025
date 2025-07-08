import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/core_components/button.dart';
import 'package:hall_gradition/core/core_components/textUtiles.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import '../../../../../../core/core_components/app_scaffold.dart';
import '../../../../../core/consts/api_const.dart';
import '../../../../../core/consts/app_colors.dart';
import '../../../../../core/core_components/navigationBar.dart';
import '../../../home-hall-admin/presentation/controller/home-hall-admin/home-hall-admin-Controller.dart';
import '../../../myEmployees-hall-admin/presentation/controller/myEmployees-hallAdmin/myEmployees-hallAdmin-Controller.dart';
import '../controller/notification-hallAdmin/notification-hallAdmin-Controller.dart';
import '../controller/notification-hallAdmin/notification-hallAdmin-binding.dart';

class NotificationHallAdminScreen extends GetView<NotificationHallAdminController> {
  static const name = '/notificationHallAdminScreen';
  static final page = GetPage(
      name: name,
      page: () => NotificationHallAdminScreen(),
      binding: NotificationAdminHallBinding());

  @override
  Widget build(BuildContext context) {
    ApprovedAssistantController approvedAssistantController=Get.find();
    var mq = MediaQuery.of(context).size;
    var hallId=0;
    return AppScaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 5.w),
              child: Container(
                height: 20.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
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
                            color: Colors.black87,
                            weight: 15.w,
                          )),
                      SizedBox(
                        width: 22.w,
                      ),
                      TextUtiles(
                        title: "Notifications",
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Row(
                children: [
                  TextUtiles(title: "New", fontSize: 14),
                ],
              ),
            ),
            SizedBox(
              height: 2.5.w,
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              HallDetailsAdminController hallDetailsAdminController=Get.put(HallDetailsAdminController());
              return Container(
                height: 120.w,
                width: 90.w,
                child: ListView.builder(
                  itemCount: controller.pendingUsers.length,
                  itemBuilder: (context, index) {
                    final notification = controller.pendingUsers[index].user;
                    final idAsstant=controller.pendingUsers[index].id;
                    hallId=hallDetailsAdminController.hallId_public;//hallDetails.value!.id;
                    print('................hallId in NotificationScreen \n');
                    print(hallId);
                    return
                      Padding(
                        padding:  EdgeInsets.only(bottom: 2.w),
                        child: InkWell(
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
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(8)),
                                            border: Border(
                                              left: BorderSide(
                                                  color: AppColors.col6.withAlpha(80),
                                                  width: 2),
                                              right: BorderSide(
                                                  color: AppColors.col6.withAlpha(80),
                                                  width: 2),
                                              top: BorderSide(
                                                  color: AppColors.col6.withAlpha(80),
                                                  width: 2),
                                              bottom: BorderSide(
                                                  color: AppColors.col6.withAlpha(80),
                                                  width: 2),
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
                                                padding: EdgeInsets.only(
                                                    left: 4.5.w, top: 5.w),
                                                child: Row(
                                                  children: [
                                                    TextUtiles(
                                                      title:notification.name,// "Raghad Ahmad",
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
                                                      title: notification.email,//"raghadahmad@gmail.com",
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
                                                      title:notification.number, //"0987654323",
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
                                            height: 30.w,
                                            decoration: BoxDecoration(
                          color: AppColors.white,
                          // color: Colors.grey.withAlpha(70),
                          border: Border(
                              bottom: BorderSide(color: Colors.black87, width: 2))),
                                            child: Column(
                                              children: [
                          ListTile(
                            title: TextUtiles(title: notification.name,//"Raghad Ahmad",
                                    fontSize: 16.5),
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
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(8)),
                                              border: Border(
                                                left: BorderSide(
                                                    color: AppColors.col6.withAlpha(80),
                                                    width: 2),
                                                right: BorderSide(
                                                    color: AppColors.col6.withAlpha(80),
                                                    width: 2),
                                                top: BorderSide(
                                                    color: AppColors.col6.withAlpha(80),
                                                    width: 2),
                                                bottom: BorderSide(
                                                    color: AppColors.col6.withAlpha(80),
                                                    width: 2),
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
                                                  padding: EdgeInsets.only(
                                                      left: 4.5.w, top: 5.w),
                                                  child: Row(
                                                    children: [
                                                      TextUtiles(
                                                        title:notification.name,// "Raghad Ahmad",
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
                                                        title: notification.email,//"raghadahmad@gmail.com",
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
                                                        title:notification.number, //"0987654323",
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
                            subtitle: TextUtiles(
                                title: "2 hours",
                                fontSize: 12,
                                colorTextStyle: Colors.black54),
                            leading: CircleAvatar(
                              backgroundImage: notification.photoUrl != null
                                  ? NetworkImage(ApiConst.urlImage+notification.photoUrl!)
                                  : null,
                              child: notification.photoUrl == null
                                  ? Icon(Icons.person)
                                  : null,
                              maxRadius: 7.5.w, // يمكنك تعديل القيمة حسب الحاجة
                            )

                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ButtonScreen(
                                  title: 'accepte',
                                  onTap: () {
                                    print('id....accepte.......');
                                    print(notification.id);
                                    controller.ApprovedAssistant(idAsstant);
                                    controller.fetchPendingUsers();
                                    approvedAssistantController.fetchApprovedUsers();
                                    },
                                  colorContainer: Color(0xE536E005),
                                  weight: 19.w,
                                  //fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  height: 7.w,
                                  //  decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.w))),
                              // ),
                              SizedBox(
                                width: 5.w,
                              ),
                              ButtonScreen(
                                  title: 'cancel',
                                  onTap: () {
                                    print('id...cancel........');
                                    print(notification.id);
                                    controller.RejectedAssistant(idAsstant);
                                    controller.fetchPendingUsers();
                                    },
                                  weight: 19.w,
                                  fontSize: 13,
                                  height: 7.w,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.w))),
                            ],
                          )
                                              ],
                                            )),
                        ),
                      );
            },
            ),
    );
            }),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(hallId: hallId),
    );
  }
}
