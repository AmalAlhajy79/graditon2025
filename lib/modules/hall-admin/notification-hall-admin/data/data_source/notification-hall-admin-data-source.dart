
import 'dart:convert';

import '../../../../../../core/consts/api_const.dart';
import '../../../../../../core/network/network_helper.dart';
class NotificationHallAdminDataSource{

  static Future<void> notificationAdminHall({
    required String name,
    required String hours,
    required String photo,

  })
  async{
    // var response = await NetworkHelper().post( // or put  NetworkHelper().put()
    //     ApiConst.notificationAdmin_Hall,
    //     body: {
    //     //  'provider_id': provider_id,
    //       'name': Full_name,
    //       'email': email,
    //       'number':number
    //     },
   // );
   // print("response EditProfileHallAdmin : $response");
    // String token = response.data['token'];
    // await Stor
    // ageHandler().setToken(token);
  }



}