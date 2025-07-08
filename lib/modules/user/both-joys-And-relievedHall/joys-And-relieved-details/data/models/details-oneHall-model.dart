class ViewDetailsOneHallModel {
  int? id;
  String? name;
  int? ownerId;
  int? capacity;
  String? location;
  String? contact;
  String? type;
  List<String>? events;
  String? hallImage;
  List<String>? images;

  ViewDetailsOneHallModel({
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
  });

  ViewDetailsOneHallModel.fromJson(Map<String, dynamic> json) {
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
        : List<String>.from(json["images"].map((img) => img["image_path"]));
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
    if (events != null) {
      _data["events"] = events;
    }
    _data["hall_image"] = hallImage;
    if (images != null) {
      _data["images"] = images;
    }
    return _data;
  }
}


class EventImage {
  final int id;
  final String imagePath;
  final String eventType;

  EventImage({
    required this.id,
    required this.imagePath,
    required this.eventType,
  });

  factory EventImage.fromJson(Map<String, dynamic> json) {
    return EventImage(
      id: json['id'],
      imagePath: json['image_path'],
      eventType: json['event_type'],
    );
  }
}
class EventVideo {
  final int id;
  final String videoPath;
  final String eventType;

  EventVideo({
    required this.id,
    required this.videoPath,
    required this.eventType,
  });

  factory EventVideo.fromJson(Map<String, dynamic> json) {
    return EventVideo(
      id: json['id'],
      videoPath: json['video_path'],
      eventType: json['event_type'],
    );
  }
}
