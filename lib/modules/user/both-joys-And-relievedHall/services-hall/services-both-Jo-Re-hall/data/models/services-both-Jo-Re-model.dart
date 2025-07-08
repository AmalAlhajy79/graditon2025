import 'dart:convert';

class ViewUserDetailsServiceModel{
  final int id;
  final int hallId;
  final String name;
  final String servicePrice;
  final String description;
  final bool isFixed;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<ImageItem> images;
  final VideoItem? video;

  ViewUserDetailsServiceModel({
    required this.id,
    required this.hallId,
    required this.name,
    required this.servicePrice,
    required this.description,
    required this.isFixed,
     this.createdAt,
     this.updatedAt,
    required this.images,
    this.video,
  });

  factory ViewUserDetailsServiceModel.fromJson(Map<String, dynamic> json) {
    var imageList = (json['images'] as List).map((e) => ImageItem.fromJson(e)).toList();
    var videoItem = json['video'] != null ? VideoItem.fromJson(json['video']) : null;

    return ViewUserDetailsServiceModel(
      id: json['id'],
      hallId: json['hall_id'],
      name: json['name'],
      servicePrice: json['service_price'],
      description: json['description'],
      isFixed: json['is_fixed'] == 1,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      images: imageList,
      video: videoItem,
    );
  }
}

class ImageItem {
  final int id;
  final int serviceToHallId;
  final String imagePath;

  ImageItem({
    required this.id,
    required this.serviceToHallId,
    required this.imagePath,
  });

  factory ImageItem.fromJson(Map<String, dynamic> json) {
    return ImageItem(
      id: json['id'],
      serviceToHallId: json['servicetohall_id'],
      imagePath: json['image_path'],
    );
  }
}

class VideoItem {
  final int id;
  final int serviceToHallId;
  final String videoPath;

  VideoItem({
    required this.id,
    required this.serviceToHallId,
    required this.videoPath,
  });

  factory VideoItem.fromJson(Map<String, dynamic> json) {
    return VideoItem(
      id: json['id'],
      serviceToHallId: json['servicetohall_id'],
      videoPath: json['video_path'],
    );
  }
}
