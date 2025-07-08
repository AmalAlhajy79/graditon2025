import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import 'package:hall_gradition/modules/user/both-joys-And-relievedHall/services-hall/services-both-Jo-Re-hall/presentation/screens/cars-service-hall.dart';
import 'package:hall_gradition/modules/user/both-joys-And-relievedHall/services-hall/services-both-Jo-Re-hall/presentation/screens/promoVideo-service.dart';
import 'package:hall_gradition/modules/user/both-joys-And-relievedHall/services-hall/services-both-Jo-Re-hall/presentation/screens/protiction-photography-screen.dart';
import '../../../../../../../core/consts/app_colors.dart';
import '../../../../../../../core/core_components/TextFormFeild.dart';
import '../../../../../../../core/core_components/app_scaffold.dart';
import '../../../../../../../core/core_components/button.dart';
import '../../../../../../../core/core_components/containerScreen.dart';
import '../../../../../../../core/core_components/textUtiles.dart';
import '../../../../../booking/presentation/screens/Booking-UserScreen.dart';
import '../components/circular-container.dart';
import '../components/family-song-table.dart';
import '../components/text-and-checkbox.dart';
import '../controller/services-both-Jo-Re/services-both-Jo-Re-binding.dart';
import '../controller/services-both-Jo-Re/services-both-Jo-Re-hall-Controller.dart';
import 'decor-joys-service.dart';
import 'hospitality-service.dart';
import 'joys-Arada-screen.dart';


//نهائي قسم الافراح
class BothJoysServicesScreen extends GetView<BothJoysReHallController> {
  static const name = '/BothJoysServicesScreen';
  static final page = GetPage(
      name: name,
      page: () => BothJoysServicesScreen(),
      binding: BothJoysReHallBinding());

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<BothJoysReHallController>(() => BothJoysReHallController());
    //  final BothJoysReHallController controller = Get.find();
    var mq = MediaQuery.of(context).size;
       final BothJoysReHallController controller = Get.put(BothJoysReHallController());

    return Padding(
      padding: EdgeInsets.only(top: 34.w, right: 1.3.w, left: 1.3.w),
      child: ListView(
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
                        //what  occasion?
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
                                fontSize: 16,
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
                              controller: controller.Write_buffetSuggestion_Controller,
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
                              ButtonScreen(
                                title: 'View',
                                onTap: () {
                                  Get.toNamed(HospitalityServicesScreen.name);
                                },
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
                                  fontSize: 15,
                                  onChanged: (value) {
                                    controller.isChecked_Hospitality_TheHall
                                        .value = value ?? false;
                                  },
                                ),
                                TextAndCheckBoxScreen(
                                  title: "External",
                                  value: controller
                                      .isChecked_Hospitality_External.value,
                                  fontSize: 15,
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
                              ButtonScreen(
                                title: 'View',
                                onTap: () {Get.toNamed(JoysAradaServicesScreen.name);},
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
                                  fontSize: 15,
                                  onChanged: (value) {
                                    controller.isChecked_AradaBand_TheHall
                                        .value = value ?? false;
                                  },
                                ),
                                TextAndCheckBoxScreen(
                                  title: "External",
                                  value: controller
                                      .isChecked_AradaBand_External.value,
                                  fontSize: 15,
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
                              ButtonScreen(
                                title: 'View',
                                onTap: () {Get.toNamed(CarServicesScreen.name);},
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
                                  fontSize: 15,
                                  onChanged: (value) {
                                    controller.isChecked_TheCar_TheHall
                                        .value = value ?? false;
                                  },
                                ),
                                TextAndCheckBoxScreen(
                                  title: "External",
                                  value: controller
                                      .isChecked_TheCar_External.value,
                                  fontSize: 15,
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
                              ButtonScreen(
                                title: 'View',
                                onTap: () {Get.toNamed(DecorJoysServicesScreen.name);},
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
                          height: 0.1.w,
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
                              ButtonScreen(
                                title: 'suggestion',
                                onTap: () {

                                },
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
                                  fontSize: 15,
                                  onChanged: (value) {
                                    controller.isChecked_Photography_TheHall
                                        .value = value ?? false;
                                  },
                                ),
                                TextAndCheckBoxScreen(
                                  title: "External",
                                  value: controller
                                      .isChecked_Photography_External.value,
                                  fontSize: 15,
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
                                fontSize: 16.5,
                                fontWeight: FontWeight.w400,
                                border: Border.all(
                                    width: 1, color: Colors.black87),
                                borderRadius:
                                BorderRadius.all(Radius.circular(13.w)),
                                height: 10.w,
                                weight: 64.w,
                                colorTextStyle: (Colors.black87),
                              ),
                              ButtonScreen(
                                title: 'View',
                                onTap: () {Get.toNamed(ProtectionPhotogServicesScreen.name);},
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
                          height: 0.1.w,
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
                              ButtonScreen(
                                title: 'View',
                                onTap: () {Get.toNamed(PromoVideoServicesScreen.name);},
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
                          height: 0.1.w,
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
    );
  }
}

