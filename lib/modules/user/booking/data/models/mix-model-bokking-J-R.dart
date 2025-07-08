class UnifiedBooking {
  // الحقول الأساسية المطلوبة
  final String hallId;
  final String eventDate;
  final String from;
  final String to;
  final String guestCount;
  final String eventType;
  final String additionalNotes;

  // خدمات إضافية - اختياري
  final bool? buffetService;
  final bool? hospitalityService;
  final bool? performanceService;
  final bool? carService;
  final bool? decorationService;
  final bool? photographerService;
  final bool? protectionService;
  final bool? promoService;

  // التفاصيل الاختيارية
  final List<String>? buffetDetails;
  final List<Map<String, String>>? songs;

  // خدمات عزاء اختيارية
  final String? readerServiceFromHall;
  final String? condolencePhotographerServiceFromHall;
  final String? condolenceHospitalityServiceFromHall;
  final String? condolenceHospitalityDetail;

  UnifiedBooking({
    required this.hallId,
    required this.eventDate,
    required this.from,
    required this.to,
    required this.guestCount,
    required this.eventType,
    required this.additionalNotes,
    this.buffetService,
    this.hospitalityService,
    this.performanceService,
    this.carService,
    this.decorationService,
    this.photographerService,
    this.protectionService,
    this.promoService,
    this.buffetDetails,
    this.songs,
    this.readerServiceFromHall,
    this.condolencePhotographerServiceFromHall,
    this.condolenceHospitalityServiceFromHall,
    this.condolenceHospitalityDetail,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      "hall_id": hallId,
      "event_date": eventDate,
      "from": from,
      "to": to,
      "guest_count": guestCount,
      "event_type": eventType,
      "additional_notes": additionalNotes,
    };

    // خدمات حفلات
    if (buffetService != null)
      data["buffet_service[from_hall]"] = buffetService! ? "1" : "0";
    if (hospitalityService != null)
      data["hospitality_services[from_hall]"] = hospitalityService! ? "1" : "0";
    if (performanceService != null)
      data["performance_service[from_hall]"] = performanceService! ? "1" : "0";
    if (carService != null)
      data["car_service[from_hall]"] = carService! ? "1" : "0";
    if (decorationService != null)
      data["decoration_service[from_hall]"] = decorationService! ? "1" : "0";
    if (photographerService != null)
      data["photographer_service[from_hall]"] = photographerService! ? "1" : "0";
    if (protectionService != null)
      data["protection_service[from_hall]"] = protectionService! ? "1" : "0";
    if (promoService != null)
      data["promo_service[from_hall]"] = promoService! ? "1" : "0";

    // التفاصيل الاختيارية
    if (buffetDetails != null) {
      for (int i = 0; i < buffetDetails!.length; i++) {
        data["buffet_service[details][$i]"] = buffetDetails![i];
      }
    }

    if (songs != null) {
      for (int i = 0; i < songs!.length; i++) {
        data["songs[$i][person_name]"] = songs![i]["person_name"]!;
        data["songs[$i][song_name]"] = songs![i]["song_name"]!;
      }
    }

    // خدمات عزاء
    if (readerServiceFromHall != null)
      data["reader_service[from_hall]"] = readerServiceFromHall;
    if (condolencePhotographerServiceFromHall != null)
      data["condolence_photographer_service[from_hall]"] = condolencePhotographerServiceFromHall;
    if (condolenceHospitalityServiceFromHall != null)
      data["condolence_hospitality_services[from_hall]"] = condolenceHospitalityServiceFromHall;
    if (condolenceHospitalityDetail != null)
      data["condolence_hospitality_services[details][0]"] = condolenceHospitalityDetail;

    return data;
  }
}
