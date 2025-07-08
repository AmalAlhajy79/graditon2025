import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hall_gradition/core/consts/api_const.dart';
import 'package:hall_gradition/core/network/network_helper.dart';

import '../../data/data_source/view-allHalls-DataSourse.dart';
import '../../data/models/view-all-hallsModel.dart';

class HomeUserController extends GetxController {
  var showList1Selected = true.obs;
  var showList2Selected = false.obs;
  var showList3Selected = false.obs;

  void showList1() {
    showList1Selected.value = true;
    showList2Selected.value = false;
    showList3Selected.value = false;
  }

  void showList2() {
    showList1Selected.value = false;
    showList2Selected.value = true;
    showList3Selected.value = false;
  }

  void showList3() {
    showList1Selected.value = false;
    showList2Selected.value = false;
    showList3Selected.value = true;
  }

  var halls = <ViewAllHallsModel>[].obs;
  var isLoading = true.obs;
  var viewUserRating ;

  @override
  void onInit() {
    super.onInit();
    fetchHalls();
    //



    Timer.periodic(Duration(seconds: 1), (timer) {
      if (currentIndex.value < halls.length - 1) {
        currentIndex.value++;
      } else {
        currentIndex.value = 0; // إعادة التكرار عند الوصول إلى آخر صورة
      }
    });
  }
var avg_Ratting_OneHall;
  var hallId_pub;
  // جلب البيانات من الـ API
  Future<void> fetchHalls() async {
    try {
      isLoading(true);
      var response = await NetworkHelper().get(ApiConst.fetchAll_Halls_User);//'http://192.168.43.31:8001/api/halls');
      if (response.statusCode == 200) {
        var data = response.data as List;
        halls.value = data.map((hall) => ViewAllHallsModel.fromJson(hall)).toList();
     print(halls.value[0].hallImage);
      } else {
        // معالجة حالة فشل الاستجابة
        print('Failed to load halls');
      }
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      isLoading(false);
    }
  }
// متغيرات التحكم في الصور والتبديل التلقائي
  var pageController = PageController();
  var currentIndex = 0.obs;
  var hallss = <Hall>[];

  // مثال لدالة افتراضية لجلب بيانات الصالات
  List<Hall> hallList() {
    return [
      Hall(hallImage: 'hall1.jpg'),
      Hall(hallImage: 'hall2.jpg'),
      Hall(hallImage: 'hall3.jpg'),
    ];
  }
}
// نموذج بيانات الصالة
class Hall {
  final String hallImage;
  Hall({required this.hallImage});
}