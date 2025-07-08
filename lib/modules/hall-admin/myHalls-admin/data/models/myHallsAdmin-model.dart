class MyHallSHallAdminModel {
  int id=0;
  String name='';
  int ownerId=0;
  int capacity=0;
  String location='';
  String contact='';
  String type='';
  List<String> events=[];
  late final hallImage;
  List<String> images=[];

  MyHallSHallAdminModel(
      {required this.id,
        required this.name,
        required this.ownerId,
        required this.capacity,
        required this.location,
        required this.contact,
        required this.type,
        required this.events,
        required this.hallImage,
        required this.images});

  MyHallSHallAdminModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    ownerId = json['owner_id'];
    capacity = json['capacity'];
    location = json['location'];
    contact = json['contact'];
    type = json['type'];
    events = json['events'].cast<String>();
    hallImage = json['hall_image'];
    images = json['images'].cast<String>();
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
