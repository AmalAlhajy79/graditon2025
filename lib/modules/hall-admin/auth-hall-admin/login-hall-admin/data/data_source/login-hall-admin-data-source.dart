
import 'dart:convert';

import '../../../../../../core/consts/api_const.dart';
import '../../../../../../core/network/network_helper.dart';

class LoginHallAdminDataSource{

  static Future<void> login_HallAdmin({
    required String email,
    required String password,
    // String? profile_image
  })
  async{
    var response = await NetworkHelper().put(
       ApiConst.loginHallAdmin,
        // body: {
        //   'email': email,
        //   'password': password,
        // },
        // files: {
        //   if(profile_image != null)
        //     'profile_image':profile_image
        // }
    );
print('.............response.........');
print(response.data.toString());
  }

  // static Future<void> destroy_provider_profile(int id)async{
  //   await NetworkHelper().delete(ApiConst.destroyproviderProfile(id),);
  // }


}
