// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
//
// class RelievedHallServicesController extends GetxController {
//   var isChecked_OpenBuffer_IWant = false.obs; // يستخدم Rx لتتبع حالة الـ checkbox
//   var isChecked_Hospitality_TheHall = false.obs;
//   var isChecked_Hospitality_External = false.obs;
//   var isChecked_AradaBand_TheHall = false.obs;
//   var isChecked_AradaBand_External = false.obs;
//   var isChecked_TheCar_TheHall = false.obs;
//   var isChecked_TheCar_External = false.obs;
//   var isChecked_ChangeDacor_IWant = false.obs;
//   var isChecked_Photography_TheHall = false.obs;
//   var isChecked_Photography_External = false.obs;
//   var isChecked_ProtectionForPhotography_IWant = false.obs;
//   var isChecked_Promo_IWant = false.obs;
//
//   //family song table
//   var rows = <Map<String, String>>[].obs;
//
//   void addRow() {
//     rows.add({'name': '', 'song': ''});
//   }
//
//   void removeRow() {
//     if (rows.isNotEmpty) {
//       rows.removeLast();
//     }
//   }
// }