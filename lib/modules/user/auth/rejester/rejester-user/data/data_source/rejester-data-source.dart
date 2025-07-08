//
//
//
// import 'dart:io';
//
// import '../../../../../../core/consts/api_const.dart';
// import '../../../../../../core/network/network_helper.dart';
// class LoungeInformationHallAdminDataSource {
//   static Future<void> loungeInformationHallAdmin({
//     required String hallName,
//     required String hallPlace,
//     required String hallCapacity,
//     required String contactNumber,
//     required String loungeType,
//     required List<String> events,
//     required String? hallImage,
//     required List<File> images
//   }) async {
//     var body = {
//       'name': hallName,
//       'location': hallPlace,
//       'capacity': hallCapacity,
//       'contact': contactNumber,
//       'type': loungeType,
//       'events[]': events,
//     };
//
//     var files = <String, dynamic>{};
//
//     if (hallImage != null && hallImage.isNotEmpty) {
//       files['hall_image'] = hallImage;
//     }
//
//     // إضافة الصور المتعددة
//     if (images.isNotEmpty) {
//       // نستخدم List<String> مع المفتاح 'images[]'
//       files['images[]'] = images;
//     }
// print("\n \n@@@@@@@@@@@ befor response @@@@@@@@@@\n");
//     var response = await NetworkHelper().post(
//       ApiConst.loungeInformationHallAdmin,
//       body: body,
//       files: files,
//     );
//     print("\n@@@@@@@@@@@ after response @@@@@@@@@@\n");
//     if (response.statusCode == 200) {
//       // طلب ناجح
//       print('\n.............status.........\n');
//       print(response.statusCode);
//       print('\n.............response.........\n');
//       print(response.data);
//       print("\n");
//     } else {
//       // فشل الطلب
//       print('Error: ${response.statusCode}');
//     }
//
//   }
// }
//
