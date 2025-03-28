
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'core/consts/app_colors.dart';
import 'core/storage/storage_handler.dart';
import 'modules/hall-admin/auth-hall-admin/changePassword-hall-admin/presentation/screens/ChangePasswordAdminHall-screen.dart';
import 'modules/hall-admin/auth-hall-admin/login-hall-admin/presentation/screens/LoginHallAdmin.dart';
import 'modules/hall-admin/auth-hall-admin/verification-hall-admin/presentation/screens/verefication-AdminHall-screen.dart';
import 'modules/hall-admin/home-hall-admin/presentation/screens/home-hall-admin-screen.dart';
import 'modules/hall-admin/lougeInformation-hall-admin/presentation/screens/lougeInformation-hall-admin-screen.dart';
import 'modules/hall-admin/lougeInformation-hall-admin/presentation/screens/wait_HallAdmin_screen.dart';
import 'modules/hall-admin/myEmployees-hall-admin/presentation/screens/myEmployees-hallAdmin-screen.dart';
import 'modules/hall-admin/notification-hall-admin/presentation/screens/notification-hallAdmin-screen.dart';
import 'modules/hall-admin/profile-hall-admin/edit-profile-hall-admin/presentation/screens/EditProfile-AdminHall-screen.dart';
import 'modules/hall-admin/profile-hall-admin/view-profile-hall-admin/presentation/screens/vieProfile-hallAdmin-screen.dart';
import 'modules/user/both-joys-And-relievedHall/services-hall/services-both-Jo-Re-hall/presentation/screens/relieved.dart';
import 'modules/user/joys-hall/services-hall/services-joys-hall/presentation/screens/Joys-Hall-Services-screen.dart';

main() async {
  // await StorageHandler.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            elevation: 0,
            color: AppColors.fontOnLight.withOpacity(0.2),
            centerTitle: true,
            foregroundColor: AppColors.fontOnLight,
          ),
          //brightness: Brightness.dark
        ),
        //translations: AppTranslation(),
        // locale: StorageHandler().locale,
        initialRoute: BothReHallServicesScreen.name,
        getPages: [
          LougeInformationHallAdminScreen.page,
          WaitHallAdminScreen.page,
          LoginHallAdmin.page,
          ChangePasswordAadminHallScreen.page,
          VerificationHallAdminScreen.page,
          EditProfileHallAdminScreen.page,
          HomeHallAdminScreen.page,
          NotificationHallAdminScreen.page,
          ViewProfileHallAdminScreen.page,
          MyEmployeesHallAdminScreen.page,
          JoysHallServicesScreen.page,
          BothReHallServicesScreen.page
        ],

      );

  }
}
















//
// import 'package:flutter/material.dart';
//
// import 'modules/hall-admin/lougeInformation-hall-admin/presentation/screens/lougeInformation-hall-admin-screen.dart';
// import 'modules/hall-admin/lougeInformation-hall-admin/presentation/screens/tes.dart';
// import 'modules/hall-admin/lougeInformation-hall-admin/presentation/screens/wait_HallAdmin_screen.dart';
//
// void main() {
//   runApp( MyApp());
// }
//
// class MyApp extends StatelessWidget {
//    MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home:Tes(),
//     );
//   }
// }
