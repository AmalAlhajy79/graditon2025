import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../core/data_state/data_state.dart';
import '../../../../../../../core/handler/handler.dart';
import '../../../data/data_source/login-hall-admin-data-source.dart';


class LoginHallAdminController extends GetxController {

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  String? _path;

  void setPath(String? newPath) {
    _path = newPath;

  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  DataState<void> _dataState = DataState<void>();

  DataStatus get status => _dataState.status;

  void storProfProvider() async {
    // print("....... status 1 in screen store profile .......");
    // print(status);
    // if (!formKey.currentState!.validate())
    //   return;
    // _dataState = const DataState(status: DataStatus.loading);
    // print('.............loading..........');
    // showLoader();
    // print("....... status 2 in screen store profile .......");
    // print(status);
    // print(".... _path value of picture .......");
    // print(_path);
    _dataState = await handle<void>(
            () =>
                LoginHallAdminDataSource.login_HallAdmin(
               // provider_id:1, //user_id_Controller.hashCode,
                  email: emailController.text,
                password:passwordController.text,
            ));

    // Get.back();
    if(status == DataStatus.error){
    //   print("....... status 4 in screen store profile .......");
    //   print(status);
    // showSnackBar(_dataState.message);
    print('.............error..........');

    }
    else{
      print("True .....");

    }
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

}