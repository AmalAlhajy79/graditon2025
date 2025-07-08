import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:hall_gradition/core/consts/app_colors.dart';
import 'package:hall_gradition/core/core_components/app_scaffold.dart';
import 'package:hall_gradition/core/core_components/button.dart';
import 'package:hall_gradition/core/core_components/textUtiles.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';

import '../../../request-to-booking-car/presentation/screens/user-request-to-booking-car.dart';
import '../component/office-card-details.dart';
import '../controller/car-office-binding.dart';

class UserCarOfficeDetailsScreen extends StatelessWidget {
  UserCarOfficeDetailsScreen({Key? key}) : super(key: key);
  static const name = '/UserCarOfficeDetailsScreen';
  static final page = GetPage(
      name: name,
      page: () => UserCarOfficeDetailsScreen(),
      binding: UserCarOfficeDetailsBinding());

  // RejesterUserControllerrr rejesterUserControllerrr=Get.put(RejesterUserControllerrr());

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return AppScaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5.w, left: 4.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_sharp,
                      color: Colors.black,
                      size: 26,
                    ),
                  ),
                  SizedBox(
                    width:21.w,
                  ),
                  TextUtiles(
                    title: "Office name",
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 7.w, top: 4.w, bottom: 2.w, right: 1.w),
              child: Row(
                children: [
                  Container(
                    height: 18.w,
                    width: 84.w,
                    decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(60),
                      borderRadius: BorderRadius.all(Radius.circular(1.w)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 2.w),
                        Padding(
                          padding: EdgeInsets.only(left: 2.w),
                          child: Row(
                            children: [
                              SizedBox(width: 2.w),
                              Icon(
                                Icons.phone_outlined,
                                color: Colors.black45,
                              ),
                              SizedBox(width: 3.w),
                              TextUtiles(
                                title: "0987676543",
                                colorTextStyle: Colors.black45,
                                fontSize: 16,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.w,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 2.w),
                          child: Row(
                            children: [
                              SizedBox(width: 2.w),
                              Icon(
                                Icons.place_outlined,
                                color: Colors.black45,
                              ),
                              SizedBox(width: 3.w),
                              TextUtiles(
                                title: "Damascus,maza",
                                colorTextStyle: Colors.black45,
                                fontSize: 16,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 3.w,),
            Padding(
              padding:  EdgeInsets.only(left: 8.w),
              child: Row(
                children: [
                  TextUtiles(title: 'All Cars :',fontSize: 17),
                ],
              ),
            ),
            SizedBox(height: 1.w,),
            // SizedBox(
            //   height: 0.1.w,
            // ),
            Expanded(child: OfficeCardDetails()),
            SizedBox(
              height: 1.w,
            ),
            Padding(
              padding:  EdgeInsets.only(top: 1.w,right: 2.w),
              child: ButtonScreen(
                title: 'Booking',
                onTap: () {
                  Get.toNamed(BookingCarUserPage.name);
                },
                //colorContainer: AppColors.zayteGamiq,
                weight: 85.w,
                fontSize: 17,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.zero,
                  color:  AppColors.zayteGamiq,
                ),
              ),
            ),
            SizedBox(
              height: 5.w,
            ),
          ],
        ),
      ),
    );
  }
}
