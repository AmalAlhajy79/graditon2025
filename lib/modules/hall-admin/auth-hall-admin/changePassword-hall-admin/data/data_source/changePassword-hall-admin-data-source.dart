
import 'dart:convert';

import '../../../../../../core/consts/api_const.dart';
import '../../../../../../core/network/network_helper.dart';
class ChangePasswordHallAdminDataSource{

  static Future<void> changePasswordAdminHall({
    required String new_password,
    required String confirm_password,

  })
  async{
    var response = await NetworkHelper().post( // or put  NetworkHelper().put()
        ApiConst.changePasswordAdmin_Hall,
        body: {
        //  'provider_id': provider_id,
          'name': new_password,
          'email': confirm_password,
        },
    );
    print("response changePassword : $response");
    // String token = response.data['token'];
    // await Stor
    // ageHandler().setToken(token);
  }



}