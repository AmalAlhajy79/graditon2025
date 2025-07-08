
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hall_gradition/modules/user/home-user/presentation/screens/homeScreen-user.dart';
import '../../../../../../core/consts/api_const.dart';
import '../../../../../../core/network/network_helper.dart';
import '../../../rejester/rejester-user/presentation/controller/rejester-user/rejester-user-controller.dart';

class LoginHallAdminDataSource{
  static Future<void> login_User({
    required String email,
    required String password,

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
      RejesterUserControllerrr rejesterUserControllerrr=Get.put(RejesterUserControllerrr());
      print('.............response.........');
      print(response.data.toString());

      // استخراج التوكين من الـ JSON
      final token = response.data['token'];

      // تخزين التوكين باستخدام GetStorage
      final box = GetStorage();
      box.write('api_token', token);
      rejesterUserControllerrr.userToken=box.read('api_token');
      print('token...');
      print(token);
      print('rejesterUserControllerrr.userToken...');
      print(rejesterUserControllerrr.userToken);
      // التوجيه لواجهة المستخدم بعد تسجيل الدخول
      Get.toNamed(HomeUserScreen.name);
    }
  }

  // static Future<void> destroy_provider_profile(int id)async{
  //   await NetworkHelper().delete(ApiConst.destroyproviderProfile(id),);
  // }


}
