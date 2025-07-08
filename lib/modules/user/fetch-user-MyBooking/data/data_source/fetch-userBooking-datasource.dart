import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../../../core/consts/api_const.dart';
import '../../../../../core/network/network_helper.dart';
import '../models/fetch-user-MyBooking-model.dart';

class FetchUserBookingHallDataSource extends GetConnect {
  // final Dio dio = Dio(BaseOptions(
  //   baseUrl: 'http://192.168.43.31:8001/api',
  //   headers: {'Authorization': 'Bearer 3|xecMnJYTSLBF5Erf1hZaGZlWFGpCKFJRTaVuRrkv3e67223a'},
  // ));

  Future<List<UserMyBookingModel>> fetchBookings() async {
    try {
      final response = await NetworkHelper().get(ApiConst.fetch_UserBookingHall);//dio.get('/Client/myBookings');
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((item) => UserMyBookingModel.fromJson(item))
            .toList();
      } else {
        throw Exception('فشل في تحميل البيانات');
      }
    } catch (e) {
      throw Exception('خطأ في الاتصال: $e');
    }
  }
  Future<void> delete_booking(int id_Booking_request)async{
    final response = await NetworkHelper().reject(ApiConst.delete_booking(id_Booking_request),
        // body: {
      // 'status': 'rejected',
    // },
    );
    if(response.statusCode==200){
      print('reject booking request succisfuly..');
    }else{
      print('error when reject booking request ..');
    }
  }
}
