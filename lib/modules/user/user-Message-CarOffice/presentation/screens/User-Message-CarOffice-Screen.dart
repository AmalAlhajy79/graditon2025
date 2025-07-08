import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/consts/app_colors.dart';
import 'package:hall_gradition/core/core_components/textUtiles.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';

import '../../../booking/presentation/controller/booking-binding.dart';
import '../../../view-car-office/presentation/component/UserCarOfficeNavigationBar.dart';

class UserMessageCarOfficeScreen extends StatelessWidget {
  static const name = '/UserMessageCarOfficeScreen';
  static final page = GetPage(
      name: name, page: () => UserMessageCarOfficeScreen(), binding: BookingUserBinding());
  @override
  Widget build(BuildContext context) {
   // final BookingController controller = Get.put(BookingController());

    return Scaffold(

      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.w, left: 3.w),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black87,
                    )),
                SizedBox(
                  width: 25.w,
                ),
                TextUtiles(
                  title: 'Message',
                  fontWeight: FontWeight.w500,
                  fontSize: 19,
                  colorTextStyle: AppColors.black,
                ),
              ],
            ),
          ),
          // Obx(() {
          //   if (controller.isLoading.value) {
          //     return Center(child: CircularProgressIndicator());
          //   } else if (controller.errorMessage.isNotEmpty) {
          //     return Center(child: Text('Error: ${controller.errorMessage}'));
          //   } else if (controller.bookings.isEmpty) {
          //     return Center(
          //         child: Padding(
          //       padding: EdgeInsets.only(top: 70.w),
          //       child: TextUtiles(
          //         title: 'No bookings available.',
          //         fontSize: 16,
          //         fontWeight: FontWeight.w400,
          //       ),
          //     ));
          //   } else {
          //     return

                Container(
                height: 130.w,
                padding: EdgeInsets.only(left: 3.w,right: 3.w),
                child: ListView.builder(
                  itemCount: 10,//controller.bookings.length,
                  itemBuilder: (context, index) {
                   // final booking = controller.bookings[index];
                    return InkWell(
                      onTap: () {
                        // controller.Pub_Id_Booking_request = booking.id;
                        // print("controller.Pub_Id_Booking_request...");
                        // print(controller.Pub_Id_Booking_request);
                        // Get.to(() => BookingDetailsPage(booking: booking));
                      },
                      child: Card(
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 2.w),
                        elevation: 6,
                        shadowColor: Colors.white,
                        // shape: RoundedRectangleBorder(
                        //   // borderRadius: BorderRadius.circular(20),
                        // ),
                        child: Padding(
                          padding: EdgeInsets.all(3.w),
                          child: Row(
                            children: [
                              // booking.hall?.hallImage != null
                              //     ? ClipOval(
                              //         child: Image.network(
                              //           ApiConst.urlImage +
                              //               booking.hall!.hallImage,
                              //           width: 13.w,
                              //           height: 13.w,
                              //           fit: BoxFit.cover,
                              //         ),
                              //       )
                              //     :
                              Container(
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextUtiles(
                                    title:'Office name',
                                        //booking.hall?.name ?? "Unknown Hall",
                                    // style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    colorTextStyle: AppColors.zayteGamiq,
                                    // ),
                                    //  overflow: TextOverflow.ellipsis,
                                  ),

                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
          //     ;
          //   }
          // }),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 2.w, right: 2.w, bottom: 4.w),
        child: UserCarOfficeNavigationBar(),
      ),
    );
  }
}

// class BookingDetailsPage extends StatelessWidget {
//   final UserMyBookingModel booking;
//
//   BookingDetailsPage({Key? key, required this.booking}) : super(key: key);
//   BookingController bookingController = Get.put(BookingController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text('Booking Details'),
//       //   backgroundColor: Colors.blueAccent,
//       // ),
//       body: Column(
//         children: [
//           Container(
//             height: 21.w,
//             decoration: BoxDecoration(
//               color: AppColors.zayteGamiq.withOpacity(0.6), //Colors.blueGrey,
//               borderRadius: BorderRadius.only(
//                   bottomRight: Radius.circular(5.w),
//                   bottomLeft: Radius.circular(5.w)),
//             ),
//             child: Padding(
//               padding: EdgeInsets.only(top: 6.w, left: 2.w),
//               child: Row(
//                 children: [
//                   IconButton(
//                       onPressed: () {
//                         Get.back();
//                       },
//                       icon: Icon(
//                         Icons.arrow_back_ios_new,
//                         color: Colors.white,
//                       )),
//                   SizedBox(
//                     width: 14.w,
//                   ),
//                   TextUtiles(
//                     title: 'Booking Details',
//                     fontWeight: FontWeight.w400,
//                     fontSize: 18,
//                     colorTextStyle: AppColors.white,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // Padding(
//           //   padding: EdgeInsets.only(top:6.w, left: 3.w, right: 3.w),
//           //   child: Container(
//           //     height: 120.w,
//           //     decoration: BoxDecoration(
//           //       //color: Colors.blueGrey,
//           //       border: Border(
//           //           bottom: BorderSide(color: AppColors.zayteGamiq, width: 1),
//           //           top: BorderSide(color: AppColors.zayteGamiq, width: 1),
//           //       left: BorderSide(color: AppColors.zayteGamiq,width: 1),
//           //       right: BorderSide(color: AppColors.zayteGamiq,width: 1)),
//           //       borderRadius: BorderRadius.only(
//           //         bottomRight: Radius.circular(3.w),
//           //         bottomLeft: Radius.circular(3.w),
//           //         topLeft: Radius.circular(3.w),
//           //         topRight: Radius.circular(3.w),
//           //       ),
//           //     ),
//           //     child:
//               Padding(
//                 padding: EdgeInsets.only(bottom: 2.w,top: 5.w,left: 2.w,right: 2.w),
//                 child: Container(
//                   height: 128.w,
//                   decoration: BoxDecoration(
//                     //color: Colors.blueGrey,
//                     border: Border(
//                         //bottom: BorderSide(color: AppColors.zayteGamiq, width: 1),
//                         // top: BorderSide(color: AppColors.zayteGamiq, width: 1),
//                         left: BorderSide(color: AppColors.zayteGamiq,width: 1),
//                         right: BorderSide(color: AppColors.zayteGamiq,width: 1)
//                     ),
//                     borderRadius: BorderRadius.only(
//                       bottomRight: Radius.circular(3.w),
//                       bottomLeft: Radius.circular(3.w),
//                       topLeft: Radius.circular(3.w),
//                       topRight: Radius.circular(3.w),
//                     ),
//                   ),
//                   child: ListView(
//                     children: [
//                       Card(
//                        // elevation: 2,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(4.w),
//                             side: BorderSide(
//                                 color: AppColors.zayteFateh, width: 0.1)
//                         ),
//                         color: Colors.white, //AppColors.color6,
//                         child: Padding(
//                           padding:  EdgeInsets.all(16.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               SizedBox(height: 5),
//                               Row(
//                                 children: [
//                                   TextUtiles(
//                                     title: 'hall name :',
//                                     colorTextStyle: Colors.black,
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 19,
//                                   ),
//                                   TextUtiles(
//                                     title:
//                                         '  ${booking.hall?.name ?? "Not Available"}',
//                                     colorTextStyle: AppColors.zayteGamiq,
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 17,
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 5),
//                               Row(
//                                 children: [
//                                   TextUtiles(
//                                     title: 'event type : ',
//                                     colorTextStyle: AppColors.black,
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 15,
//                                   ),
//                                   TextUtiles(
//                                     title: ' ${booking.eventType}',
//                                     colorTextStyle: AppColors.zayteGamiq,
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 15,
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 5),
//                               Divider(
//                                   thickness: 1.5, color: AppColors.zayteGamiq),
//                               SizedBox(height: 14),
//                               Row(
//                                 children: [
//                                   TextUtiles(
//                                     title: 'Date : ',
//                                     colorTextStyle: AppColors.black,
//                                     fontWeight: FontWeight.w700,
//                                     fontSize: 17,
//                                   ),
//                                   TextUtiles(
//                                     title:
//                                         ' ${DateFormat('yyyy-MM-dd').format(DateTime.parse(booking.eventDate))}',
//                                     colorTextStyle: AppColors.zayteGamiq,
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 16,
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   TextUtiles(
//                                     title: 'From : ',
//                                     colorTextStyle: AppColors.black,
//                                     fontWeight: FontWeight.w700,
//                                     fontSize: 17,
//                                   ),
//                                   TextUtiles(
//                                     title: '  ${booking.from} ',
//                                     colorTextStyle: AppColors.zayteGamiq,
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 16,
//                                   ),
//                                   TextUtiles(
//                                     title: '   to : ',
//                                     colorTextStyle: AppColors.black,
//                                     fontWeight: FontWeight.w700,
//                                     fontSize: 17,
//                                   ),
//                                   TextUtiles(
//                                     title: ' ${booking.to}',
//                                     colorTextStyle: AppColors.zayteGamiq,
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 16,
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   TextUtiles(
//                                     title: 'Guests : ',
//                                     colorTextStyle: AppColors.black,
//                                     fontWeight: FontWeight.w700,
//                                     fontSize: 17,
//                                   ),
//                                   TextUtiles(
//                                     title: '  ${booking.guestCount}',
//                                     colorTextStyle: AppColors.zayteGamiq,
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 16,
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 25),
//                               Divider(thickness: 1),
//                               SizedBox(height: 5),
//                               TextUtiles(
//                                   title: 'Additional Notes:',
//                                   fontSize: 17,
//                                   fontWeight: FontWeight.w700),
//                               TextUtiles(
//                                 title: booking.additionalNotes,
//                                 fontSize: 16,
//                                 colorTextStyle: AppColors.zayteGamiq,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                               if (booking.condolenceAdditionalNotes != null)
//                                 SizedBox(height: 10),
//                               if (booking.condolenceAdditionalNotes != null)
//                                 Row(
//                                   children: [
//                                     TextUtiles(
//                                         title: 'Condolence Notes : ',
//                                         fontSize: 17,
//                                         fontWeight: FontWeight.w700),
//                                     TextUtiles(
//                                       title:
//                                           ' ${booking.condolenceAdditionalNotes}',
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w400,
//                                       colorTextStyle: AppColors.zayteGamiq,
//                                     ),
//                                   ],
//                                 ),
//                               SizedBox(height: 20),
//                               Divider(thickness: 1),
//                               SizedBox(height: 10),
//                               TextUtiles(
//                                   title: 'Services:',
//                                   fontSize: 17.2,
//                                   fontWeight: FontWeight.w700),
//                               SizedBox(height: 4),
//                               for (var service in booking.services)
//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.symmetric(vertical: 5),
//                                   child: Row(
//                                     children: [
//                                       TextUtiles(
//                                           title: '${service.serviceType} : ',
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.w400),
//                                       Expanded(
//                                         child: TextUtiles(
//                                           title: ' ${service.details}',
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.w400,
//                                           colorTextStyle: AppColors.zayteGamiq,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               SizedBox(height: 20),
//                               Divider(thickness: 1),
//                               SizedBox(height: 10),
//                               booking.songs.isEmpty
//                                   ? Text("")
//                                   : Text(
//                                       'Songs:',
//                                       style: TextStyle(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                               for (var song in booking.songs)
//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.symmetric(vertical: 5),
//                                   child: Row(
//                                     children: [
//                                       TextUtiles(
//                                         title: '${song.songName}  -  ',
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w400,
//                                         colorTextStyle: AppColors.zayteGamiq,
//                                       ),
//                                       TextUtiles(
//                                         title: '  ${song.personName}',
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w400,
//                                         colorTextStyle: AppColors.zayteGamiq,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//           //   ),
//           // ),
//           // SizedBox(
//           //   height: 3.w,
//           // ),
//           Padding(
//             padding: EdgeInsets.only(left: 4.w, top: 5.w),
//             child: Row(
//               children: [
//                 ButtonScreen(
//                   title: 'Payment to confirm booking',
//                   onTap: () {
//                     Get.to(PaymentScreen());
//                   },
//                   colorTextStyle: Colors.white,
//                   // colorContainer: controller.isPaymentTypeSelected.value
//                   //     ? AppColors.white
//                   //     : AppColors.zayteFateh,
//                   fontSize: 14,
//                   height: 11.w,
//                   weight: 55.w,
//                   borderRadius: BorderRadius.all(Radius.circular(10.w)),
//                   //only(topRight: Radius.circular(7), bottomRight: Radius.circular(7)),
//                   fontWeight: FontWeight.w400,
//                   decoration: BoxDecoration(
//                       color: AppColors.zayteGamiq,
//                       borderRadius: BorderRadius.all(Radius.circular(10.w)),
//                       border: Border(
//                           bottom: BorderSide(color: Colors.black54),
//                           right: BorderSide(color: Colors.black54),
//                           left: BorderSide(color: Colors.black54),
//                           top: BorderSide(color: Colors.black54))),
//                 ),
//                 SizedBox(
//                   width: 2.w,
//                 ),
//                 ButtonScreen(
//                   title: 'Cancel',
//                   onTap: () {
//                     bookingController.delete_REquestBooking(
//                         bookingController.Pub_Id_Booking_request);
//                     Get.back();
//                   },
//                   colorTextStyle: Colors.white,
//                   // colorContainer: controller.isPaymentTypeSelected.value
//                   //     ? AppColors.white
//                   //     : AppColors.zayteFateh,
//                   fontSize: 14,
//                   height: 11.w,
//                   weight: 25.w,
//                   borderRadius: BorderRadius.all(Radius.circular(10.w)),
//                   //only(topRight: Radius.circular(7), bottomRight: Radius.circular(7)),
//                   fontWeight: FontWeight.w400,
//                   decoration: BoxDecoration(
//                       color: AppColors.zayteGamiq,
//                       borderRadius: BorderRadius.all(Radius.circular(10.w)),
//                       border: Border(
//                           bottom: BorderSide(color: Colors.black54),
//                           right: BorderSide(color: Colors.black54),
//                           left: BorderSide(color: Colors.black54),
//                           top: BorderSide(color: Colors.black54))),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
