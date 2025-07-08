import 'package:get/get.dart';
import 'package:hall_gradition/core/consts/api_const.dart';
import 'package:hall_gradition/modules/user/home-user/presentation/controller/home-user-controller.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/get-time-model.dart';

class ServiceDataSource extends GetxController {
  var morningServices = <ServiceModel>[].obs;
  var eveningServices = <ServiceModel>[].obs;
  var isLoading = false.obs;
HomeUserController homeUserController=Get.put(HomeUserController());
  Future<void> fetchServices() async {
    isLoading.value = true;
    final url = Uri.parse(ApiConst.showtime_Booking(homeUserController.hallId_pub));//'http://192.168.43.31:8001/api/showtime/1');
    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List services = data['service'];

        morningServices.value = services
            .where((item) => item['type'] == 'morning')
            .map<ServiceModel>((item) => ServiceModel.fromJson(item))
            .toList();

        eveningServices.value = services
            .where((item) => item['type'] == 'evening')
            .map<ServiceModel>((item) => ServiceModel.fromJson(item))
            .toList();
      }
    } catch (e) {
      print("Error fetching services: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
