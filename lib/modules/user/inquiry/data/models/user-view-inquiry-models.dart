class ViewQuiryRespModel {
  final List<Conversation> conversation;

  ViewQuiryRespModel({required this.conversation});

  ViewQuiryRespModel.fromJson(Map<String, dynamic> json)
      : conversation = (json['conversation'] as List)
      .map((v) => Conversation.fromJson(v))
      .toList();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['conversation'] = conversation.map((v) => v.toJson()).toList();
    return data;
  }
}

class Conversation {
  String type;
  String message;
  String createdAt;

  Conversation({required this.type, required this.message, required this.createdAt});

  Conversation.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        message = json['message'],
        createdAt = json['created_at'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['type'] = type;
    data['message'] = message;
    data['created_at'] = createdAt;
    return data;
  }
}
