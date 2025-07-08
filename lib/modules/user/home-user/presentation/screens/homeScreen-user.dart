
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:hall_gradition/core/core_components/app_scaffold.dart';
import 'package:hall_gradition/core/core_components/textUtiles.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import 'package:hall_gradition/modules/user/home-user/presentation/components/gridview/closerToYou.dart';
import 'package:hall_gradition/modules/user/home-user/presentation/components/gridview/lounges.dart';
import 'package:hall_gradition/modules/user/home-user/presentation/components/gridview/offers.dart';

import '../../../../../core/consts/api_const.dart';
import '../../../../../core/consts/app_colors.dart';
import '../../../../../core/core_components/button.dart';
import '../../../auth/rejester/rejester-user/presentation/controller/rejester-user/rejester-user-controller.dart';
import '../components/bottomNavigation.dart';
import '../controller/home-user-controller.dart';
import '../controller/home-user-pading.dart';

class HomeUserScreen extends GetView<HomeUserController> {
   HomeUserScreen({Key? key}) : super(key: key);
  static const name = '/HomeUserScreen';
  static final page = GetPage(
      name: name,
      page: () =>  HomeUserScreen(),
      binding: HomeUserBinding());
  RejesterUserControllerrr rejesterUserControllerrr=Get.put(RejesterUserControllerrr());



  @override
  Widget build(BuildContext context) {

    var mq = MediaQuery.of(context).size;
    return AppScaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 6.w, right: 6.w, top: 3.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: rejesterUserControllerrr.userPhoto != null
                            ? NetworkImage(ApiConst.urlImage+rejesterUserControllerrr.userPhoto!)
                            : null,
                        child: rejesterUserControllerrr.userPhoto == null
                            ?  Container()
                            : null,
                      ),
                      // CircleAvatar(
                      //     backgroundImage:
                      //         AssetImage("assets/images/adminHall.png"),
                      //     maxRadius: 5.5.w),
                      SizedBox(
                        width: 1.w,
                      ),
                      TextUtiles(title: "Hello ${rejesterUserControllerrr.userName}.", fontSize: 14),//Hala., fontSize: 14),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 7.w,
                          width: 6.w,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                              border: Border(
                                left: BorderSide(width: 1.8),
                                right: BorderSide(width: 1.8),
                                top: BorderSide(width: 1.8),
                                bottom: BorderSide(width: 1.8),
                              )),
                          child: Icon(
                            Icons.favorite_border,
                            size: 4.w,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 7.w,
                          width: 6.w,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                              border: Border(
                                left: BorderSide(width: 1.8),
                                right: BorderSide(width: 1.8),
                                top: BorderSide(width: 1.8),
                                bottom: BorderSide(width: 1.8),
                              )),
                          child: Icon(
                            Icons.notifications_none_outlined,
                            size: 4.w,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 7.w, top: 2.w, bottom: 2.w, right: 1.w),
              child: Row(
                children: [
                  Container(
                    height: 10.w,
                    width: 75.w,
                decoration: BoxDecoration(
                  color: Colors.grey.withAlpha(110),
                  borderRadius:
                  BorderRadius.all(Radius.circular(1.w))
                  ,),
                    child: Row(
                      children: [
                        SizedBox( width: 2.w),
                        Icon(Icons.search,color: Colors.black45,),
                        SizedBox( width: 2.w),
                        TextUtiles(title: "Search",colorTextStyle: Colors.black45,)],
                    ),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Container(
                    height: 10.w,
                    width: 10.w,
                    decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(110),
                      borderRadius:
                      BorderRadius.all(Radius.circular(1.w))
                      ,),
                    child:
                        IconButton(onPressed: () {}, icon: Icon(Icons.filter)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 7.w, right: 7.w, top: 1.2.w),
              child: Container(
                height: 40.w,
                width: mq.width * 0.9,
                decoration: BoxDecoration(
                  color: AppColors.white,
                ),
                child:Obx(() {
                  // تحقق من أن قائمة الصالات تحتوي على بيانات قبل الوصول إليها
                  if (controller.halls.isNotEmpty) {
                    var currentHall = controller.halls[controller.currentIndex.value];
                    return Image.network(ApiConst.urlImage + currentHall.hallImage.toString(),fit: BoxFit.cover,);

                  } else {
                    // في حال كانت القائمة فارغة، يمكنك عرض صورة افتراضية أو مؤشر تحميل
                    return Container();
                  }
                }),

                // Obx(() {
                //   var currentHall = controller.halls[controller.currentIndex.value];
                //   return Image.network(ApiConst.urlImage + currentHall.hallImage.toString(),fit: BoxFit.cover,);
                //
                // }),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 7.w, right: 7.w, top: 2.w),
              child: Row(
                children: [
                  TextUtiles(
                      title: "Choice:",
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 7.w, right: 7.w, top: 2.w),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Obx(() {
                      return ButtonScreen(
                        title: 'Lounges',
                        onTap: () {
                          controller.showList1();
                        },
                        colorTextStyle: controller.showList1Selected.value
                            ? Colors.white
                            : Colors.black,
                        colorContainer: controller.showList1Selected.value
                            ? AppColors.zayteGamiq
                            : Colors.grey.shade200,
                        fontSize: 13.4,
                        height: 9.8.w,
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        fontWeight: FontWeight.w500,
                      );
                    }),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Expanded(
                    child: Obx(() {
                      return ButtonScreen(
                        title: 'Closer to you',
                        onTap: () {
                          controller.showList2();
                        },
                        colorTextStyle: controller.showList2Selected.value
                            ? Colors.white
                            : Colors.black,
                        colorContainer: controller.showList2Selected.value
                            ? AppColors.zayteGamiq
                            : Colors.grey.shade200,
                        fontSize: 13.4,
                        height: 9.8.w,
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        fontWeight: FontWeight.w500,
                      );
                    }),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Expanded(
                    child: Obx(() {
                      return ButtonScreen(
                        title: 'Offers',
                        onTap: () {
                          controller.showList3();
                        },
                        colorTextStyle: controller.showList3Selected.value
                            ? Colors.white
                            : Colors.black,
                        colorContainer: controller.showList3Selected.value
                            ? AppColors.zayteGamiq
                            : Colors.grey.shade200,
                        fontSize: 13.4,
                        height: 9.8.w,
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        fontWeight: FontWeight.w500,
                      );
                    }),
                  ),
                ],
              ),
            ),
       SizedBox(height: 1.w,),
            Obx(() {
              return controller.showList1Selected.value ?Lounges() :controller.showList2Selected.value ?CloserToYou() :Offers();
            }),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 7.w, right: 8.w, bottom: 3.w),
        child: UserBottomNavigationBar(),
      ),
    );
  }
}
