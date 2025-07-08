class Assistant {
  final int id;
  final String name;
  final String? photo;
  final String email;
  final String number;
  final String? photoUrl;

  Assistant({
    required this.id,
    required this.name,
    this.photo,
    required this.email,
    required this.number,
    this.photoUrl,
  });

  factory Assistant.fromJson(Map<String, dynamic> json) {
    return Assistant(
      id: json['id'],
      name: json['name'],
      photo: json['photo'],
      email: json['email'],
      number: json['number'],
      photoUrl: json['photo'],
    );
  }
}

class AssistantData {
  final int id;
  final int hallId;
  final int userId;
  // final String status;
  // final String createdAt;
  // final String updatedAt;
  final Assistant user;

  AssistantData({
    required this.id,
    required this.hallId,
    required this.userId,
    // required this.status,
    // required this.createdAt,
    // required this.updatedAt,
    required this.user,
  });

  factory AssistantData.fromJson(Map<String, dynamic> json) {
    return AssistantData(
      id: json['id'],
      hallId: json['hall_id'],
      userId: json['user_id'],
      // status: json['status'],
      // createdAt: json['created_at'],
      // updatedAt: json['updated_at'],
      user: Assistant.fromJson(json['user']),
    );
  }
}
