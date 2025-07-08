import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/core_components/button.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import '../../../../../core/consts/app_colors.dart';
import '../controller/request-toBooking-car-binding.dart';
import '../controller/request-tobooking-car-controller.dart';

class BookingCarUserPage extends StatelessWidget {
  static const name = '/BookingCarUserPage';
  static final page = GetPage(
      name: name,
      page: () => BookingCarUserPage(),
      binding: BookingCarUserBinding());

  final BookingCarUserController controller = Get.put(BookingCarUserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Text("Booking"),
        ),
        leading: Padding(
          padding:EdgeInsets.only(left: 5.w),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Get.back(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Date Picker
            ListTile(
              leading: Icon(Icons.date_range),
              title: Obx(() => Text(controller.selectedDate.value == null
                  ? "Select Date"
                  : "${controller.selectedDate.value!.toLocal()}"
                      .split(' ')[0])),
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (picked != null) controller.selectedDate.value = picked;
              },
            ),
            // Time Picker
            ListTile(
              leading: Icon(Icons.access_time),
              title: Obx(() => Text(controller.selectedTime.value == null
                  ? "Select Time"
                  : controller.selectedTime.value!.format(context))),
              onTap: () async {
                TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (picked != null) controller.selectedTime.value = picked;
              },
            ),
            // Pickup location
            Padding(
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              child: TextField(
                controller: controller.pickupController,
                decoration: InputDecoration(labelText: "Pickup Location"),
                onChanged: (val) => controller.pickupLocation.value = val,
              ),
            ),
            SizedBox(height: 10),
            // Destination
            Padding(
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              child: TextField(
                controller: controller.destinationController,
                decoration: InputDecoration(labelText: "Destination"),
                onChanged: (val) => controller.destination.value = val,
              ),
            ),
            SizedBox(height: 20),
            // Car type and count
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
              child: Row(
                children: [
                  // القائمة المنسدلة على جهة اليسار
                  Expanded(
                    flex: 3,
                    child: Obx(() => Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade400),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: controller.carType.value,
                              items: controller.carTypes.map((type) {
                                return DropdownMenuItem<String>(
                                  value: type,
                                  child: Text(type,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500)),
                                );
                              }).toList(),
                              onChanged: (value) {
                                if (value != null)
                                  controller.carType.value = value;
                              },
                            ),
                          ),
                        )),
                  ),

                  SizedBox(width: 12),

                  Expanded(
                    flex: 2,
                    child: Obx(() => Container(
                          height: 16.w,
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.blue.shade200),
                          ),
                          child: Text(
                            controller.carType.value,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),

                  SizedBox(width: 12),

                  Expanded(
                    flex: 2,
                    child: Obx(() => Container(
                          height: 17.w,
                          width: 9.w,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade400),
                          ),
                          child: CupertinoPicker(
                            scrollController: FixedExtentScrollController(
                                initialItem: controller.carCount.value - 1),
                            itemExtent: 32,
                            onSelectedItemChanged: (index) {
                              controller.carCount.value = index + 1;
                            },
                            children: List.generate(20, (index) {
                              return Center(
                                child: Text(
                                  '${index + 1}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              );
                            }),
                          ),
                        )),
                  )

                ],
              ),
            ),

            SizedBox(height:4.w),
            Padding(
              padding: EdgeInsets.only(left: 3.w, right: 3.w),
              child: TextFormField(
                controller:controller.addition_descriptionController,
                decoration: InputDecoration(
                  hintText: 'Add your addition description..',
                  filled: true,
                  fillColor: AppColors.gerysuggest,
                  hintStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                  contentPadding:
                      EdgeInsets.only(top: 18.w, left: 4.w, right: 8.w),
                  enabledBorder: OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(30.0), // حواف دائرية
                    borderSide:
                        BorderSide(color: Colors.transparent), // لا يظهر الخط
                  ),
                  focusedBorder: OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(30.0), // حواف دائرية
                    borderSide:
                        BorderSide(color: Colors.transparent), // لا يظهر الخط
                  ),
                  border: OutlineInputBorder(
                    //  borderRadius: BorderRadius.circular(30.0), // حواف دائرية
                    borderSide:
                        BorderSide(color: Colors.transparent), // لا يظهر الخط
                  ),
                ),
              ),
            ),
    SizedBox(height: 9.w,),
    Padding(
      padding:  EdgeInsets.only( left: 3.w, right: 3.w),
      child: ButtonScreen(onTap: (){controller.sendRequest();},title: 'Submit Request',fontSize: 16,colorContainer: AppColors.zayteGamiq,),
    ),
          ],
        ),
      ),
    );
  }
}
