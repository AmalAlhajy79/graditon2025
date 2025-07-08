class UserMyBookingModel {
  int id;
  int userId;
  int hallId;
  String eventDate;
  String from;
  String to;
  int guestCount;
  String eventType;
  String status;
  bool paymentConfirmed;
  String additionalNotes;
  String? condolenceAdditionalNotes;
  String createdAt;
  String updatedAt;
  Hall? hall;
  Payment? payment;
  List<Services> services = [];
  List<Songs> songs = [];

  UserMyBookingModel({
    required this.id,
    required this.userId,
    required this.hallId,
    required this.eventDate,
    required this.from,
    required this.to,
    required this.guestCount,
    required this.eventType,
    required this.status,
    required this.paymentConfirmed,
    required this.additionalNotes,
    this.condolenceAdditionalNotes,
    required this.createdAt,
    required this.updatedAt,
    this.hall,
    this.payment,
    required this.services,
    required this.songs,
  });

  factory UserMyBookingModel.fromJson(Map<String, dynamic> json) {
    return UserMyBookingModel(
      id: json['id'],
      userId: json['user_id'],
      hallId: json['hall_id'],
      eventDate: json['event_date'],
      from: json['from'],
      to: json['to'],
      guestCount: json['guest_count'],
      eventType: json['event_type'],
      status: json['status'],
      paymentConfirmed: json['payment_confirmed'],
      additionalNotes: json['additional_notes'],
      condolenceAdditionalNotes: json['condolence_additional_notes'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      hall: json['hall'] != null ? Hall.fromJson(json['hall']) : null,
      payment: json['user-payment'] != null ? Payment.fromJson(json['user-payment']) : null,
      services: json['services'] != null
          ? List<Services>.from(json['services'].map((v) => Services.fromJson(v)))
          : [],
      songs: json['songs'] != null
          ? List<Songs>.from(json['songs'].map((v) => Songs.fromJson(v)))
          : [],
    );
  }
}


class Hall {
  int id;
  String hallImage;
  String name;
  int ownerId;
  String location;
  int capacity;
  String contact;
  String type;
  List<String> events;
  String? payMethods; // بدل Null
  String status;
  String rate;
  String createdAt;
  String updatedAt;

  Hall({
    required this.id,
    required this.hallImage,
    required this.name,
    required this.ownerId,
    required this.location,
    required this.capacity,
    required this.contact,
    required this.type,
    required this.events,
    this.payMethods,
    required this.status,
    required this.rate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Hall.fromJson(Map<String, dynamic> json) {
    return Hall(
      id: json['id'] ?? 0,
      hallImage: json['hall_image'] ?? '',
      name: json['name'] ?? '',
      ownerId: json['owner_id'] ?? 0,
      location: json['location'] ?? '',
      capacity: json['capacity'] ?? 0,
      contact: json['contact'] ?? '',
      type: json['type'] ?? '',
      events: (json['events'] != null)
          ? List<String>.from(json['events'].map((e) => e.toString()))
          : [],
      payMethods: json['pay_methods']?.toString(),
      status: json['status'] ?? '',
      rate: json['rate'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}


class Payment {
  int id;
  int userId;
  int bookingId;
  String amount;
  String status;
  String createdAt;
  String updatedAt;

  Payment({
    required this.id,
    required this.userId,
    required this.bookingId,
    required this.amount,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      bookingId: json['booking_id'] ?? 0,
      amount: json['amount'] ?? '',
      status: json['status'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}

class Services {
  int id;
  int bookingId;
  String serviceType;
  int fromHall;
  String details;
  String createdAt;
  String updatedAt;

  Services({
    required this.id,
    required this.bookingId,
    required this.serviceType,
    required this.fromHall,
    required this.details,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Services.fromJson(Map<String, dynamic> json) {
    return Services(
      id: json['id'] ?? 0,
      bookingId: json['booking_id'] ?? 0,
      serviceType: json['service_type'] ?? '',
      fromHall: json['from_hall'] ?? 0,
      details: json['details'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}

class Songs {
  int id;
  int bookingId;
  String personName;
  String songName;
  String createdAt;
  String updatedAt;

  Songs({
    required this.id,
    required this.bookingId,
    required this.personName,
    required this.songName,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Songs.fromJson(Map<String, dynamic> json) {
    return Songs(
      id: json['id'] ?? 0,
      bookingId: json['booking_id'] ?? 0,
      personName: json['person_name'] ?? '',
      songName: json['song_name'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}

