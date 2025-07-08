
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hall_gradition/modules/hall-admin/home-hall-admin/presentation/screens/home-hall-admin-screen.dart';

import '../../../../../../core/consts/api_const.dart';
import '../../../../../../core/network/network_helper.dart';
import '../../../../myHalls-admin/presentation/screens/myHallsAdmin-screen.dart';

class LoginHallAdminDataSource{

  static Future<void> login_HallAdmin({
    required String email,
    required String password,
    // String? profile_image
  })
  async{
    var response = await NetworkHelper().post(
       ApiConst.loginHallAdmin,
        body: {
          'email': email,
          'password': password,
        },
    );
    if(response.statusCode==200 || response.statusCode==201) {
      print('.............response.........');
      print(response.data.toString());
      Get.toNamed(MyHallsAdminScreen.name);
    }
  }

  // static Future<void> destroy_provider_profile(int id)async{
  //   await NetworkHelper().delete(ApiConst.destroyproviderProfile(id),);
  // }


}
