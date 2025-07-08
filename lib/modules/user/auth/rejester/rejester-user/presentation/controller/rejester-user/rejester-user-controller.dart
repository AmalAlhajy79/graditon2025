import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hall_gradition/core/consts/api_const.dart';
import 'package:hall_gradition/modules/hall-admin/myHalls-admin/presentation/screens/myHallsAdmin-screen.dart';
import 'package:hall_gradition/modules/user/home-user/presentation/screens/homeScreen-user.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;


class RejesterUserControllerrr extends GetxController {
  var isLoading = false.obs;
  List<XFile> selectedImages = [];
  // داخل HallController
  final formKey = GlobalKey<FormState>();

  final NameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfController = TextEditingController();
  final locationController = TextEditingController();
  final numberController = TextEditingController();
  var isPasswordVisible = false.obs; // متغير مراقب باستخدام GetX

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value; // تبديل الحالة
  }

  var hallImage = ''.obs;
  var imagePaths = <String>[].obs;

  var selectedRole = ''.obs;
  String userName='';
  String userPhoto='';
  String userToken='';
  String userPhone='';
  String userRole='';
  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      hallImage.value = picked.path;
    }
  }


  void rejester_user() async {
    if (!formKey.currentState!.validate()) return;

    if (hallImage.value.isEmpty) {
      Get.snackbar("خطأ", "يرجى اختيار صورة للقاعة");
      return;
    }


    await uploadDataWithImage(
      hallImage.value,
    );
  }



  Future<void> uploadDataWithImage(String hallImagePath) async {
    isLoading.value = true;

    var request = http.MultipartRequest(
      'POST',
      Uri.parse(ApiConst.register),
    );
    request.headers['Accept'] =
    'application/json';


    // صورة رئيسية
    request.files.add(
        await http.MultipartFile.fromPath('photo', hallImagePath));


    print(NameController.text);
    print(emailController.text);
    print(passwordController.text);
    print(passwordConfController.text);
    print(locationController.text);
    print(numberController.text);
    print(hallImage.value);
    print(selectedRole);
    // البيانات المرسلة
    request.fields.addAll({
      'name': NameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'password_confirmation': passwordConfController.text,
      'location': locationController.text,
      'number':numberController.text,
      'role':selectedRole.value
    });

    // إرسال الطلب
    var response = await request.send();
    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseBody = await response.stream.bytesToString();
      final data = json.decode(responseBody);

      // استخراج التوكين
      final String apiToken = data['user']['api_token'];
      print('Token: $apiToken');
      final String user_role=data['user']['role'];
      final String user_name = data['user']['name'];
      final String userPhone =data['user']['number'];
      print('username: $user_name');
      print('role: $user_role');
      // تخزين التوكين باستخدام GetStorage
      final box = GetStorage();
      box.write('api_token', apiToken);
      box.write('username', user_name);
      box.write('number', userPhone);
      box.write('role', user_role);
      print('userPhone: $userPhone');

      if(data['user']['photo']!=null){
        final String user_photo = data['user']['photo'];

        box.write('userphoto', user_photo);
        userPhoto=box.read('userphoto');
        userRole=box.read('role');
        print('userphoto: $userPhoto');
      }





      //قراءة البيانات
      userName=box.read('username');
      userToken=box.read('api_token');

      print("true ....succese register...........");
      Get.snackbar('نجاح', 'تم رفع البيانات بنجاح');
      if(selectedRole.value=='client')
        Get.toNamed(HomeUserScreen.name);
      else if(selectedRole.value=='assistant')
        print('assistant role');
        //Get.toNamed(HomeUserScreen.name);
      else if(selectedRole.value=='owner')
        Get.toNamed(MyHallsAdminScreen.name);
      else
        print('carSer role');
        //Get.toNamed(HomeUserScreen.name);

    } else {
      print("error...in register.....");
      Get.snackbar('خطأ', 'فشل في رفع البيانات');
    }

  }
  // Dropdown lounge type
  var selectedValues = <String>{}.obs;

  void toggleValue(String value) {
    if (selectedValues.contains(value)) {
      selectedValues.remove(value);
    } else {
      selectedValues.add(value);
      selectedRole.value = value;
    }
  }

  bool isSelected(String value) {
    return selectedValues.contains(value);
  }

  bool hasSelectedValues() {
    return selectedValues.isNotEmpty;
  }



}
