import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/consts/api_const.dart';
import 'package:hall_gradition/core/network/network_helper.dart';

import '../models/view-all-hallsModel.dart';

class ApiService {
  Future<List<ViewAllHallsModel>> fetchHalls() async {
    try {
      final response = await NetworkHelper().get(ApiConst.fetchAll_Halls_User);
      if (response.statusCode == 200) {
        print('succes......');
        print(response.data);
        List<dynamic> data = response.data;
        return data.map((json) => ViewAllHallsModel.fromJson(json)).toList();
      } else {
        print('error......');
        throw Exception('Failed to load halls');
      }
    } catch (e) {
      rethrow;
    }
  }
}
