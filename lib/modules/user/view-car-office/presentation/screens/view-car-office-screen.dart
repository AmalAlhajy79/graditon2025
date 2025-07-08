import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:hall_gradition/core/core_components/app_scaffold.dart';
import 'package:hall_gradition/core/core_components/textUtiles.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import '../../../../../core/consts/api_const.dart';
import '../../../auth/rejester/rejester-user/presentation/controller/rejester-user/rejester-user-controller.dart';
import '../component/UserCarOfficeNavigationBar.dart';
import '../component/office-card.dart';
import '../controller/car-office-binding.dart';
import '../controller/car-office-controller.dart';

class HomeUserCarOfficeScreen extends GetView<HomeUserCarOfficeController> {
  HomeUserCarOfficeScreen({Key? key}) : super(key: key);
  static const name = '/HomeUserCarOfficeScreen';
  static final page = GetPage(
      name: name,
      page: () =>  HomeUserCarOfficeScreen(),
      binding:HomeUserCarOfficeBinding());
  // RejesterUserControllerrr rejesterUserControllerrr=Get.put(RejesterUserControllerrr());



  @override
  Widget build(BuildContext context) {

    var mq = MediaQuery.of(context).size;
    return AppScaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 3.w, left: 4.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {Get.back();},
                    icon: Icon(
                      Icons.arrow_back_ios_new_sharp,
                      color: Colors.black,
                      size: 26,
                    ),
                  ),
                  SizedBox(
                    width: 21.w,
                  ),
                  TextUtiles(
                    title: "Cars office",
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
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
                    IconButton(onPressed: () {}, icon: Icon(Icons.filter_frames)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 3.w,),
             Padding(
               padding:  EdgeInsets.only(left: 8.w),
               child: Row(
                 children: [
                   TextUtiles(title: 'All offices :',fontSize: 17),
                 ],
               ),
             ),
            SizedBox(height: 2.w,),
            Expanded(child: OfficeCard()),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 7.w, right: 8.w, bottom: 3.w),
        child: UserCarOfficeNavigationBar(),
      ),
    );
  }
}
