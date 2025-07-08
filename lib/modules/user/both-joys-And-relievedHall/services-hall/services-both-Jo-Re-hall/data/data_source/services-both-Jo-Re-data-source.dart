import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/consts/api_const.dart';
import 'package:hall_gradition/core/network/network_helper.dart';
import '../../../../../home-user/presentation/controller/home-user-controller.dart';
import '../models/services-both-Jo-Re-model.dart';

class ViewUserDetailsServiceDataSource {

  Future<Map<String, List<ViewUserDetailsServiceModel>>> fetchServices() async {

    try {
      HomeUserController homeUserController=Get.put(HomeUserController());
      //int halId;
      final response = await NetworkHelper().get(ApiConst.user_ShowServices(homeUserController.hallId_pub));//'http://192.168.43.31:8001/api/showserv/1');
      // final List joysServicesData = response.data['original']['joys_services'];
      // final List condolencesServicesData = response.data['original']['condolences_services'];
      final List joysServicesData = response.data['original']['joys_services'] ?? [];
      final List condolencesServicesData = response.data['original'].containsKey('condolences_services') && response.data['original']['condolences_services'] != null
          ? response.data['original']['condolences_services']
          : [];

      List<ViewUserDetailsServiceModel> joysServices = joysServicesData.map((e) => ViewUserDetailsServiceModel.fromJson(e)).toList();
      List<ViewUserDetailsServiceModel> condolencesServices = condolencesServicesData.map((e) => ViewUserDetailsServiceModel.fromJson(e)).toList();

      return {
        'joys_services': joysServices,
        'condolences_services': condolencesServices,
      };
    } catch (e) {
      print("Error fetching services: $e");
      rethrow;
    }
  }
}
