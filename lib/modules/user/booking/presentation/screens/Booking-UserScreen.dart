import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/core_components/textUtiles.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import 'package:intl/intl.dart';

import '../../../../../core/consts/app_colors.dart';
import '../../../../../core/core_components/TextFormFeild.dart';
import '../../../../../core/core_components/button.dart';
import '../../../both-joys-And-relievedHall/services-hall/services-both-Jo-Re-hall/presentation/controller/services-both-Jo-Re/services-both-Jo-Re-hall-Controller.dart';
import '../../../fetch-user-MyBooking/presentation/screens/fetch-userBooking-hall-screen.dart';
import '../../data/data_sourse/booking-datasourse.dart';
import '../../data/models/get-time-model.dart';
import '../components/customRowCheckHoures.dart';
import '../controller/booking-binding.dart';
import '../controller/booking-controller.dart';

class BookingUserScreen extends StatelessWidget {
  static const name = '/BookingUserScreen';
  static final page = GetPage(
      name: name,
      page: () => BookingUserScreen(),
      binding: BookingUserBinding());
  final BookingUserController controller = Get.put(BookingUserController());
  ServiceDataSource serviceDataSource=ServiceDataSource();
  BothJoysReHallController bothJoysReHallController=Get.put(BothJoysReHallController());

