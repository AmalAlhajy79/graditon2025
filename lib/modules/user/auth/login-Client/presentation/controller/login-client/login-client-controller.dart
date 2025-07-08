import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../core/data_state/data_state.dart';
import '../../../../../../../core/handler/handler.dart';
import '../../../data/data_source/login-Client-data-source.dart';


class LoginClientController extends GetxController {

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  var isPasswordVisible = false.obs; // متغير مراقب باستخدام GetX

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value; // تبديل الحالة
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  DataState<void> _dataState = DataState<void>();

  DataStatus get status => _dataState.status;

  void loginClient() async {
     await handle<void>(
            () =>
                LoginHallAdminDataSource.login_User(
                  email: emailController.text,
                password:passwordController.text,
            ));


  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

}