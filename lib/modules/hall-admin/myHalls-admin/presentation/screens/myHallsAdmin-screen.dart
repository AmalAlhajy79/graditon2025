import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/consts/api_const.dart';
import 'package:hall_gradition/core/core_components/button.dart';
import 'package:hall_gradition/core/core_components/textUtiles.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import '../../../../../../core/core_components/app_scaffold.dart';
import '../../../../../core/consts/app_colors.dart';
import '../../../../../core/core_components/navigationBar.dart';
import '../../../home-hall-admin/presentation/controller/home-hall-admin/home-hall-admin-Controller.dart';
import '../../../home-hall-admin/presentation/screens/home-hall-admin-screen.dart';
import '../../../myEmployees-hall-admin/presentation/controller/myEmployees-hallAdmin/myEmployees-hallAdmin-Controller.dart';
import '../controller/myHallsAdmin/myHallsAdmin-Controller.dart';
import '../controller/myHallsAdmin/myHallsAdmin-binding.dart';
class MyHallsAdminScreen extends GetView<MyHallAdminController> {
  static const name = '/MyHallsAdminScreen';
  static final page = GetPage(
    name: name,
    page: () => MyHallsAdminScreen(),
    binding: MyHallAdminBinding(),
  );

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    HallDetailsAdminController hallDetailsAdminController =
    Get.put(HallDetailsAdminController());
    ApprovedAssistantController approvedAssistantController=Get.put(ApprovedAssistantController());
    return AppScaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 2.w),
              child: Container(
                height: 20.w,
                decoration: BoxDecoration(
                  color: AppColors.col6,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 1, // مدى انتشار الظل
                      blurRadius: 4, // مدى تمويه الظل
                      offset: Offset(0, 3), // الإزاحة (يمين، أسفل)
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 4.w),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_sharp,
                          size: 17,
                          color: Colors.white,
                          weight: 15.w,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      TextUtiles(
                        title: "Lounges",
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        colorTextStyle: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 1.w,
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }

              return Container(
                height: 145.w,
                // width: 90.w,
                color: Colors.white,
                child: ListView.builder(
                  itemCount: controller.halls.length,
                  itemBuilder: (context, index) {
                    final hall = controller.halls[index];


                    return InkWell(
                      onTap: () async{
                        hallDetailsAdminController.hallId_public = hall.id;
                        print(hallDetailsAdminController.hallId_public);
                        Get.to(() => HomeHallAdminScreen(hallId: hall.id));
                       await approvedAssistantController.fetchApprovedUsers();
                        // Get.to(HomeHallAdminScreen(hallId: hall.id));
                      },
                      child: Container(
                        height: 65.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            bottom: BorderSide(color: Colors.black87, width: 1.5),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 54.w,
                              color: Colors.grey.shade300,
                              child: hall.hallImage != null
                                  ? Padding(
                                padding: EdgeInsets.only(
                                    left: 4.w, right: 4.w, top: 0.5.w),
                                child: Container(
                                  color: Colors.white,
                                  child: Image.network(ApiConst.urlImage+
                                    hall.hallImage,
                                    fit: BoxFit.cover,
                                    height: 50.w,
                                    width: 99.w,
                                  ),
                                ),
                              )
                                  : Text(''),
                            ),
                            SizedBox(height: 2.w),
                            TextUtiles(
                              title: hall.name.toString(),
                              fontSize: 16.7,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

// class MyHallsAdminScreen extends GetView<MyHallAdminController> {
//   static const name = '/MyHallsAdminScreen';
//   static final page = GetPage(
//       name: name,
//       page: () => MyHallsAdminScreen(),
//       binding:MyHallAdminBinding());
//
//   @override
//   Widget build(BuildContext context) {
//     var mq = MediaQuery.of(context).size;
//     HallDetailsAdminController hallDetailsAdminController=Get.put(HallDetailsAdminController());
//     return AppScaffold(
//       body:
//           Container(
//         decoration: BoxDecoration(color: Colors.white),
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.only(bottom: 2.w),
//               child: Container(
//                 height: 20.w,
//                 decoration: BoxDecoration(
//                   color: AppColors.col6,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.9),
//                       spreadRadius: 1, // مدى انتشار الظل
//                       blurRadius: 4, // مدى تمويه الظل
//                       offset: Offset(0, 3), // الإزاحة (يمين، أسفل)
//                     ),
//                   ],
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 4.w),
//                   child: Row(
//                     children: [
//                       IconButton(
//                           onPressed: () {
//                             Get.back();
//                           },
//                           icon: Icon(
//                             Icons.arrow_back_ios_new_sharp,
//                             size: 17,
//                             color: Colors.white,
//                             weight: 15.w,
//                           )),
//                       SizedBox(
//                         width: 20.w,
//                       ),
//                       TextUtiles(
//                         title: "Lounges",
//                         fontWeight: FontWeight.w500,
//                         fontSize: 17,
//                         colorTextStyle: Colors.white,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 1.w,
//             ),
//             Obx(() {
//               if (controller.isLoading.value) {
//                 return Center(child: CircularProgressIndicator());
//               }
//
//               return
//                 Container(
//                  height: 145.w,
//                // width: 90.w,
//                   color: Colors.white,
//                 child: ListView.builder(
//                   itemCount: controller.halls.length,
//                   itemBuilder: (context, index) {
//                     final hall = controller.halls[index];
//                     hallDetailsAdminController.hallId_public=hall.id;
//                     print(hallDetailsAdminController.hallId_public);
//                     return
//                       InkWell(
//                       onTap: () {
//                        // Get.toNamed(HomeHallAdminScreen.name);
//                          Get.to(HomeHallAdminScreen(hallId: hall.id));
//                       },
//                       child: Container(
//                           height: 65.w,
//
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               // color: Colors.grey.withAlpha(70),
//                               border: Border(
//                                 bottom:
//                                     BorderSide(color: Colors.black87, width: 1.5),
//                                 // top:
//                               )),
//                           child: Column(
//                             children: [
//                           Container(
//                             height: 54.w,
//
//                            color: Colors.grey.shade300,
//                            child:hall.hallImage !=null? Container(
//                              height: 50.w,
//                              width: 99.w,
//                              child: Padding(
//                                padding:  EdgeInsets.only(left:4.w,right: 4.w,top: 0.5.w),
//                                child: Container(
//                                  color: Colors.white,
//                                  child: Expanded(child: Image.network(hall.hallImage,fit: BoxFit.cover)),
//                                ),
//                              ),
//                            ):Text(''),
//                            ),
//                             SizedBox(height: 2.w,),
//                             TextUtiles(title: hall.name.toString(),fontSize: 16.7,fontWeight: FontWeight.w400,)
//                             ],
//                           ),),
//                                           );
//                   },
//                 ),
//               );
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }
