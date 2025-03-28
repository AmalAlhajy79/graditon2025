import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import '../../../../../../../core/consts/app_colors.dart';
import '../../../../../../../core/core_components/TextFormFeild.dart';
import '../../../../../../../core/core_components/app_scaffold.dart';
import '../../../../../../../core/core_components/button.dart';
import '../../../../../../../core/core_components/containerScreen.dart';
import '../../../../../../../core/core_components/textUtiles.dart';
import '../components/circular-container.dart';
import '../components/family-song-table.dart';
import '../components/text-and-checkbox.dart';
import '../controller/joys-hall-services/joys-hall-services-Controller.dart';
import '../controller/joys-hall-services/joys-hall-services-binding.dart';

class JoysHallServicesScreen extends StatelessWidget {
  static const name = '/joysHallServicesScreen';
  static final page = GetPage(
      name: name,
      page: () => JoysHallServicesScreen(),
      binding: JoysHallServicesBinding());

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    final JoysHallServicesController controller = Get.find();

    return AppScaffold(
      body: Stack(
        //  alignment:AlignmentDirectional.bottomCenter,
        children: [
          Container(
            height: mq.height,
            width: mq.width,
            color: AppColors.zayteFateh,
            child: Padding(
              padding: EdgeInsets.only(bottom: 149.w, left: 2.w, right: 12.w),
              child: Container(
                  height: 4.w,
                  width: 4.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {},
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
            child: Container(
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
                      height: mq.height * 0.83,
                      width: mq.width * 0.90,
                      // color: Colors.red,
                      child: ListView(
                        children: [
                          //what  occasion?
                          SizedBox(
                            height: 3.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 6.w, right: 3.w),
                            child: TextFormField(
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

                          //open buffer
                          SizedBox(
                            height: 6.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircularContainerScreen(
                                  title: 'Open buffer',
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.w500,
                                  border: Border.all(
                                      width: 1, color: Colors.black87),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13.w)),
                                  height: 10.w,
                                  weight: 42.w,
                                  colorTextStyle: (Colors.black87),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Obx(() => TextAndCheckBoxScreen(
                                      title: "I want",
                                      value: controller
                                          .isChecked_OpenBuffer_IWant.value,
                                      onChanged: (value) {
                                        controller.isChecked_OpenBuffer_IWant
                                            .value = value ?? false;
                                      },
                                    ))
                              ],
                            ),
                          ),
                          Obx(
                            () => controller.isChecked_OpenBuffer_IWant.value
                                ? Padding(
                                    padding: EdgeInsets.only(
                                        left: 6.w, right: 3.w, top: 3.w),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        hintText: 'Write what you suggest...',
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
                                              color: Colors
                                                  .transparent), // لا يظهر الخط
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          // borderRadius: BorderRadius.circular(30.0), // حواف دائرية
                                          borderSide: BorderSide(
                                              color: Colors
                                                  .transparent), // لا يظهر الخط
                                        ),
                                        border: OutlineInputBorder(
                                          //  borderRadius: BorderRadius.circular(30.0), // حواف دائرية
                                          borderSide: BorderSide(
                                              color: Colors
                                                  .transparent), // لا يظهر الخط
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox
                                    .shrink(), // لا تظهر شيء في حالة عدم التفعيل
                          ),

                          //Hospitality
                          SizedBox(
                            height: 6.5.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2.w, right: 3.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircularContainerScreen(
                                  title: 'Hospitality',
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.w500,
                                  border: Border.all(
                                      width: 1, color: Colors.black87),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13.w)),
                                  height: 10.w,
                                  weight: 42.w,
                                  colorTextStyle: (Colors.black87),
                                ),
                                ButtonScreen(
                                  title: 'View',
                                  onTap: () {},
                                  colorTextStyle: Colors.white,
                                  colorContainer: AppColors.zayteGamiq,
                                  fontSize: 11.4,
                                  height: 6.w,
                                  weight: 14.4.w,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1.w,
                          ),
                          Obx(
                            () => Padding(
                              padding: EdgeInsets.only(left: 10.w, right: 10.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextAndCheckBoxScreen(
                                    title: "The hall",
                                    value: controller
                                        .isChecked_Hospitality_TheHall.value,
                                    fontSize: 15.6,
                                    onChanged: (value) {
                                      controller.isChecked_Hospitality_TheHall
                                          .value = value ?? false;
                                    },
                                  ),
                                  TextAndCheckBoxScreen(
                                    title: "External",
                                    value: controller
                                        .isChecked_Hospitality_External.value,
                                    fontSize: 15.6,
                                    onChanged: (value) {
                                      controller.isChecked_Hospitality_External
                                          .value = value ?? false;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),

                          //Arada band
                          SizedBox(
                            height: 3.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2.w, right: 3.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircularContainerScreen(
                                  title: 'Arada band',
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.w500,
                                  border: Border.all(
                                      width: 1, color: Colors.black87),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13.w)),
                                  height: 10.w,
                                  weight: 42.w,
                                  colorTextStyle: (Colors.black87),
                                ),
                                ButtonScreen(
                                  title: 'View',
                                  onTap: () {},
                                  colorTextStyle: Colors.white,
                                  colorContainer:AppColors.zayteGamiq,
                                  fontSize: 11.4,
                                  height: 6.w,
                                  weight: 14.4.w,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1.w,
                          ),
                          Obx(
                            () => Padding(
                              padding: EdgeInsets.only(left: 10.w, right: 10.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextAndCheckBoxScreen(
                                    title: "The hall",
                                    value: controller
                                        .isChecked_AradaBand_TheHall.value,
                                    fontSize: 15.6,
                                    onChanged: (value) {
                                      controller.isChecked_AradaBand_TheHall
                                          .value = value ?? false;
                                    },
                                  ),
                                  TextAndCheckBoxScreen(
                                    title: "External",
                                    value: controller
                                        .isChecked_AradaBand_External.value,
                                    fontSize: 15.6,
                                    onChanged: (value) {
                                      controller.isChecked_AradaBand_External
                                          .value = value ?? false;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),

                          //the car
                          SizedBox(
                            height: 3.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2.w, right: 3.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircularContainerScreen(
                                  title: 'The car',
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.w500,
                                  border: Border.all(
                                      width: 1, color: Colors.black87),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13.w)),
                                  height: 10.w,
                                  weight: 42.w,
                                  colorTextStyle: (Colors.black87),
                                ),
                                ButtonScreen(
                                  title: 'View',
                                  onTap: () {},
                                  colorTextStyle: Colors.white,
                                  colorContainer: AppColors.zayteGamiq,
                                  fontSize: 11.4,
                                  height: 6.w,
                                  weight: 14.4.w,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1.w,
                          ),
                          Obx(
                            () => Padding(
                              padding: EdgeInsets.only(left: 10.w, right: 10.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextAndCheckBoxScreen(
                                    title: "The hall",
                                    value: controller
                                        .isChecked_TheCar_TheHall.value,
                                    fontSize: 15.6,
                                    onChanged: (value) {
                                      controller.isChecked_TheCar_TheHall
                                          .value = value ?? false;
                                    },
                                  ),
                                  TextAndCheckBoxScreen(
                                    title: "External",
                                    value: controller
                                        .isChecked_TheCar_External.value,
                                    fontSize: 15.6,
                                    onChanged: (value) {
                                      controller.isChecked_TheCar_External
                                          .value = value ?? false;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Songs
                          SizedBox(
                            height: 3.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2.w, right: 3.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircularContainerScreen(
                                  title: 'Songs',
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.w500,
                                  border: Border.all(
                                      width: 1, color: Colors.black87),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13.w)),
                                  height: 10.w,
                                  weight: 42.w,
                                  colorTextStyle: (Colors.black87),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 4.w,
                          ),
                          FamilySongTable(),

                          //change decor
                          SizedBox(
                            height: 3.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2.w, right: 3.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircularContainerScreen(
                                  title: 'Change dacor',
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.w500,
                                  border: Border.all(
                                      width: 1, color: Colors.black87),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13.w)),
                                  height: 10.w,
                                  weight: 42.w,
                                  colorTextStyle: (Colors.black87),
                                ),
                                ButtonScreen(
                                  title: 'View',
                                  onTap: () {},
                                  colorTextStyle: Colors.white,
                                  colorContainer: AppColors.zayteGamiq,
                                  fontSize: 11.4,
                                  height: 6.w,
                                  weight: 14.4.w,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1.w,
                          ),
                          Obx(
                            () => Padding(
                              padding: EdgeInsets.only(left: 7.w, right: 7.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextAndCheckBoxScreen(
                                    title: "I want",
                                    value: controller
                                        .isChecked_ChangeDacor_IWant.value,
                                    onChanged: (value) {
                                      controller.isChecked_ChangeDacor_IWant
                                          .value = value ?? false;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),

                          //Photography
                          SizedBox(
                            height: 3.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2.w, right: 3.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircularContainerScreen(
                                  title: 'Photography',
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.w500,
                                  border: Border.all(
                                      width: 1, color: Colors.black87),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13.w)),
                                  height: 10.w,
                                  weight: 42.w,
                                  colorTextStyle: (Colors.black87),
                                ),
                                ButtonScreen(
                                  title: 'suggestion',
                                  onTap: () {},
                                  colorTextStyle: Colors.white,
                                  colorContainer: AppColors.zayteGamiq,
                                  fontSize: 11.4,
                                  height: 6.w,
                                  weight: 19.4.w,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1.w,
                          ),
                          Obx(
                            () => Padding(
                              padding: EdgeInsets.only(left: 10.w, right: 10.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextAndCheckBoxScreen(
                                    title: "The hall",
                                    value: controller
                                        .isChecked_Photography_TheHall.value,
                                    fontSize: 15.6,
                                    onChanged: (value) {
                                      controller.isChecked_Photography_TheHall
                                          .value = value ?? false;
                                    },
                                  ),
                                  TextAndCheckBoxScreen(
                                    title: "External",
                                    value: controller
                                        .isChecked_Photography_External.value,
                                    fontSize: 15.6,
                                    onChanged: (value) {
                                      controller.isChecked_Photography_External
                                          .value = value ?? false;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),

                          //Protection for photography
                          SizedBox(
                            height: 3.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2.w, right: 3.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircularContainerScreen(
                                  title: 'Protection for photography',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  border: Border.all(
                                      width: 1, color: Colors.black87),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13.w)),
                                  height: 10.w,
                                  weight: 66.w,
                                  colorTextStyle: (Colors.black87),
                                ),
                                ButtonScreen(
                                  title: 'View',
                                  onTap: () {},
                                  colorTextStyle: Colors.white,
                                  colorContainer:AppColors.zayteGamiq,
                                  fontSize: 11.4,
                                  height: 6.w,
                                  weight: 14.4.w,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1.w,
                          ),
                          Obx(
                            () => Padding(
                              padding: EdgeInsets.only(left: 7.w, right: 7.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextAndCheckBoxScreen(
                                    title: "I want",
                                    value: controller
                                        .isChecked_ProtectionForPhotography_IWant
                                        .value,
                                    onChanged: (value) {
                                      controller
                                          .isChecked_ProtectionForPhotography_IWant
                                          .value = value ?? false;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),

                          //Promo
                          SizedBox(
                            height: 3.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2.w, right: 3.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircularContainerScreen(
                                  title: 'Promo',
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.w500,
                                  border: Border.all(
                                      width: 1, color: Colors.black87),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13.w)),
                                  height: 10.w,
                                  weight: 42.w,
                                  colorTextStyle: (Colors.black87),
                                ),
                                ButtonScreen(
                                  title: 'View',
                                  onTap: () {},
                                  colorTextStyle: Colors.white,
                                  colorContainer:  AppColors.zayteGamiq,
                                  fontSize: 11.4,
                                  height: 6.w,
                                  weight: 14.4.w,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1.w,
                          ),
                          Obx(
                            () => Padding(
                              padding: EdgeInsets.only(left: 7.w, right: 7.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextAndCheckBoxScreen(
                                    title: "I want",
                                    value:
                                        controller.isChecked_Promo_IWant.value,
                                    onChanged: (value) {
                                      controller.isChecked_Promo_IWant.value =
                                          value ?? false;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Write your suggest
                          SizedBox(
                            height: 4.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4.w, right: 3.w),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Write what you suggest...',
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

                          //Save
                          SizedBox(
                            height: 14.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4.w, right: 3.w),
                            child: ButtonScreen(
                              title: 'Save',
                              onTap: () {},
                              colorTextStyle: Colors.white,
                              colorContainer: AppColors.zayteGamiq,
                              fontSize: 20,
                              height: 11.4.w,
                              borderRadius: BorderRadius.all(Radius.zero),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 1.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
