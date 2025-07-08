import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/consts/api_const.dart';
import 'package:hall_gradition/core/consts/app_colors.dart';
import 'package:hall_gradition/core/core_components/textUtiles.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import 'package:intl/intl.dart';
import '../controller/fetch-user-booking-binding.dart';
import '../controller/fetch-userBooking-controller.dart';
import 'fetch-details-userBooking-hall-Screen.dart';

class UserBookingHallListPage extends StatelessWidget {
  static const name = '/UserBookingHallListPage';
  static final page = GetPage(
      name: name, page: () => UserBookingHallListPage(), binding: FetchBookingUserHallBinding());
  @override
  Widget build(BuildContext context) {
    final FetchBookingUserHallController controller = Get.put(FetchBookingUserHallController());

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('My Bookings'),
      //   backgroundColor: Colors.blueAccent,
      // ),
      body: Column(
        children: [
          Container(
            height: 21.w,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(3.w),
                  bottomLeft: Radius.circular(3.w)),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 6.w, left: 2.w),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      )),
                  SizedBox(
                    width: 14.w,
                  ),
                  TextUtiles(
                    title: 'My Bookings',
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    colorTextStyle: AppColors.white,
                  ),
                ],
              ),
            ),
          ),
          Obx(() {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else if (controller.errorMessage.isNotEmpty) {
              return Center(child: Text('Error: ${controller.errorMessage}'));
            } else if (controller.bookings.isEmpty) {
              return Center(
                  child: Padding(
                padding: EdgeInsets.only(top: 70.w),
                child: TextUtiles(
                  title: 'No bookings available.',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ));
            } else {
              return Container(
                height: 156.w,
                child: ListView.builder(
                  itemCount: controller.bookings.length,
                  itemBuilder: (context, index) {
                    final booking = controller.bookings[index];
                    return InkWell(
                      onTap: () {
                        controller.Pub_Id_Booking_request = booking.id;
                        print("controller.Pub_Id_Booking_request...");
                        print(controller.Pub_Id_Booking_request);
                        Get.to(() => FetchDetailsUserBookingHallScreen(booking: booking));
                      },
                      child: Card(
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 2.w),
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(3.w),
                          child: Row(
                            children: [
                              booking.hall?.hallImage != null
                                  ? ClipOval(
                                      child: Image.network(
                                        ApiConst.urlImage +
                                            booking.hall!.hallImage,
                                        width: 13.w,
                                        height: 13.w,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : Container(
                                      width: 7.w,
                                      height: 7.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey[300],
                                      ),
                                      child: Icon(
                                        Icons.image_not_supported,
                                        color: Colors.grey,
                                      ),
                                    ),
                              SizedBox(width: 7.w),

                              // ✅ النصوص داخل Expanded
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextUtiles(
                                      title:
                                          booking.hall?.name ?? "Unknown Hall",
                                      // style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      colorTextStyle: AppColors.zayteGamiq,
                                      // ),
                                      //  overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 1.w),
                                    Row(
                                      children: [
                                        Icon(Icons.calendar_today,
                                            size: 16, color: Colors.blueGrey),
                                        SizedBox(width: 2.w),
                                        Text(
                                          DateFormat('yyyy-MM-dd').format(
                                              DateTime.parse(
                                                  booking.eventDate)),
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
