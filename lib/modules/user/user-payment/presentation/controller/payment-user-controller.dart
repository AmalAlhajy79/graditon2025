import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:hall_gradition/core/consts/api_const.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentUserController extends GetxController {

  var showList = true.obs;
  var type_payment = 'Electronic payment'.obs;
  var isPaymentTypeSelected = true.obs; // للتحكم في زر joys

  void showElectronicPage() {
    showList.value = true;
    type_payment.value='Electronic payment';
    isPaymentTypeSelected.value = true; // تعيين حالة زر joys
  }

  void showCashPage() {
    showList.value = false;
    type_payment.value='Cash payment';
    isPaymentTypeSelected.value = false; // تعيين حالة زر relieved
  }

}