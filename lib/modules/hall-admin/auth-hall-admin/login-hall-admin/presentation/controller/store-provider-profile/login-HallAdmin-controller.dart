import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../core/data_state/data_state.dart';
import '../../../../../../../core/handler/handler.dart';
import '../../../data/data_source/login-hall-admin-data-source.dart';


class LoginHallAdminController extends GetxController {

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  var isPasswordVisible = false.obs; // متغير مراقب باستخدام GetX

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value; // تبديل الحالة
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  DataState<void> _dataState = DataState<void>();

  DataStatus get status => _dataState.status;

  void loginHallAdmin() async {
     await handle<void>(
            () =>
                LoginHallAdminDataSource.login_HallAdmin(
                  email: emailController.text,
                password:passwordController.text,
            ));

    // Get.back();
    // if(status == DataStatus.error){
    //
    // print('.............error..........');
    //
    // }
    // else{
    //   print("True .....");
    // }
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

}