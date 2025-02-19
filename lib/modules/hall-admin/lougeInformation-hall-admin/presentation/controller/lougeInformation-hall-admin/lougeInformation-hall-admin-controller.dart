import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../core/data_state/data_state.dart';
import '../../../../../../core/handler/handler.dart';
import '../../../data/data_source/lougeInformation-hall-admin-data-source.dart';

class LougeInformationHallAdminController extends GetxController {

  final TextEditingController hallName_Controller = TextEditingController();
  final TextEditingController hallPlaceController = TextEditingController();
  final TextEditingController hallCapacityController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();
  final TextEditingController loungeTypeController = TextEditingController();

  String? _path;

  void setPath(String? newPath) {
    _path = newPath;

  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  DataState<void> _dataState = DataState<void>();

  DataStatus get status => _dataState.status;

  void lougeInformationHall_Admin() async {
    _dataState = await handle<void>(
            () =>
            lougeInformationHallAdminDataSource.lougeInformationHallAdmin(
               // provider_id:1, //user_id_Controller.hashCode,
                hallName:hallName_Controller.text,
                hallPlace: hallPlaceController.text,
                hallCapacity:hallCapacityController.text,
                contactNumber:contactNumberController.text,
                loungeType:loungeTypeController.text,
                profile_image: _path
            ));

    if(status == DataStatus.error){

    print('.............error..........');

    }
    else{
      print("True .... ...");

    }
  }

  @override
  void dispose() {
    hallName_Controller.dispose();
    hallCapacityController.dispose();
    hallPlaceController.dispose();
    contactNumberController.dispose();
    loungeTypeController.dispose();
    super.dispose();
  }

}