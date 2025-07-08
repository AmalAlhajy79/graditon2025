import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/consts/api_const.dart';
import 'package:hall_gradition/core/consts/app_colors.dart';
import 'package:hall_gradition/core/core_components/textUtiles.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import 'package:hall_gradition/modules/user/booking/presentation/screens/Booking-UserScreen.dart';
import 'package:hall_gradition/modules/user/inquiry/presentation/screens/send-and-view-user-inquiry.dart';
import '../../../../../../core/core_components/app_scaffold.dart';
import '../../../../../../core/core_components/button.dart';
import '../../../../../../core/core_components/navBar-user-hall.dart';
import '../../../../home-user/presentation/controller/home-user-controller.dart';
import '../../../../joys-hall/services-hall/services-joys-hall/presentation/screens/Joys-Hall-Services-screen.dart';
import '../../../../relieved-hall/services-hall/services-releved-hall/presentation/screens/relieved-hall.dart';
import '../../../services-hall/services-both-Jo-Re-hall/presentation/screens/services-both-Jo-Re-screen.dart';
import '../../data/models/details-oneHall-model.dart';
import '../components/view-rating-onHall-details.dart';
import '../controller/both-joys-relieved-detail-pinding.dart';
import '../controller/both-joys-relived-details-controller.dart';
import 'joys-or-relevied-photo-screen.dart';
import 'joys-or-relevied-viedio-screen.dart';
import 'joys-reliev-details-photo.dart';
import 'joys-reliev-details-video.dart';

