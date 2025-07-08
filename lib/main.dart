
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'core/consts/app_colors.dart';
import 'core/storage/storage_handler.dart';
import 'modules/hall-admin/auth-hall-admin/changePassword-hall-admin/presentation/screens/ChangePasswordAdminHall-screen.dart';
import 'modules/hall-admin/auth-hall-admin/login-hall-admin/presentation/screens/LoginHallAdmin.dart';
import 'modules/hall-admin/auth-hall-admin/verification-hall-admin/presentation/screens/verefication-AdminHall-screen.dart';
import 'modules/hall-admin/home-hall-admin/presentation/screens/home-hall-admin-screen.dart';
import 'modules/hall-admin/lougeInformation-hall-admin/presentation/screens/lougeInformation-hall-admin-screen.dart';
import 'modules/hall-admin/lougeInformation-hall-admin/presentation/screens/wait_HallAdmin_screen.dart';
import 'modules/hall-admin/myEmployees-hall-admin/presentation/screens/myEmployees-hallAdmin-screen.dart';
import 'modules/hall-admin/myHalls-admin/presentation/screens/myHallsAdmin-screen.dart';
import 'modules/hall-admin/notification-hall-admin/presentation/screens/notification-hallAdmin-screen.dart';
import 'modules/hall-admin/profile-hall-admin/edit-profile-hall-admin/presentation/screens/EditProfile-AdminHall-screen.dart';
import 'modules/hall-admin/profile-hall-admin/view-profile-hall-admin/presentation/screens/vieProfile-hallAdmin-screen.dart';
import 'modules/user/auth/login-Client/presentation/screens/LoginClient.dart';
import 'modules/user/auth/rejester/rejester-user/presentation/screens/rejester-user-screen.dart';
import 'modules/user/booking/presentation/screens/Booking-UserScreen.dart';
import 'modules/user/both-joys-And-relievedHall/joys-And-relieved-details/presentation/screens/joys-or-relevied-photo-screen.dart';
import 'modules/user/both-joys-And-relievedHall/joys-And-relieved-details/presentation/screens/joys-or-relevied-viedio-screen.dart';
import 'modules/user/both-joys-And-relievedHall/joys-And-relieved-details/presentation/screens/joys-reliev-details-photo.dart';
import 'modules/user/both-joys-And-relievedHall/joys-And-relieved-details/presentation/screens/joys-reliev-details-video.dart';
import 'modules/user/both-joys-And-relievedHall/joys-And-relieved-details/presentation/screens/joys-relieved-details-screen.dart';
import 'modules/user/both-joys-And-relievedHall/services-hall/services-both-Jo-Re-hall/presentation/screens/cars-service-hall.dart';
import 'modules/user/both-joys-And-relievedHall/services-hall/services-both-Jo-Re-hall/presentation/screens/decor-joys-service.dart';
import 'modules/user/both-joys-And-relievedHall/services-hall/services-both-Jo-Re-hall/presentation/screens/hospitality-service.dart';
import 'modules/user/both-joys-And-relievedHall/services-hall/services-both-Jo-Re-hall/presentation/screens/joys-Arada-screen.dart';
import 'modules/user/both-joys-And-relievedHall/services-hall/services-both-Jo-Re-hall/presentation/screens/joys.dart';
import 'modules/user/both-joys-And-relievedHall/services-hall/services-both-Jo-Re-hall/presentation/screens/promoVideo-service.dart';
import 'modules/user/both-joys-And-relievedHall/services-hall/services-both-Jo-Re-hall/presentation/screens/protiction-photography-screen.dart';
import 'modules/user/both-joys-And-relievedHall/services-hall/services-both-Jo-Re-hall/presentation/screens/relieved.dart';
import 'modules/user/both-joys-And-relievedHall/services-hall/services-both-Jo-Re-hall/presentation/screens/services-both-Jo-Re-screen.dart';
import 'modules/user/feedback/presentaion/screens/send-view-feedback-rating-screen.dart';
import 'modules/user/home-user/presentation/screens/homeScreen-user.dart';
import 'modules/user/inquiry/presentation/screens/send-and-view-user-inquiry.dart';
import 'modules/user/joys-hall/services-hall/services-joys-hall/presentation/screens/Joys-Hall-Services-screen.dart';
import 'modules/user/relieved-hall/services-hall/services-releved-hall/presentation/screens/relieved-hall.dart';
import 'modules/user/request-to-booking-car/presentation/screens/user-request-to-booking-car.dart';
import 'modules/user/user-Message-CarOffice/presentation/screens/User-Message-CarOffice-Screen.dart';
import 'modules/user/user-payment/presentation/screens/payment-user-screen.dart';
import 'modules/user/user-profile/vieProfile-Client-screen.dart';
import 'modules/user/view-car-office-details/presentation/screens/view-car-office-details-screen.dart';
import 'modules/user/view-car-office/presentation/screens/view-car-office-screen.dart';
//
// main() async {
//   await GetStorage.init();
//   runApp( MyApp());
// }
void main() async {
  await GetStorage.init();

  final box = GetStorage();
  final String? token = box.read('api_token');
  final String? role = box.read('role');
  // تحديد الصفحة الابتدائية بناءً على وجود التوكين
  final String initialRoute =
  (token != null && token.isNotEmpty) ?( role=='client'? HomeUserScreen.name: MyHallsAdminScreen.name) : RejesterUserScreen.name;

  runApp(MyApp(initialRoute: initialRoute));
}
class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: AppColors.fontOnLight.withOpacity(0.2),
          centerTitle: true,
          foregroundColor: AppColors.fontOnLight,
        ),
      ),
      initialRoute:HomeUserScreen.name,//initialRoute,
      getPages: [
        LougeInformationHallAdminScreen.page,
        WaitHallAdminScreen.page,
        LoginHallAdmin.page,
        ChangePasswordAadminHallScreen.page,
        VerificationHallAdminScreen.page,
        EditProfileHallAdminScreen.page,
        // HomeHallAdminScreen.page,
        NotificationHallAdminScreen.page,
        ViewProfileHallAdminScreen.page,
        MyEmployeesHallAdminScreen.page,
        JoysHallServicesScreen.page,
        //BothReHallServicesScreen.page
        BothJoysServicesScreen.page,
        BothRe_JoysHallServicesScreen.page,
        BothRelievedServicesScreen.page,
        HomeUserScreen.page,
        BookingUserScreen.page,
        ChatUserScreen.page,
        BothDetailsJoysReHallScreen.page,
        BothRe_JoysHallPhotoScreen.page,
        BothRe_JoysHallVideoScreen.page,
        JoysAradaServicesScreen.page,
        ProtectionPhotogServicesScreen.page,
        CarServicesScreen.page,
        DecorJoysServicesScreen.page,
        HospitalityServicesScreen.page,
        PromoVideoServicesScreen.page,
        ChatUserScreen.page,
        BothDetailsJoysReHallScreen.page,
        RejesterUserScreen.page,
        MyHallsAdminScreen.page,
        SendFeedbackRatScreen.page,
        LoginClient.page,
        PaymentScreen.page,
        HomeUserCarOfficeScreen.page,
        UserCarOfficeDetailsScreen.page,
        UserMessageCarOfficeScreen.page,
        BookingCarUserPage.page,
        RelievedHallServicesScreen.page,
        PhotoJoysOrReleviedScreen.page,
        VedioJoysOrReleviedScreen.page
      ],
    );
  }
}



// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       GetMaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//           appBarTheme: AppBarTheme(
//             elevation: 0,
//             color: AppColors.fontOnLight.withOpacity(0.2),
//             centerTitle: true,
//             foregroundColor: AppColors.fontOnLight,
//           ),
//           //brightness: Brightness.dark
//         ),
//         //translations: AppTranslation(),
//         // locale: StorageHandler().locale,
//         initialRoute: RejesterUserScreen.name,//ChatUserScreen.name,//HomeHallAdminScreen
//         getPages: [
//           LougeInformationHallAdminScreen.page,
//           WaitHallAdminScreen.page,
//           LoginHallAdmin.page,
//           ChangePasswordAadminHallScreen.page,
//           VerificationHallAdminScreen.page,
//           EditProfileHallAdminScreen.page,
//          // HomeHallAdminScreen.page,
//           NotificationHallAdminScreen.page,
//           ViewProfileHallAdminScreen.page,
//           MyEmployeesHallAdminScreen.page,
//           JoysHallServicesScreen.page,
//           //BothReHallServicesScreen.page
//           BothJoysServicesScreen.page,
//           BothRe_JoysHallServicesScreen.page,
//           BothRelievedServicesScreen.page,
//           HomeUserScreen.page,
//           BookingUserScreen.page,
//           ChatUserScreen.page,
//           BothDetailsJoysReHallScreen.page,
//           BothRe_JoysHallPhotoScreen.page,
//           BothRe_JoysHallVideoScreen.page,
//           JoysAradaServicesScreen.page,
//           ProtectionPhotogServicesScreen.page,
//           CarServicesScreen.page,
//           DecorJoysServicesScreen.page,
//           HospitalityServicesScreen.page,
//           PromoVideoServicesScreen.page,
//           ChatUserScreen.page,
//           BothDetailsJoysReHallScreen.page,
//           RejesterUserScreen.page,
//           MyHallsAdminScreen.page,
//           SendFeedbackRatScreen.page,
//           LoginClient.page
//
//         ],
//
//       );
//
//   }
// }













//
//
//
//
// import 'package:flutter/material.dart';
//
// import 'modules/hall-admin/rejester-user-user/presentation/screens/rejester-user-user-screen.dart';
// import 'modules/hall-admin/rejester-user-user/presentation/screens/tes.dart';
// import 'modules/hall-admin/rejester-user-user/presentation/screens/wait_HallAdmin_screen.dart';
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
