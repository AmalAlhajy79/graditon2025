import 'package:dio/dio.dart';
import 'package:hall_gradition/core/consts/api_const.dart';
import 'package:hall_gradition/core/network/network_helper.dart';

import '../models/details-oneHall-model.dart';
class HallDetailsDataSource {

  Future<ViewDetailsOneHallModel> getHallDetails(int hallId) async {
    try {
      final response = await NetworkHelper().get(ApiConst.fetch_user_detailsOneHall(hallId));
      print('response.data..in ..getHallDetails.');
      print(response.data);

      if (response.statusCode == 200) {
        // إذا كانت الاستجابة عبارة عن قائمة، خذ العنصر الأول
        if (response.data is List) {
          return ViewDetailsOneHallModel.fromJson(response.data[0]);
        } else {
          // إذا كانت الاستجابة غير متوقعة
          throw Exception('Unexpected response format');
        }
      } else {
        throw Exception('Failed to load hall details');
      }
    } catch (e) {
      throw Exception('Error fetching hall details: $e');
    }
  }
}

class EventImageDataSource {
  final Dio _dio = Dio();

  Future<List<EventImage>> fetchEventImages(int hallId) async {
    try {
      final response = await _dio.get('http://192.168.43.31:8001/api/halls/eventImages/$hallId');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => EventImage.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load event images');
      }
    } catch (e) {
      throw Exception('Failed to load event images: $e');
    }
  }
}

class EventVideoDataSource {
  final Dio _dio = Dio();

  Future<List<EventVideo>> fetchEventVideos(int hallId) async {
    try {
      final response = await _dio.get('http://192.168.43.31:8001/api/halls/eventVideos/$hallId');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => EventVideo.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load event videos');
      }
    } catch (e) {
      throw Exception('Failed to load event videos: $e');
    }
  }
}
