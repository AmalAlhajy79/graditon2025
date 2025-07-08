import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/data_sourse/booking-datasourse.dart';

class BookingUserController extends GetxController {
  //calendar
  var currentDate = DateTime.now().obs;

  void nextMonth() {
    currentDate.value = DateTime(currentDate.value.year, currentDate.value.month + 1);
  }

  void previousMonth() {
    currentDate.value = DateTime(currentDate.value.year, currentDate.value.month - 1);
  }

  List<String> getDaysWithEmptySpaces() {
    List<String> days = [];
    int daysInMonth = DateTime(currentDate.value.year, currentDate.value.month + 1, 0).day;
    int startDay = DateTime(currentDate.value.year, currentDate.value.month, 1).weekday;

    // إضافة فراغات قبل أول يوم من الشهر
    for (int i = 0; i < startDay - 1; i++) {
      days.add('');
    }

    // إضافة الأيام الفعلية
    for (int i = 1; i <= daysInMonth; i++) {
      days.add(i.toString());
    }

    return days;
  }

//
  var selectedCircles = <int, bool>{}.obs;

  void toggleCircle(int index) {
    if (selectedCircles.containsKey(index)) {
      selectedCircles[index] = !selectedCircles[index]!;
    } else {
      selectedCircles[index] = true;
    }
  }

  var serviceDataSource = ServiceDataSource();

  @override
  void onInit() {
    super.onInit();
    serviceDataSource.fetchServices(); // جلب البيانات عند بدء الـ Controller
  }

  //////// in booking Screen
  var selectedTime = ''.obs;
  var selectedIndexMap = <int, bool>{}.obs;
  var selectedDay = ''.obs;

  var event_date;
  var time_from;
  var time_to;

  void toggleSelection(int index, String time) {
    selectedIndexMap.clear(); // اختيار واحد فقط
    selectedIndexMap[index] = true;
    selectedTime.value = time;
    print("Selected Time: $time");
  }

}
