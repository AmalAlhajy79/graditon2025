import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../core/data_state/data_state.dart';
import '../../../../../../../core/handler/handler.dart';
import '../../../data/data_source/editProfile-hall-admin-data-source.dart';

class EditProfileHallAdminController extends GetxController {

  final TextEditingController Full_name_Controller = TextEditingController();
  final TextEditingController email_Controller = TextEditingController();
  final TextEditingController number_Controller = TextEditingController();

  String? _path;

  void setPath(String? newPath) {
    _path = newPath;

  }
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DataState<void> _dataState = DataState<void>();
  DataStatus get status => _dataState.status;

  void EditProfile() async {
    _dataState = await handle<void>(
            () =>
                EditProfileHallAdminDataSource.EditProfileAdminHall(
               // provider_id:1, //user_id_Controller.hashCode,
                Full_name:Full_name_Controller.text,
                email:  email_Controller.text,
                  number: number_Controller.hashCode
            ));
    print("....... status after function EditProfileAdminHall().......");
    print(status);
    print('.............success..........');
    // Get.toNamed(ProviderProfile.name);

    // Get.back();
    if(status == DataStatus.error){
    print('.............error..........');
    }
    else{
      print("True .... ....");
    }
  }
  @override
  void dispose() {
    Full_name_Controller.dispose();
    email_Controller.dispose();
    number_Controller.dispose();
    super.dispose();
  }

}