
import 'dart:convert';

import '../../../../../../core/consts/api_const.dart';
import '../../../../../../core/network/network_helper.dart';
class EditProfileHallAdminDataSource{

  static Future<void> EditProfileAdminHall({
    required String Full_name,
    required String email,
    required int number,

  })
  async{
    var response = await NetworkHelper().post( // or put  NetworkHelper().put()
        ApiConst.EditProfileAdmin_Hall,
        body: {
        //  'provider_id': provider_id,
          'name': Full_name,
          'email': email,
          'number':number
        },
    );
    print("response EditProfileHallAdmin : $response");
    // String token = response.data['token'];
    // await Stor
    // ageHandler().setToken(token);
  }



}