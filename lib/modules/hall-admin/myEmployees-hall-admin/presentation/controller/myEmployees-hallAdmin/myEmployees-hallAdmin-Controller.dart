import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../core/data_state/data_state.dart';
import '../../../../../../../core/handler/handler.dart';
import '../../../data/data_source/myEmployees-hall-admin-data-source.dart';

class MyEmployeesHallAdminController extends GetxController {

  String? _path;

  void setPath(String? newPath) {
    _path = newPath;

  }
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DataState<void> _dataState = DataState<void>();
  DataStatus get status => _dataState.status;

  void NotificationAdmin() async {
    _dataState = await handle<void>(
            () =>
                MyEmployeesHallAdminDataSource.myEmployeesAdminHall(name: '',hours: "",photo: ""));
    print("....... status after function NotificationAdminHall().......");
    print(status);

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
    super.dispose();
  }

}