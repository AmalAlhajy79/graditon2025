
class ServiceModel {
  final int id;
  final String type;
  final String from;
  final String to;

  ServiceModel({
    required this.id,
    required this.type,
    required this.from,
    required this.to,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'],
      type: json['type'],
      from: json['from'],
      to: json['to'],
    );
  }
}
// import 'dart:convert';
//
// class Service {
//   final int id;
//   final String type;
//   final String from;
//   final String to;
//   final int hallId;
//   final String createdAt;
//   final String updatedAt;
//
//   Service({
//     required this.id,
//     required this.type,
//     required this.from,
//     required this.to,
//     required this.hallId,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   factory Service.fromJson(Map<String, dynamic> json) {
//     return Service(
//       id: json['id'],
//       type: json['type'],
//       from: json['from'],
//       to: json['to'],
//       hallId: json['hall_id'],
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//     );
//   }
//
//   static List<Service> fromJsonList(List<dynamic> jsonList) {
//     return jsonList.map((json) => Service.fromJson(json)).toList();
//   }
// }
//
// class ServiceResponse {
//   final String message;
//   final List<Service> service;
//
//   ServiceResponse({
//     required this.message,
//     required this.service,
//   });
//
//   factory ServiceResponse.fromJson(Map<String, dynamic> json) {
//     return ServiceResponse(
//       message: json['message'],
//       service: Service.fromJsonList(json['service']),
//     );
//   }
// }
