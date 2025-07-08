class DetailsAdminHallModel {
  late int id;
  late String name;
  late int ownerId;
  late int capacity;
  late String location;
  late String contact;
  late String type;
  late List<String> events;
  late final hallImage;
  late List<String> images;

  DetailsAdminHallModel({
    required this.id,
    required this.name,
    required this.ownerId,
    required this.capacity,
    required this.location,
    required this.contact,
    required this.type,
    required this.events,
    required this.hallImage,
    required this.images,
  });

  // تعديل طريقة fromJson لتتعامل مع خريطة واحدة
  DetailsAdminHallModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    ownerId = json['owner_id'];
    capacity = json['capacity'];
    location = json['location'];
    contact = json['contact'];
    type = json['type'];
    events = List<String>.from(json['events']);
    hallImage = json['hall_image'];
    images = List<String>.from(json['images']);
  }

  // إضافة طريقة لتحويل قائمة من القاعات
  static List<DetailsAdminHallModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => DetailsAdminHallModel.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['owner_id'] = this.ownerId;
    data['capacity'] = this.capacity;
    data['location'] = this.location;
    data['contact'] = this.contact;
    data['type'] = this.type;
    data['events'] = this.events;
    data['hall_image'] = this.hallImage;
    data['images'] = this.images;
    return data;
  }
}


// class DetailsAdminHallModel {
//  late int id;
//  late String name;
//  late int ownerId;
//  late int capacity;
//  late String location;
//  late String contact;
//  late String type;
//  late List<String> events;
//  late final hallImage;
//  late List<String> images;
//
//   DetailsAdminHallModel(
//       {required this.id,
//         required this.name,
//         required this.ownerId,
//         required this.capacity,
//         required this.location,
//         required this.contact,
//         required this.type,
//         required this.events,
//         required this.hallImage,
//         required this.images});
//
//   DetailsAdminHallModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     ownerId = json['owner_id'];
//     capacity = json['capacity'];
//     location = json['location'];
//     contact = json['contact'];
//     type = json['type'];
//     events = json['events'].cast<String>();
//     hallImage = json['hall_image'];
//     images = json['images'].cast<String>();
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['owner_id'] = this.ownerId;
//     data['capacity'] = this.capacity;
//     data['location'] = this.location;
//     data['contact'] = this.contact;
//     data['type'] = this.type;
//     data['events'] = this.events;
//     data['hall_image'] = this.hallImage;
//     data['images'] = this.images;
//     return data;
//   }
// }
