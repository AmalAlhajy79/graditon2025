import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../data/data_source/Send-view-comment-user-dataSource.dart';
import '../../data/models/SendCommen-user-model.dart';
import '../../data/models/view-user-feddback-model.dart';


class FeedbackController extends GetxController {
  final FeedbackRemoteDataSource dataSource = FeedbackRemoteDataSource();
  final TextEditingController commentController = TextEditingController();
  int rating_user=0;
  var isLoading = false.obs;
  var viewUserRating;

  Future<void> submitFeedback({
    required String hallId,
    required int rating,
    required String comment,
  }) async {
    isLoading.value = true;

    final feedback = SendFeedbackUserModel(
      message: 'Send Review',
      review: Review(
        hallId: hallId,
        rating: rating.toString(),
        comment: comment,
      ),
    );

    try {
      await dataSource.send_UserReview(feedback);
      print('Success ,Feedback sent successfully');
      Get.snackbar('Success', 'Feedback sent successfully');
    } catch (e) {
      print('Error Failed to send feedback');
      Get.snackbar('Error', 'Failed to send feedback');
    } finally {
      isLoading.value = false;
    }
  }


  var reviews = <Reviews>[].obs;


  @override
  void onInit() {
    super.onInit();
    //fetchReviews();
  }

  // تحميل التقييمات من الـ API
  Future<void> fetchReviews(String hallId) async {
    try {
      isLoading(true);
      final data = await dataSource.fetchReviews(hallId);
      reviews.assignAll(data.reviews);  // إضافة التقييمات المحملة إلى الـ List
    } finally {
      isLoading(false);
    }
  }

}


