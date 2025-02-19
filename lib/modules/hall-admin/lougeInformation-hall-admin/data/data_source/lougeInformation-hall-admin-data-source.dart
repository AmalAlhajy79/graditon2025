
import 'dart:convert';

import '../../../../../../core/consts/api_const.dart';
import '../../../../../../core/network/network_helper.dart';

class lougeInformationHallAdminDataSource{

  static Future<void> lougeInformationHallAdmin({
    required String hallName,
    required String hallPlace,
    required String hallCapacity,
    required String contactNumber,
    required String loungeType,
     String? profile_image,
     // String? profile_image
  })
  async{
    // print(hallName);
    // print(hallPlace);
    // print(hallCapacity);
    // print(contactNumber);
    // print(loungeType);
    // print(profile_image);
    var response = await NetworkHelper().put(
       ApiConst.loungeInformationHallAdmin,
        // body: {
        //   'name': name,
        //   'email': email,
        //   'address': address,
        //   'phone_number': phone_number
        // },
        files: {
          if(profile_image != null)
            'profile_image':profile_image
        }
    );
print('.............response.........');
print(response.data.toString());
  }

  // static Future<void> destroy_provider_profile(int id)async{
  //   await NetworkHelper().delete(ApiConst.destroyproviderProfile(id),);
  // }


}
