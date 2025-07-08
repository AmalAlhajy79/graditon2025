//
// class Booking {
//   String hallId;
//   String eventDate;
//   String from;
//   String to;
//   String guestCount;
//   String eventType;
//   String additionalNotes;
//   List<String> buffetDetails;
//   List<Map<String, String>> songs;
//
//   // الخدمات الإضافية - النوع bool
//   bool buffetService;
//   bool hospitalityService;
//   bool performanceService;
//   bool carService;
//   bool decorationService;
//   bool photographerService;
//   bool protectionService;
//   bool promoService;
//
//   Booking({
//     required this.hallId,
//     required this.eventDate,
//     required this.from,
//     required this.to,
//     required this.guestCount,
//     required this.eventType,
//     required this.additionalNotes,
//     required this.buffetDetails,
//     required this.songs,
//     this.buffetService = true,
//     this.hospitalityService = true,
//     this.performanceService = true,
//     this.carService = true,
//     this.decorationService = true,
//     this.photographerService = true,
//     this.protectionService = true,
//     this.promoService = true,
//   });
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {
//       "hall_id": hallId,
//       "event_date": eventDate,
//       "from": from,
//       "to": to,
//       "guest_count": guestCount,
//       "event_type": eventType,
//       "additional_notes": additionalNotes,
//       "buffet_service[from_hall]": buffetService ? "1" : "0",
//       "hospitality_services[from_hall]": hospitalityService ? "1" : "0",
//       "performance_service[from_hall]": performanceService ? "1" : "0",
//       "car_service[from_hall]": carService ? "1" : "0",
//       "decoration_service[from_hall]": decorationService ? "1" : "0",
//       "photographer_service[from_hall]": photographerService ? "1" : "0",
//       "protection_service[from_hall]": protectionService ? "1" : "0",
//       "promo_service[from_hall]": promoService ? "1" : "0",
//     };
//
//     for (int i = 0; i < buffetDetails.length; i++) {
//       data["buffet_service[details][$i]"] = buffetDetails[i];
//     }
//
//     for (int i = 0; i < songs.length; i++) {
//       data["songs[$i][person_name]"] = songs[i]["person_name"]!;
//       data["songs[$i][song_name]"] = songs[i]["song_name"]!;
//     }
//
//     return data;
//   }
// }
