// import 'dart:convert';
// ShowProviderProfileModel ShowUserProfileModelModelFromJson(String str) => ShowProviderProfileModel.fromJson(json.decode(str));
//
// class ShowProviderProfileModel {
//   ProfileProvider profile_provider;
//   //User user;
//
//   ShowProviderProfileModel({required this.profile_provider});
//
//   factory ShowProviderProfileModel.fromJson(Map<String, dynamic> json) {
//     print("NNNNNNNNNNNNn");
//     print(json);
//     return ShowProviderProfileModel(
//       profile_provider: ProfileProvider.fromJson(json['profile']),
//     );
//   }
// }
//
// class ProfileProvider {
//   // int id;
//   // int userId;
//   String name = '';
//   String profileImage = '';
//   String email = '';
//
//   //Null emailVerifiedAt;
//   String address = '';
//   String phoneNumber = '';
//
//   // String createdAt;
//   // String updatedAt;
//
//   ProfileProvider({
//     // this.id,
//     // this.userId,
//     required this.name,
//     required this.profileImage,
//     required this.email,
//     //  this.emailVerifiedAt,
//     required this.address,
//     required this.phoneNumber,
//     // this.createdAt,
//     // this.updatedAt
//   });
//
//   ProfileProvider.fromJson(Map<String, dynamic> json) {
//     // id = json['id'];
//     // userId = json['User_id'];
//     print("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT");
//     name = json['name'];
//     print(name);
//     profileImage = json['profile_image'];
//     email = json['email'];
//     //emailVerifiedAt = json['email_verified_at'];
//     address = json['address'];
//     phoneNumber = json['phone_number'];
//     // createdAt = json['created_at'];
//     // updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     // data['id'] = this.id;
//     // data['User_id'] = this.userId;
//     data['name'] = this.name;
//     data['profile_image'] = this.profileImage;
//     data['email'] = this.email;
//     //data['email_verified_at'] = this.emailVerifiedAt;
//     data['address'] = this.address;
//     data['phone_number'] = this.phoneNumber;
//     // data['created_at'] = this.createdAt;
//     // data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
//
