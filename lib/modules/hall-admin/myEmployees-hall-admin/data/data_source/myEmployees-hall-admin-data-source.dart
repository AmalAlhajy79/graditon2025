
import 'dart:convert';

import 'package:hall_gradition/modules/hall-admin/notification-hall-admin/data/models/notification-hallAdmin-model.dart';

import '../../../../../../core/consts/api_const.dart';
import '../../../../../../core/network/network_helper.dart';
import 'package:dio/dio.dart';

import '../../../notification-hall-admin/data/data_source/notification-hall-admin-data-source.dart';
import '../models/myEmployees-hallAdmin-model.dart';

class MyEmployeesHallAdminDataSource {
  // final Dio dio;

  // UserDataSource(this.dio);
// int hall_id=0;
  Future<List<AssistantData>> fetchApprovedAssistant(int hall_id) async {
    final response = await NetworkHelper().get(ApiConst.fetchAssistant(hall_id)); // استبدل بـ URL الخاص بك
    if (response.statusCode == 200) {
      List<AssistantData> users = (response.data as List)
          .map((user) => AssistantData.fromJson(user))
          .toList();
      return users;
    } else {
      throw Exception('Failed to load MyEmployees');
    }
  }


  Future<void> deleteAssistant(int id)async {
print('.....url');
print( ApiConst.deleteAssistant(id));
    final response = await NetworkHelper().delete(
      ApiConst.deleteAssistant(id));
    if (response.statusCode == 200) {
      print('delete Assistint succisfuly..');
    } else {
      print('error when delete Assistint ..');
    }
  }
}


// class MyEmployeesHallAdminDataSource{
//
//   static Future<void> myEmployeesAdminHall({
//     required String name,
//     required String hours,
//     required String photo,
//
//   })
//   async{
//     // var response = await NetworkHelper().post( // or put  NetworkHelper().put()
//     //     ApiConst.notificationAdmin_Hall,
//     //     body: {
//     //     //  'provider_id': provider_id,
//     //       'name': Full_name,
//     //       'email': email,
//     //       'number':number
//     //     },
//    // );
//    // print("response EditProfileHallAdmin : $response");
//     // String token = response.data['token'];
//     // await Stor
//     // ageHandler().setToken(token);
//   }
//
//
//
// }