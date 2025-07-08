class ViewFeedbackUserModel {
  List<Reviews> reviews=[];

  ViewFeedbackUserModel({required this.reviews});

  ViewFeedbackUserModel.fromJson(Map<String, dynamic> json) {
    if (json['reviews'] != null) {
     // reviews = List<Reviews>();
      json['reviews'].forEach((v) {
        reviews.add(new Reviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.reviews != null) {
      data['reviews'] = this.reviews.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reviews {
  // int id;
  // int userId;
  // int hallId;
  int rating=0;
  String comment='';
  // String createdAt;
  // String updatedAt;
  User user=User(name: '', photo: '');

  Reviews(
      {
        // this.id,
        // this.userId,
        // this.hallId,
        required this.rating,
        required this.comment,
        // this.createdAt,
        // this.updatedAt,
        required this.user
      });

  Reviews.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    // userId = json['user_id'];
    // hallId = json['hall_id'];
    rating = json['rating'];
    comment = json['comment'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    user = (json['user'] != null ? new User.fromJson(json['user']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['id'] = this.id;
    // data['user_id'] = this.userId;
    // data['hall_id'] = this.hallId;
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    // data['created_at'] = this.createdAt;
    // data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user;
    }
    return data;
  }
}

class User {
  // int id;
  String name='';
  // String email;
  // Null emailVerifiedAt;
  // String location;
  // String number;
  String? photo='';
  // Null idImage;
  // String role;
  // String apiToken;
  // String createdAt;
  // String updatedAt;

  User(
      {
        // this.id,
        required this.name,
        // this.email,
        // this.emailVerifiedAt,
        // this.location,
        // this.number,
         this.photo,
        // this.idImage,
        // this.role,
        // this.apiToken,
        // this.createdAt,
        // this.updatedAt
      });

  User.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    name = json['name'];
    // email = json['email'];
    // emailVerifiedAt = json['email_verified_at'];
    // location = json['location'];
    // number = json['number'];
    photo = json['photo'];
    // idImage = json['id_image'];
    // role = json['role'];
    // apiToken = json['api_token'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
  }


}
