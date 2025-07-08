import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hall_gradition/core/consts/api_const.dart';
import 'package:hall_gradition/core/network/network_helper.dart';

import '../../../home-user/presentation/controller/home-user-controller.dart';
import '../models/SendCommen-user-model.dart';
import '../models/view-user-feddback-model.dart';


class FeedbackRemoteDataSource {
  Future<void> send_UserReview(SendFeedbackUserModel feedback) async {
    try {
      print(feedback.review.hallId);
      print(feedback.review.rating);
      print(feedback.review.comment);
      final response = await NetworkHelper().post(
        ApiConst.send_User_Review,
       body: {
      'hall_id':'${feedback.review.hallId}',
      'rating': '${feedback.review.rating}',
      'comment':'${feedback.review.comment}'
      },
      );
      print('Response: ${response.data}');
      if(response.statusCode==200){
        print('Response: ${response.data}');
        print("succes.......");
      }

    } catch (e) {

      print('Error sending review: $e');
      rethrow;
    }
  }
  HomeUserController homeUserController=Get.put(HomeUserController());


  Future<ViewFeedbackUserModel> fetchReviews(String hallId) async {
    print('homeUserController.hallId_pub  in fetchReviews()');
    print(homeUserController.hallId_pub);
    try {
      final response = await NetworkHelper().get(ApiConst.fetchUserReviews(hallId));//homeUserController.hallId_pub));
      return ViewFeedbackUserModel.fromJson(response.data);
    } catch (e) {
      print('Error fetching reviews: $e');
      rethrow;
    }
  }
}
