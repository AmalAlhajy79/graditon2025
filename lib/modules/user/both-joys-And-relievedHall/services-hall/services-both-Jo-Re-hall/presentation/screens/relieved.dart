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
import '../components/dropDownHospitality.dart';
import '../components/family-song-table.dart';
import '../components/text-and-checkbox.dart';
import '../controller/services-both-Jo-Re/services-both-Jo-Re-binding.dart';
import '../controller/services-both-Jo-Re/services-both-Jo-Re-hall-Controller.dart';

class BothReHallServicesScreen extends StatelessWidget {
  static const name = '/BothReHallServicesScreen';
  static final page = GetPage(
      name: name,
      page: () => BothReHallServicesScreen(),
      binding: BothJoysReHallBinding());

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    final BothJoysReHallController controller = Get.find();

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

                          //Reader
                          SizedBox(
                            height: 15.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircularContainerScreen(
                                  title: 'Reader',
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
                                        .isChecked_Hospitality_TheHall.value,
                                    fontSize: 14,
                                    onChanged: (value) {
                                      controller.isChecked_Hospitality_TheHall
                                          .value = value ?? false;
                                    },
                                  ),
                                  TextAndCheckBoxScreen(
                                    title: "lounge reader",
                                    value: controller
                                        .isChecked_Hospitality_External.value,
                                    fontSize: 14,
                                    onChanged: (value) {
                                      controller.isChecked_Hospitality_External
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
                                        .isChecked_Hospitality_TheHall.value,
                                    fontSize: 14,
                                    onChanged: (value) {
                                      controller.isChecked_Hospitality_TheHall
                                          .value = value ?? false;
                                    },
                                  ),
                                  TextAndCheckBoxScreen(
                                    title: "Hall photographer",
                                    value: controller
                                        .isChecked_Hospitality_External.value,
                                    fontSize: 14,
                                    onChanged: (value) {
                                      controller.isChecked_Hospitality_External
                                          .value = value ?? false;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),

                          //Hospitality
                          SizedBox(
                            height: 3.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2.w, right: 3.w),
                            child: Row(
                             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                SizedBox(width: 2.w,),
                                InkWell(
                                  onTap: () {
                                    HospitalityDropdown();
                                  },
                                  child: Container(
                                    height: 8.w,
                                    width: 7.w,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border(
                                          left: BorderSide(width: 1.8),
                                          right: BorderSide(width: 1.8),
                                          top: BorderSide(width: 1.8),
                                          bottom: BorderSide(width: 1.8),
                                        )),
                                    child: Icon(
                                      Icons.arrow_drop_down_outlined,
                                      size: 6.w,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.w,
                          ),

                          // Write your suggest
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
