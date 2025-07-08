import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import '../../../../../../../core/consts/app_colors.dart';
import '../../../../../../../core/core_components/app_scaffold.dart';
import '../../../../../../../core/core_components/button.dart';
import '../../../../../../../core/core_components/textUtiles.dart';
import '../../../../../booking/presentation/screens/Booking-UserScreen.dart';
import '../../../../../both-joys-And-relievedHall/services-hall/services-both-Jo-Re-hall/presentation/components/dropDownHospitality.dart';
import '../../../../../both-joys-And-relievedHall/services-hall/services-both-Jo-Re-hall/presentation/components/text-and-checkbox.dart';
import '../../../../../both-joys-And-relievedHall/services-hall/services-both-Jo-Re-hall/presentation/controller/services-both-Jo-Re/services-both-Jo-Re-binding.dart';
import '../../../../../both-joys-And-relievedHall/services-hall/services-both-Jo-Re-hall/presentation/controller/services-both-Jo-Re/services-both-Jo-Re-hall-Controller.dart';
import '../components/circular-container.dart';


//نهائي قسم الاتراح
class RelievedHallServicesScreen extends GetView<BothJoysReHallController> {
  static const name = '/RelievedHallServicesScreen';
  static final page = GetPage(
      name: name,
      page: () => RelievedHallServicesScreen(),
      binding: BothJoysReHallBinding());

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<BothJoysReHallController>(() => BothJoysReHallController());
    //  final BothJoysReHallController controller = Get.find();
    var mq = MediaQuery.of(context).size;
    final BothJoysReHallController controller = Get.put(BothJoysReHallController());
    return AppScaffold(
      body:
      Stack(
        //  alignment:AlignmentDirectional.bottomCenter,
        children: [
          Container(
            height: mq.height,
            width: mq.width,
            color: AppColors.zayteFateh,
            child:
            Padding(
              padding: EdgeInsets.only(bottom: 149.w, left: 2.w, right: 12.w),
              child: Container(
                  height: 4.w,
                  width: 4.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {Get.back();},
                        icon: Icon(
                          Icons.arrow_back_ios_new_sharp,
                          color: Colors.black,
                          size: 26,
                        ),
                      ),
                      SizedBox(
                        width: 28.w,
                      ),
                      TextUtiles(
                        title: "Service",
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.w, right: 1.3.w, left: 1.3.w),
            child:
            ListView(
              children: [
                Container(
                  height: mq.height * 20,
                  width: mq.width * 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(9.w),
                        topLeft: Radius.circular(9.w),
                      ),
                      color: AppColors.white),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 3.w, right: 3.w),
                        child: Container(
                          height: mq.height * 0.80,
                          width: mq.width * 0.90,
                          // color: Colors.red,
                          child:
                          ListView(
                            children: [
                              SizedBox(
                                height: 4.w,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 6.w, right: 3.w),
                                child: TextFormField(
                                  controller: controller.Write_occasion_Controller,
                                  decoration: InputDecoration(
                                    hintText: 'What is the occasion?',
                                    filled: true,
                                    fillColor: AppColors.gerysuggest,
                                    hintStyle: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),

                                    contentPadding: EdgeInsets.only(
                                        top: 18.w, left: 4.w, right: 8.w),
                                    enabledBorder: OutlineInputBorder(
                                      // borderRadius: BorderRadius.circular(30.0), // حواف دائرية
                                      borderSide: BorderSide(
                                          color:
                                          Colors.transparent), // لا يظهر الخط
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      // borderRadius: BorderRadius.circular(30.0), // حواف دائرية
                                      borderSide: BorderSide(
                                          color:
                                          Colors.transparent), // لا يظهر الخط
                                    ),
                                    border: OutlineInputBorder(
                                      //  borderRadius: BorderRadius.circular(30.0), // حواف دائرية
                                      borderSide: BorderSide(
                                          color:
                                          Colors.transparent), // لا يظهر الخط
                                    ),
                                  ),
                                ),
                              ),
                              //Reader
                              SizedBox(
                                height:12.w,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircularContainerScreen(
                                      title: 'Reader',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      border: Border.all(
                                          width: 1, color: Colors.black87),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(13.w)),
                                      height: 10.w,
                                      weight: 37.w,
                                      colorTextStyle: (Colors.black87),
                                    ),
                                  ],
                                ),
                              ),
                              Obx(
                                    () => Padding(
                                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      TextAndCheckBoxScreen(
                                        title: "External",
                                        value: controller
                                            .isChecked_Reader_External.value,
                                        fontSize: 14,
                                        onChanged: (value) {
                                          controller.isChecked_Reader_External
                                              .value = value ?? false;
                                        },
                                      ),
                                      TextAndCheckBoxScreen(
                                        title: "lounge reader",
                                        value: controller
                                            .isChecked_Reader_LoungeReader.value,
                                        fontSize: 14,
                                        onChanged: (value) {
                                          controller.isChecked_Reader_LoungeReader
                                              .value = value ?? false;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              //Photography
                              SizedBox(
                                height: 6.5.w,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w, right: 3.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircularContainerScreen(
                                      title: 'Photography',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      border: Border.all(
                                          width: 1, color: Colors.black87),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(13.w)),
                                      height: 10.w,
                                      weight: 38.w,
                                      colorTextStyle: (Colors.black87),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 1.w,
                              ),
                              Obx(
                                    () => Padding(
                                  padding: EdgeInsets.only(left: 9.w, right: 5.w),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      TextAndCheckBoxScreen(
                                        title: "External",
                                        value: controller
                                            .isChecked_PhotographyRelieved_External.value,
                                        fontSize: 14,
                                        onChanged: (value) {
                                          controller.isChecked_PhotographyRelieved_External
                                              .value = value ?? false;
                                        },
                                      ),
                                      TextAndCheckBoxScreen(
                                        title: "Hall photographer",
                                        value: controller
                                            .isChecked_PhotographyRelieved_HallPhotography.value,
                                        fontSize: 14,
                                        onChanged: (value) {
                                          controller.isChecked_PhotographyRelieved_HallPhotography
                                              .value = value ?? false;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              //Hospitality
                              SizedBox(
                                height: 3.8.w,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w, right: 3.w),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircularContainerScreen(
                                      title: 'Hospitality',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      border: Border.all(
                                          width: 1, color: Colors.black87),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(13.w)),
                                      height: 10.w,
                                      weight: 38.w,
                                      colorTextStyle: (Colors.black87),
                                    ),
                                    SizedBox(width: 2.w,),
                                    HospitalityRelivedBothDropdown(),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 9.w,
                              ),

                              // Write your suggest
                              Padding(
                                padding: EdgeInsets.only(left: 4.w, right: 3.w),
                                child: TextFormField(
                                  controller: controller.additional_notes_Controller,
                                  decoration: InputDecoration(
                                    hintText: 'Write what you suggest...',
                                    filled: true,
                                    fillColor: AppColors.gerysuggest,
                                    hintStyle: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                    contentPadding: EdgeInsets.only(
                                        top: 22.w, left: 4.w, right: 8.w),
                                    enabledBorder: OutlineInputBorder(
                                      // borderRadius: BorderRadius.circular(30.0), // حواف دائرية
                                      borderSide: BorderSide(
                                          color:
                                          Colors.transparent), // لا يظهر الخط
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      // borderRadius: BorderRadius.circular(30.0), // حواف دائرية
                                      borderSide: BorderSide(
                                          color:
                                          Colors.transparent), // لا يظهر الخط
                                    ),
                                    border: OutlineInputBorder(
                                      //  borderRadius: BorderRadius.circular(30.0), // حواف دائرية
                                      borderSide: BorderSide(
                                          color:
                                          Colors.transparent), // لا يظهر الخط
                                    ),
                                  ),
                                ),
                              ),

                              //Save
                              SizedBox(
                                height: 13.w,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 4.w, right: 3.w),
                                child: ButtonScreen(
                                  title: 'Save',
                                  onTap: () {
                                    Get.toNamed(BookingUserScreen.name);
                                  },
                                  colorTextStyle: Colors.white,
                                  colorContainer: AppColors.zayteGamiq,
                                  fontSize: 20,
                                  height: 11.4.w,
                                  borderRadius: BorderRadius.all(Radius.zero),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 10.w,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
    // return
    //
    //   Padding(
    //   padding: EdgeInsets.only(top: 34.w, right: 1.3.w, left: 1.3.w),
    //   child: ListView(
    //     children: [
    //       Container(
    //         height: mq.height * 20,
    //         width: mq.width * 45,
    //         decoration: BoxDecoration(
    //             borderRadius: BorderRadius.only(
    //               topRight: Radius.circular(9.w),
    //               topLeft: Radius.circular(9.w),
    //             ),
    //             color: AppColors.white),
    //         child: Column(
    //           children: [
    //             Padding(
    //               padding: EdgeInsets.only(left: 3.w, right: 3.w),
    //               child:
    //               Container(
    //                 height: mq.height * 0.80,
    //                 width: mq.width * 0.90,
    //                 // color: Colors.red,
    //                 child:
    //                 ListView(
    //                   children: [
    //                     Container(
    //                       height: mq.height * 20,
    //                       width: mq.width * 45,
    //                       decoration: BoxDecoration(
    //                           borderRadius: BorderRadius.only(
    //                             topRight: Radius.circular(9.w),
    //                             topLeft: Radius.circular(9.w),
    //                           ),
    //                           color: AppColors.white),
    //                       child: Column(
    //                         children: [
    //                           Padding(
    //                             padding: EdgeInsets.only(left: 3.w, right: 3.w),
    //                             child: Container(
    //                               height: mq.height * 0.80,
    //                               width: mq.width * 0.90,
    //                               // color: Colors.red,
    //                               child:
    //                               ListView(
    //                                 children: [
    //                                   SizedBox(
    //                                     height: 4.w,
    //                                   ),
    //                                   Padding(
    //                                     padding: EdgeInsets.only(left: 6.w, right: 3.w),
    //                                     child: TextFormField(
    //                                       controller: controller.Write_occasion_Controller,
    //                                       decoration: InputDecoration(
    //                                         hintText: 'What is the occasion?',
    //                                         filled: true,
    //                                         fillColor: AppColors.gerysuggest,
    //                                         hintStyle: TextStyle(
    //                                             color: Colors.black87,
    //                                             fontSize: 15,
    //                                             fontWeight: FontWeight.w400),
    //
    //                                         contentPadding: EdgeInsets.only(
    //                                             top: 18.w, left: 4.w, right: 8.w),
    //                                         enabledBorder: OutlineInputBorder(
    //                                           // borderRadius: BorderRadius.circular(30.0), // حواف دائرية
    //                                           borderSide: BorderSide(
    //                                               color:
    //                                               Colors.transparent), // لا يظهر الخط
    //                                         ),
    //                                         focusedBorder: OutlineInputBorder(
    //                                           // borderRadius: BorderRadius.circular(30.0), // حواف دائرية
    //                                           borderSide: BorderSide(
    //                                               color:
    //                                               Colors.transparent), // لا يظهر الخط
    //                                         ),
    //                                         border: OutlineInputBorder(
    //                                           //  borderRadius: BorderRadius.circular(30.0), // حواف دائرية
    //                                           borderSide: BorderSide(
    //                                               color:
    //                                               Colors.transparent), // لا يظهر الخط
    //                                         ),
    //                                       ),
    //                                     ),
    //                                   ),
    //                                   //Reader
    //                                   SizedBox(
    //                                     height:12.w,
    //                                   ),
    //                                   Padding(
    //                                     padding: EdgeInsets.only(left: 2.w),
    //                                     child: Row(
    //                                       mainAxisAlignment: MainAxisAlignment.start,
    //                                       children: [
    //                                         CircularContainerScreen(
    //                                           title: 'Reader',
    //                                           fontSize: 17,
    //                                           fontWeight: FontWeight.w400,
    //                                           border: Border.all(
    //                                               width: 1, color: Colors.black87),
    //                                           borderRadius:
    //                                           BorderRadius.all(Radius.circular(13.w)),
    //                                           height: 10.w,
    //                                           weight: 37.w,
    //                                           colorTextStyle: (Colors.black87),
    //                                         ),
    //                                       ],
    //                                     ),
    //                                   ),
    //                                   Obx(
    //                                         () => Padding(
    //                                       padding: EdgeInsets.only(left: 10.w, right: 10.w),
    //                                       child: Row(
    //                                         mainAxisAlignment:
    //                                         MainAxisAlignment.spaceAround,
    //                                         children: [
    //                                           TextAndCheckBoxScreen(
    //                                             title: "External",
    //                                             value: controller
    //                                                 .isChecked_Reader_External.value,
    //                                             fontSize: 14,
    //                                             onChanged: (value) {
    //                                               controller.isChecked_Reader_External
    //                                                   .value = value ?? false;
    //                                             },
    //                                           ),
    //                                           TextAndCheckBoxScreen(
    //                                             title: "lounge reader",
    //                                             value: controller
    //                                                 .isChecked_Reader_LoungeReader.value,
    //                                             fontSize: 14,
    //                                             onChanged: (value) {
    //                                               controller.isChecked_Reader_LoungeReader
    //                                                   .value = value ?? false;
    //                                             },
    //                                           ),
    //                                         ],
    //                                       ),
    //                                     ),
    //                                   ),
    //
    //                                   //Photography
    //                                   SizedBox(
    //                                     height: 6.5.w,
    //                                   ),
    //                                   Padding(
    //                                     padding: EdgeInsets.only(left: 2.w, right: 3.w),
    //                                     child: Row(
    //                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                                       children: [
    //                                         CircularContainerScreen(
    //                                           title: 'Photography',
    //                                           fontSize: 17,
    //                                           fontWeight: FontWeight.w400,
    //                                           border: Border.all(
    //                                               width: 1, color: Colors.black87),
    //                                           borderRadius:
    //                                           BorderRadius.all(Radius.circular(13.w)),
    //                                           height: 10.w,
    //                                           weight: 38.w,
    //                                           colorTextStyle: (Colors.black87),
    //                                         ),
    //                                       ],
    //                                     ),
    //                                   ),
    //                                   SizedBox(
    //                                     height: 1.w,
    //                                   ),
    //                                   Obx(
    //                                         () => Padding(
    //                                       padding: EdgeInsets.only(left: 9.w, right: 5.w),
    //                                       child: Row(
    //                                         mainAxisAlignment:
    //                                         MainAxisAlignment.spaceAround,
    //                                         children: [
    //                                           TextAndCheckBoxScreen(
    //                                             title: "External",
    //                                             value: controller
    //                                                 .isChecked_PhotographyRelieved_External.value,
    //                                             fontSize: 14,
    //                                             onChanged: (value) {
    //                                               controller.isChecked_PhotographyRelieved_External
    //                                                   .value = value ?? false;
    //                                             },
    //                                           ),
    //                                           TextAndCheckBoxScreen(
    //                                             title: "Hall photographer",
    //                                             value: controller
    //                                                 .isChecked_PhotographyRelieved_HallPhotography.value,
    //                                             fontSize: 14,
    //                                             onChanged: (value) {
    //                                               controller.isChecked_PhotographyRelieved_HallPhotography
    //                                                   .value = value ?? false;
    //                                             },
    //                                           ),
    //                                         ],
    //                                       ),
    //                                     ),
    //                                   ),
    //
    //                                   //Hospitality
    //                                   SizedBox(
    //                                     height: 3.8.w,
    //                                   ),
    //                                   Padding(
    //                                     padding: EdgeInsets.only(left: 2.w, right: 3.w),
    //                                     child: Row(
    //                                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                                       children: [
    //                                         CircularContainerScreen(
    //                                           title: 'Hospitality',
    //                                           fontSize: 17,
    //                                           fontWeight: FontWeight.w400,
    //                                           border: Border.all(
    //                                               width: 1, color: Colors.black87),
    //                                           borderRadius:
    //                                           BorderRadius.all(Radius.circular(13.w)),
    //                                           height: 10.w,
    //                                           weight: 38.w,
    //                                           colorTextStyle: (Colors.black87),
    //                                         ),
    //                                         SizedBox(width: 2.w,),
    //                                         HospitalityRelivedBothDropdown(),
    //                                       ],
    //                                     ),
    //                                   ),
    //                                   SizedBox(
    //                                     height: 9.w,
    //                                   ),
    //
    //                                   // Write your suggest
    //                                   Padding(
    //                                     padding: EdgeInsets.only(left: 4.w, right: 3.w),
    //                                     child: TextFormField(
    //                                       controller: controller.additional_notes_Controller,
    //                                       decoration: InputDecoration(
    //                                         hintText: 'Write what you suggest...',
    //                                         filled: true,
    //                                         fillColor: AppColors.gerysuggest,
    //                                         hintStyle: TextStyle(
    //                                             color: Colors.black87,
    //                                             fontSize: 15,
    //                                             fontWeight: FontWeight.w400),
    //                                         contentPadding: EdgeInsets.only(
    //                                             top: 22.w, left: 4.w, right: 8.w),
    //                                         enabledBorder: OutlineInputBorder(
    //                                           // borderRadius: BorderRadius.circular(30.0), // حواف دائرية
    //                                           borderSide: BorderSide(
    //                                               color:
    //                                               Colors.transparent), // لا يظهر الخط
    //                                         ),
    //                                         focusedBorder: OutlineInputBorder(
    //                                           // borderRadius: BorderRadius.circular(30.0), // حواف دائرية
    //                                           borderSide: BorderSide(
    //                                               color:
    //                                               Colors.transparent), // لا يظهر الخط
    //                                         ),
    //                                         border: OutlineInputBorder(
    //                                           //  borderRadius: BorderRadius.circular(30.0), // حواف دائرية
    //                                           borderSide: BorderSide(
    //                                               color:
    //                                               Colors.transparent), // لا يظهر الخط
    //                                         ),
    //                                       ),
    //                                     ),
    //                                   ),
    //
    //                                   //Save
    //                                   SizedBox(
    //                                     height: 13.w,
    //                                   ),
    //                                   Padding(
    //                                     padding: EdgeInsets.only(left: 4.w, right: 3.w),
    //                                     child: ButtonScreen(
    //                                       title: 'Save',
    //                                       onTap: () {
    //                                         Get.toNamed(BookingUserScreen.name);
    //                                       },
    //                                       colorTextStyle: Colors.white,
    //                                       colorContainer: AppColors.zayteGamiq,
    //                                       fontSize: 20,
    //                                       height: 11.4.w,
    //                                       borderRadius: BorderRadius.all(Radius.zero),
    //                                       fontWeight: FontWeight.w500,
    //                                     ),
    //                                   ),
    //                                   SizedBox(
    //                                     height: 1.w,
    //                                   ),
    //                                 ],
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );

  }
}



