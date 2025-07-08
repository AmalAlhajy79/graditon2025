import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import '../../../../../../core/core_components/app_scaffold.dart';
import '../../../../../core/consts/api_const.dart';
import '../../../../../core/consts/app_colors.dart';
import '../../../../../core/core_components/navigationBar.dart';
import '../../../../../core/core_components/rating.dart';
import '../../../../../core/core_components/textUtiles.dart';
import '../controller/home-hall-admin/home-hall-admin-Controller.dart';
import '../controller/home-hall-admin/home-hall-admin-binding.dart';
class HomeHallAdminScreen extends StatefulWidget {
  final int hallId;
  HomeHallAdminScreen({required this.hallId});
  static const name = '/HomeHallAdminScreen';

  static GetPage<dynamic> page(int hallId) {
    return GetPage(
      name: name,
      page: () => HomeHallAdminScreen(hallId: hallId),
      binding: HallDetailsAdminBinding(),
    );
  }

  @override
  _HomeHallAdminScreenState createState() => _HomeHallAdminScreenState();
}

class _HomeHallAdminScreenState extends State<HomeHallAdminScreen> {
  late HallDetailsAdminController controller;
  @override
  void initState() {
    super.initState();
    controller = Get.find();

    // تأكد من أن controller تم تهيئته بشكل صحيح
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchHallDetails(widget.hallId); // هنا نمرر hallId الصحيح
    });
  }
  // @override
  // void initState() {
  //   super.initState();
  // controller = Get.find();
  //   // نداء fetchHallDetails هنا في initState بدلاً من build
  //   controller.fetchHallDetails(widget.hallId);
  // }

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;

    return
      AppScaffold(
      body:Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.errorMessage.value.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        } else if (controller.hallDetails.value == null) {
          return Center(child: Text('لا توجد بيانات'));
        } else {
          var hall = controller.hallDetails.value!;
          controller.hallId_public=hall.id;
          print('controller.hallId_public in homeHallAdmin:');
          print(controller.hallId_public);
          return Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 1.w, top: 6.w, right: 1.w, bottom: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtiles(
                        title: hall.name, //"Al-Shame Place",
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      )
                    ],
                  ),
                ),
                Container(
                  child: Stack(
                    //alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 2.w, right: 2.w),
                        child: Container(
                          height: 70.w,
                          width: mq.width,
                          decoration: BoxDecoration(
                            color: AppColors.col6,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 20.w),
                            child: Container(
                              //height: 50.w,
                              width: mq.width,
                              child: hall.hallImage != null
                                  ? Image.network(ApiConst.urlImage+hall.hallImage,
                                  fit: BoxFit.fitWidth)
                                  : SizedBox(),
                              // Image.asset("assets/images/hall1.jpg",
                              //     fit: BoxFit.fitWidth),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.only(top: 44.w, left: 2.w, right: 2.w),
                        child: Container(
                          height: 96.w,
                          width: mq.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8.w),
                                topLeft: Radius.circular(8.w),
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
                                height: 4.w,
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 4.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.notifications_none_outlined,
                                            color: Colors.black,
                                            size: 20,
                                          ),
                                          TextUtiles(
                                              title: " Subscribe",
                                              fontWeight: FontWeight.w400),
                                        ],
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateProperty.all(
                                            Color(0xEF08C00C)
                                                .withAlpha(100)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 4.w),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.place_outlined,
                                      size: 22,
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    TextUtiles(
                                        title: hall.location,
                                        //"Syria, Damascus, Mezzeh",
                                        fontSize: 12,
                                        colorTextStyle:
                                        Colors.black87.withAlpha(170)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 2.5.w,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 4.w),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.people_alt_rounded,
                                      size: 21,
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    TextUtiles(
                                        title: '${hall.capacity}',
                                        //"300 person",
                                        fontSize: 12,
                                        colorTextStyle:
                                        Colors.black87.withAlpha(170)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 2.5.w,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 4.w),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.phone_outlined,
                                      size: 21,
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    TextUtiles(
                                        title: '${hall.contact}',
                                        //"0987654321",
                                        fontSize: 12,
                                        colorTextStyle:
                                        Colors.black87.withAlpha(170)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 2.5.w,
                              ),
                              Padding(
                                  padding:
                                  EdgeInsets.only(right: 25.w, left: 4.3.w),
                                  child: RatingContainer()),
                              SizedBox(
                                height: 2.7.w,
                              ),
                              Padding(
                                padding:
                                EdgeInsets.only(right: 25.w, left: 4.w),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 8.w,
                                      width: 28.w,
                                      child: Center(
                                        child: TextUtiles(
                                            title: "Lounge photos :",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12),
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                        BorderRadius.circular(2.w),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            // مدى انتشار الظل
                                            blurRadius: 4,
                                            // مدى تمويه الظل
                                            offset: Offset(
                                                0, 3), // الإزاحة (يمين، أسفل)
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 3.5.w,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 3.w),
                                child: Container(
                                  height: 36.w,
                                  width: mq.width,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        // مدى انتشار الظل
                                        blurRadius: 5,
                                        // مدى تمويه الظل
                                        offset: Offset(
                                            0, 3), // الإزاحة (يمين، أسفل)
                                      ),
                                    ],
                                  ),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount:  hall.images.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 2.w), // مسافة بين الصور
                                        child: hall.images[index] != null
                                            ? ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(1),
                                          child: Image.network(
                                            ApiConst.urlImage+ hall.images[index],
                                            fit: BoxFit.cover,
                                            width: 42.w, // عرض كل صورة
                                          ),
                                          // Image.asset(
                                          //   "assets/images/hallPicture1.jpg",
                                          //   fit: BoxFit.cover,
                                          //   width: 42.w, // عرض كل صورة
                                          // ),
                                        )
                                            : SizedBox(),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      }),

      bottomNavigationBar: CustomBottomNavigationBar(hallId: widget.hallId),
    );
  }
}

