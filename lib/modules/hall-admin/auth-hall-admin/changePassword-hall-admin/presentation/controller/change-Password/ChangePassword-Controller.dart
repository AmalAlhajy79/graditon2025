import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../core/data_state/data_state.dart';
import '../../../../../../../core/handler/handler.dart';
import '../../../data/data_source/changePassword-hall-admin-data-source.dart';

class ChangePasswordAdminHallController extends GetxController {

  final TextEditingController newPassword_Controller = TextEditingController();
  final TextEditingController confirmPassword_Controller = TextEditingController();
  var isPasswordVisible = false.obs; // متغير مراقب باستخدام GetX

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value; // تبديل الحالة
  }

  String? _path;

  void setPath(String? newPath) {
    _path = newPath;

  }
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DataState<void> _dataState = DataState<void>();
  DataStatus get status => _dataState.status;

  void ChangePassword() async {
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
                ChangePasswordHallAdminDataSource.changePasswordAdminHall(
               // provider_id:1, //user_id_Controller.hashCode,
                new_password:newPassword_Controller.text,
                confirm_password: confirmPassword_Controller.text,
            ));
    print("....... status after function changePasswordAdminHall().......");
    print(status);
    print('.............success..........');
    // Get.toNamed(ProviderProfile.name);

    // Get.back();
    if(status == DataStatus.error){
      print("....... status 4 in screen changePassword .......");
      print(status);
     // showSnackBar(_dataState.message);
    print('.............error..........');
    }
    else{
      print("True .... ....");
    }
  }
  @override
  void dispose() {
    newPassword_Controller.dispose();
    confirmPassword_Controller.dispose();
    super.dispose();
  }

}