  Widget _buildCustomDialog(BuildContext context) {
    final serviceController = Get.put(ServiceDataSource());
    serviceController.fetchServices();

    return Dialog(
      insetPadding: EdgeInsets.only(top: 80.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Obx(() {

          if (serviceController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }
          final selectedDay = controller.selectedDay.value;
          final currentDate = controller.currentDate.value;

          String formattedDate = '';
          if (selectedDay.isNotEmpty) {
            final day = int.parse(selectedDay);
            final fullDate = DateTime(currentDate.year, currentDate.month, day);
            formattedDate = DateFormat('yyyy-MM-dd').format(fullDate);
            controller.event_date =formattedDate;
            print('controller.event_date........');
            print(controller.event_date);
          }
          final timeParts = controller.selectedTime.value.split('-');
          final fromTime = timeParts.length > 0 ? timeParts[0].trim() : '';
          final toTime = timeParts.length > 1 ? timeParts[1].trim() : '';

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextUtiles(
                      // "التفاصيل لهذا اليوم: $day",
                      title: 'the time',
                      fontSize: 17,
                    ),
                  ],
                ),

                Divider(color: Colors.black, height: 7.w, thickness: 1.2),
                // الكونتينر المنحني
                Padding(
                  padding: EdgeInsets.only(top: 2.w, left: 2.w, bottom: 4.w),
                  child: Container(
                    height: 9.w,
                    width: 25.w,
                    decoration: BoxDecoration(
                      color: AppColors.zayteGamiq,
                      borderRadius: BorderRadius.circular(8.w),
                    ),
                    child: Center(
                      child: TextUtiles(
                        title: 'evening',
                        colorTextStyle: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
               // Center(child: Text("Morning", style: TextStyle(fontSize: 16))),
               // Divider(),
                ...serviceController.morningServices
                    .asMap()
                    .entries
                    .map((entry) => _buildTimeRow(entry.key, entry.value)),

               // SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(top: 2.w, left: 2.w, bottom: 4.w),
                  child: Container(
                    height: 9.w,
                    width: 25.w,
                    decoration: BoxDecoration(
                      color: AppColors.zayteGamiq,
                      borderRadius: BorderRadius.circular(8.w),
                    ),
                    child: Center(
                      child: TextUtiles(
                        title: 'morning',
                        colorTextStyle: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                //Center(child: Text("Evening", style: TextStyle(fontSize: 16))),
              //  Divider(),
                ...serviceController.eveningServices
                    .asMap()
                    .entries
                    .map((entry) => _buildTimeRow(
                    entry.key + 100, // لتجنب تكرار نفس index
                    entry.value)),
              ],
            ),
          );
        }),
      ),
    );
  }
  Widget _buildTimeRow(int index, ServiceModel service) {

    return Padding(
      padding: EdgeInsets.only(left: 4.w, bottom: 2.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // استخدام DateFormat لتنسيق الوقت بدون ثواني
          TextUtiles(
            title: "${_formatTime(service.from)}  to  ${_formatTime(service.to)}",
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            width: 10.w,
          ),
          Obx(() {
            final isSelected = controller.selectedIndexMap[index] ?? false;
            return GestureDetector(
              onTap: () {
                String fromTime =service.from; // مثلا "10:00"
                String toTime = service.to;     // مثلا "01:00"

                DateTime fromDateTime = DateFormat("HH:mm").parse(_formatTime(fromTime));
                DateTime toDateTime = DateFormat("HH:mm").parse(_formatTime(toTime));

                // التأكد من أن وقت النهاية بعد وقت البداية
                toDateTime = _adjustToTime(fromDateTime, toDateTime);

                // طباعة الأوقات المعدلة (إذا كانت 12 ساعة مضافة)
                print("From Time: ${DateFormat("HH:mm").format(fromDateTime)}");
                print("To Time: ${DateFormat("HH:mm").format(toDateTime)}");

                controller.time_from=DateFormat("HH:mm").format(fromDateTime);//_formatTime(service.from);
                controller.time_to=DateFormat("HH:mm").format(toDateTime);
                print('controller.time_from........');
                print(controller.time_from);
                print('controller.time_to........');
                print(controller.time_to);
                controller.toggleSelection(index, "${controller.time_from} - ${controller.time_to}");
              },
              child: CircleAvatar(
                radius: 11,
                backgroundColor: isSelected ? Colors.green : Colors.grey,
              ),
            );
          }),
        ],
      ),
    );
  }

// دالة لتنسيق الوقت (إزالة الثواني)
  String _formatTime(String time) {
    final dateTime = DateTime.parse('1970-01-01 $time');
    return DateFormat('HH:mm').format(dateTime); // تنسيق الوقت بدون ثواني
  }
  // دالة للتأكد إذا كان وقت النهاية قبل وقت البداية وتحويله إلى 24 ساعة
  DateTime _adjustToTime(DateTime fromTime, DateTime toTime) {
    // إذا كان وقت النهاية (to) قبل وقت البداية (from) نضيف 12 ساعة
    if (toTime.isBefore(fromTime)) {
      return toTime.add(Duration(hours: 12)); // إضافة 12 ساعة لتحويله إلى وقت بعد الظهر
    }
    return toTime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 2.w, right: 4.w, top: 3.w),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () => Get.back(), //controller.previousMonth(),
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    TextUtiles(
                        title: "Booking",
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ],
                ),
              ),
              Container(
                height: 154.w,
                child: ListView(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 4.w, right: 4.w, top: 2.5.w),
                      child: Container(
                        height: 80.w,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(2.w)),
                            border: Border(
                                top: BorderSide(width: 1),
                                left: BorderSide(width: 1),
                                right: BorderSide(width: 1),
                                bottom: BorderSide(width: 1))),
                        padding: EdgeInsets.all(1),
                        child: Padding(
                          padding: EdgeInsets.only(left: 5.w, right: 5.w),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 1.5.w, right: 1.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      icon:
                                          Icon(Icons.arrow_back_ios, size: 14),
                                      onPressed: () =>
                                          controller.previousMonth(),
                                    ),
                                    Obx(() {
                                      return Row(
                                        children: [
                                          Text(
                                            DateFormat('MMMM').format(
                                                controller.currentDate.value),
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          Text(
                                            controller.currentDate.value.year
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      );
                                    }),
                                    IconButton(
                                      icon: Icon(Icons.arrow_forward_ios,
                                          size: 15),
                                      onPressed: () => controller.nextMonth(),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 3.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    TextUtiles(
                                      title: 'S',
                                      fontSize: 12,
                                      colorTextStyle: Colors.green,
                                    ),
                                    TextUtiles(
                                      title: 'M',
                                      fontSize: 12,
                                      colorTextStyle: Colors.green,
                                    ),
                                    TextUtiles(
                                      title: 'T',
                                      fontSize: 12,
                                      colorTextStyle: Colors.green,
                                    ),
                                    TextUtiles(
                                      title: 'W',
                                      fontSize: 12,
                                      colorTextStyle: Colors.green,
                                    ),
                                    TextUtiles(
                                      title: 'T',
                                      fontSize: 12,
                                      colorTextStyle: Colors.green,
                                    ),
                                    TextUtiles(
                                      title: 'F',
                                      fontSize: 12,
                                      colorTextStyle: Colors.green,
                                    ),
                                    TextUtiles(
                                      title: 'S',
                                      fontSize: 12,
                                      colorTextStyle: Colors.green,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Obx(() {
                                  final days =
                                      controller.getDaysWithEmptySpaces();
                                  return GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 7,
                                      childAspectRatio: 1.5,
                                    ),
                                    itemCount: days.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          if(days[index].isNotEmpty){
                                            controller.selectedDay.value = days[index]; // حفظ اليوم المختار
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return _buildCustomDialog(
                                                    context);
                                              },
                                            );
                                          }
                                        },
                                        child: Center(
                                          child: TextUtiles(
                                            title: days[index],
                                            fontSize: 12,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 6.w, right: 5.w, top: 3.5.w),
                      child: Row(
                        children: [
                          Icon(Icons.people_alt_outlined),
                          SizedBox(width: 2.w),
                          TextUtiles(
                            title: "Number of people",
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(width: 11.w),
                          Container(
                            height: 12.w,
                            width: 16.w,
                            color: Colors.white,
                            child: Center(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller:bothJoysReHallController.numberController,
                                textAlignVertical: TextAlignVertical.center,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: '0',
                                  filled: true,
                                  fillColor: AppColors.gerysuggest,
                                  hintStyle: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                ),
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 5.w, right: 5.w, top: 2.5.w),
                      child: Row(
                        children: [
                          ButtonScreen(
                            title: 'note',
                            onTap: () {},
                            colorTextStyle: Colors.white,
                            colorContainer: AppColors.zayteGamiq,
                            fontSize: 11.4,
                            height: 6.w,
                            weight: 14.4.w,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 5.w, top: 3.w, left: 7.w),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextUtiles(
                                title:
                                    "if you want to increase the time,you can choose from the available additional hours.",
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                colorTextStyle: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 9.w,
                        right: 5.w,
                        top: 3.5.w,
                      ),
                      child: Column(
                        children: [
                          CustomRow(
                              text: '1 hour',
                              index: 1,
                              controller: controller,
                              price: "20\$"),
                          SizedBox(height: 0.6.w),
                          CustomRow(
                            text: '2 hour',
                            index: 2,
                            controller: controller,
                            price: "40\$",
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 7.1.w, right: 7.1.w, top: 7.w),
                      child: ButtonScreen(
                        title: 'Send',
                        onTap: () async{
                       // bothJoysReHallController.sendBookingUnified();//sendBooking();
                            try {
                               await bothJoysReHallController.sendBookingUnified();
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: Text('success booking'),
                                  content: Text('The hall has been successfully booked.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        //Navigator.of(context).pop();
                                        Get.to(UserBookingHallListPage());
                                        },
                                      child: Text('okً'),
                                    ),
                                  ],
                                ),
                              );
                               Get.to(UserBookingHallListPage());
                            } catch (e) {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: Text('error'),
                                  content: Text(e.toString().replaceAll("Exception: ", "")),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.of(context).pop(),
                                      child: Text('close'),
                                    ),
                                  ],
                                ),
                              );
                            }

                        },
                        colorTextStyle: Colors.white,
                        colorContainer: AppColors.zayteGamiq,
                        fontSize: 19,
                        height: 11.4.w,
                        weight: 87.w,
                        borderRadius: BorderRadius.all(Radius.zero),
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
    );
  }
}

