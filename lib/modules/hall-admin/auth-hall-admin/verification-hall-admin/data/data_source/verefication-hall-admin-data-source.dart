
import 'dart:convert';

import '../../../../../../core/consts/api_const.dart';
import '../../../../../../core/network/network_helper.dart';
class vereficationHallAdminDataSource{

  static Future<void> vereficationAdminHall({
    required String new_password,
    required String confirm_password,

  })
  async{
    var response = await NetworkHelper().post( // or put  NetworkHelper().put()
        ApiConst.vereficationAdmin_Hall,
        body: {
        //  'provider_id': provider_id,
          'name': new_password,
          'email': confirm_password,
        },
    );
    print("response vereficationHallAdmin : $response");
    // String token = response.data['token'];
    // await Stor
    // ageHandler().setToken(token);
  }



}