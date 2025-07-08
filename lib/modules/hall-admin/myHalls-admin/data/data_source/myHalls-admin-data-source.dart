
import 'package:dio/dio.dart';
import 'package:hall_gradition/core/consts/api_const.dart';
import 'package:hall_gradition/core/network/network_helper.dart';

import '../models/myHallsAdmin-model.dart';

class MyHallSHallAdminDataSource {

  Future<List<MyHallSHallAdminModel>> getHalls() async {
    print(ApiConst.getMyHallsAdmin);
    // try {
      final response = await NetworkHelper().get(ApiConst.getMyHallsAdmin); //// رابط API هنا
    print(response.statusCode);
    print(response.data);
    if (response.statusCode == 200) {
        List<MyHallSHallAdminModel> halls = (response.data as List)
            .map((hall) => MyHallSHallAdminModel.fromJson(hall))
            .toList();
        print("......susces..........");
        print(response.statusCode);
        print(response.data);
        return halls;
      } else {
        print("................");
        print(response.statusCode);
        print(response.data);
        throw Exception('Failed to load halls');
      }
    // } catch (e) {
    //   throw Exception('Failed to load halls: $e');
    // }
  }
}