class BothDetailsJoysReHallScreen
    extends GetView<BothDetailsJoysReHallController> {
  // const WaitHallAdminScreen({Key? key}) : super(key: key);

  static const name = '/BothDetailsJoysReHallScreen';
  static final page = GetPage(
      name: name,
      page: () => BothDetailsJoysReHallScreen(),
      binding: BothDetailsJoysReHallBinding());

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    HomeUserController homeUserController=Get.put(HomeUserController());

    return AppScaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        } else {
          ViewDetailsOneHallModel hall = controller.hallDetails.value;
          var typeHall = controller.hallDetails.value.type;
          return Container(
            //color: Colors.grey.shade300,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 3.5.w, top: 3.4.w, right: 4.w, bottom: 1.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(Icons.arrow_back_ios)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextUtiles(
                            title: hall.name.toString(),
                            //"Al-Shame Place Hall",
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                          Rating_ViewOneHall_Container()
                        ],
                      ),
                      CircleAvatar(
                        backgroundImage: hall.hallImage != null
                            ? NetworkImage(ApiConst.urlImage+hall.hallImage!)
                            : null,
                        child: hall.hallImage == null
                            ?  Container()
                            : null,
                      )
                    ],
                  ),
                ),
                Container(
                  child: Stack(
                    children: [
                      // SizedBox(height: 1.w,),
                      Padding(
                        padding: EdgeInsets.only(left: 4.w, right: 5.w),
                        child: Container(
                          height: 135.w,
                          width: mq.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                // bottomLeft: Radius.circular(6.w),
                                // bottomRight: Radius.circular(6.w),

                                ),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                height: 127.w,
                                width: mq.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(6.w),
                                    bottomRight: Radius.circular(6.w),
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
                                    bottom: BorderSide(
                                      width: 0.6,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              ListView(
                                children: [
                                  Container(
                                    height: 128.w,
                                    width: mq.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(6.w),
                                        bottomRight: Radius.circular(6.w),
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
                                        bottom: BorderSide(
                                          width: 0.6,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 1.w,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 2.w, left: 2.w),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 40.w,
                                                width: mq.width * 0.85,
                                                decoration: BoxDecoration(
                                                  color: AppColors.white,
                                                ),
                                                child: hall.hallImage != null
                                                    ? Container(
                                                        //height: 50.w,
                                                        //width: mq.width,
                                                        child: Image.network(
                                                          ApiConst.urlImage +
                                                              '${hall.hallImage}',
                                                          fit: BoxFit.cover,
                                                        ),
                                                        // Image.asset(ApiConst.urlImage+ '${hall.hallImage}',
                                                        //     fit: BoxFit.fitWidth),
                                                      )
                                                    : Container(
                                                        height: 40.w,
                                                        width: mq.width * 0.85,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              AppColors.white,
                                                        ),
                                                        child: Container(
                                                            //height: 50.w,
                                                            //width: mq.width,
                                                            child: Text('')),
                                                      ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3.w,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 4.w),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.house_siding_rounded,
                                                size: 21,
                                              ),
                                              SizedBox(
                                                width: 3.w,
                                              ),
                                              TextUtiles(
                                                  title:
                                                      "A hall for ${hall.events?.join(', ')}",
                                                  fontSize: 12.5,
                                                  colorTextStyle: Colors.black87
                                                      .withAlpha(170)),
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
                                                Icons.place_outlined,
                                                size: 22,
                                              ),
                                              SizedBox(
                                                width: 3.w,
                                              ),
                                              TextUtiles(
                                                  title:
                                                      hall.location.toString(),
                                                  //"Syria, Damascus, Mezzeh",
                                                  fontSize: 12.5,
                                                  colorTextStyle: Colors.black87
                                                      .withAlpha(170)),
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
                                                  title:
                                                      "${hall.capacity} person",
                                                  //"300 person",
                                                  fontSize: 12.5,
                                                  colorTextStyle: Colors.black87
                                                      .withAlpha(170)),
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
                                                  title:
                                                      hall.contact.toString(),
                                                  // "0987654321",
                                                  fontSize: 12.5,
                                                  colorTextStyle: Colors.black87
                                                      .withAlpha(170)),
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
                                                Icons.access_time,
                                                size: 21,
                                              ),
                                              SizedBox(
                                                width: 3.w,
                                              ),
                                              TextUtiles(
                                                  title: "open now",
                                                  fontSize: 12.5,
                                                  colorTextStyle: Colors.green
                                                      .withAlpha(170)),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4.w,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 4.w, right: 5.w),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Stack(
                                                children: [
                                                  Container(
                                                    height: 27.w,
                                                    width: 32.w,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 9.w, top: 1.w),
                                                      child: TextUtiles(
                                                          title: "price",
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 13.8),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade300,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2.w),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    bottom: 0,
                                                    child: Container(
                                                      height: 20.w,
                                                      width: 32.w,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 2.5.w,
                                                                top: 1.6.w),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                TextUtiles(
                                                                    title:
                                                                        "2 hours:",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        12),
                                                                SizedBox(
                                                                  width: 2.w,
                                                                ),
                                                                TextUtiles(
                                                                    title:
                                                                        "20 \$",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        12),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                TextUtiles(
                                                                    title:
                                                                        "3 hours:",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        12),
                                                                SizedBox(
                                                                  width: 2.w,
                                                                ),
                                                                TextUtiles(
                                                                    title:
                                                                        "30 \$",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        12),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                TextUtiles(
                                                                    title:
                                                                        "4 hours:",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        12),
                                                                SizedBox(
                                                                  width: 2.w,
                                                                ),
                                                                TextUtiles(
                                                                    title:
                                                                        "40 \$",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        12),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 1.w,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2.w),
                                                        border: Border(
                                                          right: BorderSide(
                                                            width: 0.5,
                                                            color: Colors.grey,
                                                          ),
                                                          left: BorderSide(
                                                            width: 0.5,
                                                            color: Colors.grey,
                                                          ),
                                                          bottom: BorderSide(
                                                            width: 0.5,
                                                            color: Colors.grey,
                                                          ),
                                                          top: BorderSide(
                                                            width: 0.5,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Stack(
                                                children: [
                                                  Container(
                                                    height: 27.w,
                                                    width: 45.w,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 9.w, top: 1.w),
                                                      child: TextUtiles(
                                                          title:
                                                              "Available events",
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 13.8),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade300,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2.w),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    bottom: 0,
                                                    child: Container(
                                                      height: 20.w,
                                                      width: 45.w,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 3.5.w,
                                                                top: 1.6.w),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                TextUtiles(
                                                                    title: ".",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900,
                                                                    fontSize:
                                                                        13),
                                                                SizedBox(
                                                                  width: 2.w,
                                                                ),
                                                                TextUtiles(
                                                                    title:
                                                                        "Womens meeting",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        12),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                TextUtiles(
                                                                    title: ".",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900,
                                                                    fontSize:
                                                                        13),
                                                                SizedBox(
                                                                  width: 2.w,
                                                                ),
                                                                TextUtiles(
                                                                    title:
                                                                        "Receiving pilgrims",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        12),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                TextUtiles(
                                                                    title: ".",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900,
                                                                    fontSize:
                                                                        13),
                                                                SizedBox(
                                                                  width: 2.w,
                                                                ),
                                                                TextUtiles(
                                                                    title:
                                                                        "Consolation",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        12),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 1.w,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2.w),
                                                        border: Border(
                                                          right: BorderSide(
                                                            width: 0.5,
                                                            color: Colors.grey,
                                                          ),
                                                          left: BorderSide(
                                                            width: 0.5,
                                                            color: Colors.grey,
                                                          ),
                                                          bottom: BorderSide(
                                                            width: 0.5,
                                                            color: Colors.grey,
                                                          ),
                                                          top: BorderSide(
                                                            width: 0.5,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3.7.w,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 4.2.w, right: 4.2.w),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                child: ButtonScreen(
                                                  title: 'Photo',
                                                  onTap: () {
                                                    controller.fetchEventImages(homeUserController.hallId_pub);
                                                    print('...typeHall.........\n');
                                                    print(typeHall);
                                                    //typeHall --->  'joys', 'sorrows', 'both'
                                                    typeHall!=null && (typeHall=='joys'||typeHall=='sorrows' )?
                                                    Get.toNamed(
                                                        PhotoJoysOrReleviedScreen.name):

                                                    Get.toNamed(
                                                        BothRe_JoysHallPhotoScreen
                                                            .name);

                                                  },
                                                  colorTextStyle: Colors.black,
                                                  colorContainer:
                                                      Colors.grey.shade300,
                                                  fontSize: 13.4,
                                                  height: 8.7.w,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(7)),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2.4.w,
                                              ),
                                              Expanded(
                                                child: ButtonScreen(
                                                  title: 'Video',
                                                  onTap: () {
                                                    controller.fetchEventVideos(homeUserController.hallId_pub);

                                                    print('...typeHall.........\n');
                                                    print(typeHall);
                                                    //typeHall --->  'joys', 'sorrows', 'both'
                                                    typeHall!=null && (typeHall=='joys'||typeHall=='sorrows' )?
                                                    Get.toNamed(
                                                        VedioJoysOrReleviedScreen.name):

                                                    Get.toNamed(
                                                        BothRe_JoysHallVideoScreen
                                                            .name);
                                                  },
                                                  colorTextStyle: Colors.black,
                                                  colorContainer:
                                                      Colors.grey.shade300,
                                                  fontSize: 13.4,
                                                  height: 9.8.w,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(7)),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2.4.w,
                                              ),
                                              Expanded(
                                                child: ButtonScreen(
                                                  title: 'Service',
                                                  onTap: () {
                                                    print('...typeHall.........\n');
                                                    print(typeHall);
                                                    //typeHall --->  'joys', 'sorrows', 'both'
                                                    typeHall!=null && typeHall=='joys'?
                                                  Get.toNamed(
                                                      JoysHallServicesScreen.name):
                                                    typeHall!=null && typeHall=='both'?
                                                    Get.toNamed(
                                                        BothRe_JoysHallServicesScreen
                                                            .name):
                                                    Get.toNamed(
                                                        RelievedHallServicesScreen
                                                            .name);
                                                  },
                                                  colorTextStyle: Colors.black,
                                                  colorContainer:
                                                      Colors.grey.shade300,
                                                  fontSize: 13.4,
                                                  height: 9.8.w,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(7)),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3.5.w,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3.7.w,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 4.2.w,
                                        right: 4.2.w,
                                        bottom: 0.5.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: ButtonScreen(
                                            title: 'Booking a viewing',
                                            onTap: () {
                                              Get.toNamed(ChatUserScreen.name);
                                            },
                                            colorTextStyle: Colors.white,
                                            colorContainer:
                                                AppColors.zayteGamiq,
                                            fontSize: 14.5,
                                            height: 10.w,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(7)),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2.4.w,
                                        ),
                                        Expanded(
                                          child: ButtonScreen(
                                            title: 'Booking now',
                                            onTap: () {
                                              Get.toNamed(
                                                  BookingUserScreen.name);
                                            },
                                            colorTextStyle: Colors.white,
                                            colorContainer:
                                                AppColors.zayteGamiq,
                                            fontSize: 14.5,
                                            height: 10.w,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(7)),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 5.w, right: 5.w, bottom: 2.w, top: 3.2.w),
                  child: UserNavigBarHallDetails(),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
