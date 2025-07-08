class SendFeedbackUserModel {
  String message='';
  Review review=Review(hallId: '', rating: '', comment: '');

  SendFeedbackUserModel({required this.message, required this.review});

  SendFeedbackUserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    review =
    (json['review'] != null ? new Review.fromJson(json['review']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.review != null) {
      data['review'] = this.review.toJson();
    }
    return data;
  }
}

class Review {
  // int userId;
  String hallId='';
  String rating='';
  String comment='';
  // String updatedAt;
  // String createdAt;
  // int id;

  Review(
      {
        //required this.userId,
        required this.hallId,
        required this.rating,
        required this.comment,
        // this.updatedAt,
        // this.createdAt,
        // this.id
      });

  Review.fromJson(Map<String, dynamic> json) {
    // userId = json['user_id'];
    hallId = json['hall_id'];
    rating = json['rating'];
    comment = json['comment'];
    // updatedAt = json['updated_at'];
    // createdAt = json['created_at'];
    // id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    //data['user_id'] = this.userId;
    data['hall_id'] = this.hallId;
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    // data['updated_at'] = this.updatedAt;
    // data['created_at'] = this.createdAt;
    // data['id'] = this.id;
    return data;
  }
}
