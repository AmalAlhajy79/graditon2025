import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:hall_gradition/core/consts/api_const.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../booking/data/models/booking-model.dart';
import '../../../../../../booking/data/models/mix-model-bokking-J-R.dart';
import '../../../../../../booking/presentation/controller/booking-controller.dart';
import '../../../../../../home-user/presentation/controller/home-user-controller.dart';
import '../../../data/data_source/services-both-Jo-Re-data-source.dart';
import '../../../data/models/services-both-Jo-Re-model.dart';


class BothJoysReHallController extends GetxController {
  //joys
  var isChecked_OpenBuffer_IWant = false.obs; // يستخدم Rx لتتبع حالة الـ checkbox

  var isChecked_Hospitality_TheHall = false.obs;
  var isChecked_Hospitality_External = false.obs;

  var isChecked_AradaBand_TheHall = false.obs;
  var isChecked_AradaBand_External = false.obs;

  var isChecked_TheCar_TheHall = false.obs;
  var isChecked_TheCar_External = false.obs;

  var isChecked_ChangeDacor_IWant = false.obs;

  var isChecked_Photography_TheHall = false.obs;
  var isChecked_Photography_External = false.obs;

  var isChecked_ProtectionForPhotography_IWant = false.obs;

  var isChecked_Promo_IWant = false.obs;

  //relieved
  var isChecked_Reader_External = false.obs;
  var isChecked_Reader_LoungeReader = false.obs;
  var isChecked_PhotographyRelieved_External = false.obs;
  var isChecked_PhotographyRelieved_HallPhotography = false.obs;

  final TextEditingController Write_occasion_Controller = TextEditingController();
  final TextEditingController Write_buffetSuggestion_Controller = TextEditingController();
  final TextEditingController additional_notes_Controller = TextEditingController();
  TextEditingController numberController = TextEditingController();



  //family song table
  var rows = <Map<String, String>>[].obs;

  void addRow() {
    rows.add({'name': '', 'song': ''});
  }

  void removeRow() {
    if (rows.isNotEmpty) {
      rows.removeLast();
    }
  }

  var showList = true.obs;
  var isJoysSelected = true.obs; // للتحكم في زر joys

  void showList1() {
    showList.value = true;
    isJoysSelected.value = true; // تعيين حالة زر joys
  }

  void showList2() {
    showList.value = false;
    isJoysSelected.value = false; // تعيين حالة زر relieved
  }

  //arada band joys
  var showListArada = true.obs;
  var isJoysAradaSelected = true.obs; // للتحكم في زر joys

  void showAradaList1() {
    showListArada.value = true;
    isJoysAradaSelected.value = true; // تعيين حالة زر joys
  }

  void showAradaList2() {
    showListArada.value = false;
    isJoysAradaSelected.value = false; // تعيين حالة زر relieved
  }

  BookingUserController bookingUserController=Get.put(BookingUserController());
  HomeUserController homeUserController=Get.put(HomeUserController());
  RxString selectedHospitalityDetail = ''.obs;//'coffee'.obs;

  // كود تجريبي لدمج حجز الافراح مع الاتراح

  Future<void> sendBookingUnified() async {
    final box = GetStorage();
    final token = box.read('api_token') ?? '';

    final url = Uri.parse(ApiConst.booking_user_hall);//"http://192.168.43.31:8001/api/Booking/bookings");
  //  const token = '1|EQidb3TsDuSHqdQIJQzLZTKC3AUoRkiMvOoIiLhLdc3f6fe7';

    UnifiedBooking booking = UnifiedBooking(
      hallId:homeUserController.hallId_pub,//'1' ,//hallId,
      eventDate: bookingUserController.event_date,//eventDate,
      from:bookingUserController.time_from,// from,
      to:bookingUserController.time_to, //to,
      guestCount:numberController.text, //guestCount,
      eventType:Write_occasion_Controller.text,// eventType,
      additionalNotes:additional_notes_Controller.text, //additionalNotes,

      buffetService: isChecked_OpenBuffer_IWant.value ? true : null,
      hospitalityService: isChecked_Hospitality_TheHall.value ? true : null,
      performanceService: isChecked_AradaBand_TheHall.value ? true : null,
      carService: isChecked_TheCar_TheHall.value ? true : null,
      decorationService: isChecked_ChangeDacor_IWant.value ? true : null,
      photographerService: isChecked_Photography_TheHall.value ? true : null,
      protectionService: isChecked_ProtectionForPhotography_IWant.value ? true : null,
      promoService: isChecked_Promo_IWant.value ? true : null,

      buffetDetails: Write_buffetSuggestion_Controller.text.isNotEmpty
          ? [Write_buffetSuggestion_Controller.text]
          : null,

      songs: rows.isNotEmpty
          ? rows.map((row) {
        return {
          "person_name": row['name'] ?? '',
          "song_name": row['song'] ?? '',
        };
      }).toList()
          : null,
    condolenceHospitalityDetail: selectedHospitalityDetail.value.isNotEmpty ? selectedHospitalityDetail.value:null,//'1',
    condolenceHospitalityServiceFromHall:'1',
    condolencePhotographerServiceFromHall:isChecked_PhotographyRelieved_HallPhotography.value? '1': null,
    readerServiceFromHall:isChecked_Reader_LoungeReader.value? '1':null,
    );

    try {
      final encodedBody = booking.toJson().entries
          .map((e) =>
      '${Uri.encodeQueryComponent(e.key)}=${Uri.encodeQueryComponent(e.value)}')
          .join('&');

      final response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: encodedBody,
      );

      final decoded = jsonDecode(response.body);
      final prettyJson = const JsonEncoder.withIndent('  ').convert(decoded);
      print("📦 Response JSON:\n$prettyJson");

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("✅ Booking submitted successfully");
      } else {
        print("❌ Failed to submit booking: ");
      }
    } catch (e) {
      print("❗ Error sending booking: $e");
    }
  }

//   View User Details Service :decor,promo,hospitality...


  var joysServices = <ViewUserDetailsServiceModel>[].obs;
  var condolencesServices = <ViewUserDetailsServiceModel>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  final ViewUserDetailsServiceDataSource _dataSource = ViewUserDetailsServiceDataSource();

  @override
  void onInit() {
    super.onInit();
    fetchServices();
  }

  void fetchServices() async {
    isLoading.value = true;
    try {
      var services = await _dataSource.fetchServices();
      joysServices.value = services['joys_services'] ?? [];
      condolencesServices.value = services['condolences_services'] ?? [];
    } catch (e) {
      errorMessage.value = "Failed to fetch services.";
    } finally {
      isLoading.value = false;
    }
  }

  List<String> getCondolenceHospitalityDescriptions() {
    return condolencesServices
        .where((service) => service.name == 'condolence_hospitality_services')
        .map<String>((service) => service.description?.toString() ?? '')
        .toList();
  }

}
