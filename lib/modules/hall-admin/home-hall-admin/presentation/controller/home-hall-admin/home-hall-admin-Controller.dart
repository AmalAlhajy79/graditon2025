import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:hall_gradition/core/consts/api_const.dart';
import 'package:hall_gradition/core/network/network_helper.dart';
import '../../../data/models/home-hall-admin-model.dart';
class HallDetailsAdminController extends GetxController {
  var hallDetails = Rx<DetailsAdminHallModel?>(null);
  var isLoading = false.obs;
  var errorMessage = "".obs;
  var hallId_public=0;

  @override
  void onInit() {
    super.onInit();
    // تأكد من أن hallId تم تعيينه بشكل صحيح عند التهيئة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchHallDetails(hallId_public); // استدعاء fetchHallDetails بعد مرحلة البناء
    });
  }

  Future<void> fetchHallDetails(int hallId) async {
    isLoading.value = true;
    try {
      final response = await NetworkHelper().get(ApiConst.home_Hall_Admin(hallId));
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<DetailsAdminHallModel> halls = DetailsAdminHallModel.fromJsonList(data);

        if (halls.isNotEmpty) {
          hallDetails.value = halls[0]; // تعيين أول قاعة إلى hallDetails
        }
      } else {
        errorMessage.value = 'فشل في تحميل البيانات';
      }
    } catch (e) {
      errorMessage.value = 'حدث خطأ: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
