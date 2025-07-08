class Hall {
  final int id;
  final String name;
  final int ownerId;
  final int capacity;
  final String location;
  final String contact;
  final String type;
  final List<String> events;
  final String hallImage;
  final List<String> images;

  Hall({
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'owner_id': ownerId,
      'capacity': capacity,
      'location': location,
      'contact': contact,
      'type': type,
      'events': events,
      'hall_image': hallImage,
      'images': images,
    };
  }
}
