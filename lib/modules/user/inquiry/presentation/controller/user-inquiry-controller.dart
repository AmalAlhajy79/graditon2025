import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/data_state/data_state.dart';
import '../../../../../core/handler/handler.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../home-user/presentation/controller/home-user-controller.dart';
import '../../data/data_source/user-inquirys-datasource.dart';
import '../../data/models/user-view-inquiry-models.dart';

//true code now
class ChatUserController extends GetxController {
  // send inquiry
  final TextEditingController message_Controller = TextEditingController();
  // final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DataState<void> _dataState = DataState<void>();
  DataStatus get status => _dataState.status;
   var isUserMessage= true.obs ;

  HomeUserController homeUserController=Get.put(HomeUserController());

  void sendUserInquiry() async {
    isUserMessage.value=true;
    await handle<void>(
            () =>
                UserInquirysDataSource.sendUserInquirys(
                    hallId:homeUserController.hallId_pub,// 1,
                    message: message_Controller.text));
    print("............");
  }

  // view response
  var inquiries = <Conversation>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchInquiries();
  }

  // جلب البيانات من الـ API
  void fetchInquiries() async {
    try {
      isLoading.value = true;
      List<ViewQuiryRespModel> data = await UserInquirysDataSource.fetchInquiries(homeUserController.hallId_pub,);

      // دمج جميع المحادثات في قائمة واحدة
      List<Conversation> allConversations = [];
      for (var inquiry in data) {
        allConversations.addAll(inquiry.conversation);
      }

      // ترتيب المحادثات حسب وقت الإرسال من الأقدم إلى الأحدث
      allConversations.sort((a, b) => DateTime.parse(a.createdAt).compareTo(DateTime.parse(b.createdAt)));

      inquiries.assignAll(allConversations);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
  String formatDateTime(DateTime dateTime) {
    // تنسيق الوقت ليظهر بشكل مناسب
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} - ${dateTime.hour}:${dateTime.minute}';
  }

  final String whatsappNumber = "+963 982494329"; // استبدل هذا برقم واتساب الخاص بك
  final String telegramUsername = "Memosy5"; // استبدل هذا باسم المستخدم الخاص بك في تلغرام

  // دالة لفتح واتساب
  void launchWhatsApp() async {
    final url = "https://wa.me/$whatsappNumber";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // دالة لفتح تلغرام
  void launchTelegram() async {
    final url = "https://t.me/$telegramUsername";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void dispose() {
    message_Controller.dispose();
    super.dispose();
  }
}