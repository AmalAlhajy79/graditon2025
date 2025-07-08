
class ViewAllHallsModel {
  int? id;
  String? name;
  int? ownerId;
  int? capacity;
  String? location;
  String? contact;
  String? type;
  List<String>? events;
  String? hallImage;
  List<HallImage>? images; // تعديل هنا
  int? averageRating;

  ViewAllHallsModel({
    this.id,
    this.name,
    this.ownerId,
    this.capacity,
    this.location,
    this.contact,
    this.type,
    this.events,
    this.hallImage,
    this.images,
    this.averageRating,
  });

  ViewAllHallsModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    ownerId = json["owner_id"];
    capacity = json["capacity"];
    location = json["location"];
    contact = json["contact"];
    type = json["type"];
    events = json["events"] == null ? null : List<String>.from(json["events"]);
    hallImage = json["hall_image"];
    images = json["images"] == null
        ? null
        : List<HallImage>.from(json["images"].map((x) => HallImage.fromJson(x)));
    averageRating = json["average_rating"] is double
        ? (json["average_rating"] as double).toInt()
        : json["average_rating"] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["owner_id"] = ownerId;
    _data["capacity"] = capacity;
    _data["location"] = location;
    _data["contact"] = contact;
    _data["type"] = type;
    if (events != null) _data["events"] = events;
    _data["hall_image"] = hallImage;
    if (images != null) {
      _data["images"] = images!.map((x) => x.toJson()).toList();
    }
    _data["average_rating"] = averageRating;
    return _data;
  }
}

class HallImage {
  int? id;
  int? hallId;
  String? imagePath;

  HallImage({this.id, this.hallId, this.imagePath});

  factory HallImage.fromJson(Map<String, dynamic> json) {
    return HallImage(
      id: json['id'],
      hallId: json['hall_id'],
      imagePath: json['image_path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "hall_id": hallId,
      "image_path": imagePath,
    };
  }
}


// class ViewAllHallsModel {
//   int? id;
//   String? name;
//   int? ownerId;
//   int? capacity;
//   String? location;
//   String? contact;
//   String? type;
//   List<String>? events;
//   String? hallImage;
//   List<String>? images;
//   int? averageRating;
//
//   ViewAllHallsModel({
//     this.id,
//     this.name,
//     this.ownerId,
//     this.capacity,
//     this.location,
//     this.contact,
//     this.type,
//     this.events,
//     this.hallImage,
//     this.images,
//     this.averageRating,
//   });
//
//   ViewAllHallsModel.fromJson(Map<String, dynamic> json) {
//     id = json["id"];
//     name = json["name"];
//     ownerId = json["owner_id"];
//     capacity = json["capacity"];
//     location = json["location"];
//     contact = json["contact"];
//     type = json["type"];
//     events = json["events"] == null ? null : List<String>.from(json["events"]);
//     hallImage = json["hall_image"];
//     images = json["images"] == null ? null : List<String>.from(json["images"]);
//
//     // تعديل تحويل averageRating لتعامل مع قيم من نوع double
//     averageRating = json["average_rating"] is double
//         ? (json["average_rating"] as double).toInt()
//         : json["average_rating"] as int?;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["id"] = id;
//     _data["name"] = name;
//     _data["owner_id"] = ownerId;
//     _data["capacity"] = capacity;
//     _data["location"] = location;
//     _data["contact"] = contact;
//     _data["type"] = type;
//     if (events != null) {
//       _data["events"] = events;
//     }
//     _data["hall_image"] = hallImage;
//     if (images != null) {
//       _data["images"] = images;
//     }
//     _data["average_rating"] = averageRating;
//     return _data;
//   }
// }
