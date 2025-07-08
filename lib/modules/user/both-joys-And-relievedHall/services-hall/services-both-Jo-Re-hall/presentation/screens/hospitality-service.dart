
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/consts/api_const.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import '../../../../../../../core/consts/app_colors.dart';
import '../../../../../../../core/core_components/app_scaffold.dart';
import '../../../../../../../core/core_components/button.dart';
import '../../../../../../../core/core_components/textUtiles.dart';
import '../../data/models/services-both-Jo-Re-model.dart';
import '../controller/services-both-Jo-Re/services-both-Jo-Re-binding.dart';
import '../controller/services-both-Jo-Re/services-both-Jo-Re-hall-Controller.dart';

class HospitalityServicesScreen extends GetView<BothJoysReHallController> {
  static const name = '/HospitalityServicesScreen';
  static final page = GetPage(
      name: name,
      page: () => HospitalityServicesScreen(),
      binding: BothJoysReHallBinding());
  final BothJoysReHallController controller =
  Get.put(BothJoysReHallController());

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<BothJoysReHallController>(() => BothJoysReHallController());
    var mq = MediaQuery.of(context).size;
    return AppScaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 1.w, right: 1.w),
        child: Container(
          height: mq.height,
          color: AppColors.white,
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.1.w, right: 0.1.w),
                    child: Container(
                      height: 28.w,
                      width: mq.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(7.w),
                            bottomRight: Radius.circular(7.w)),
                        color:AppColors.zayteFateh,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 1.5.w,
                          right: 12.w,
                          bottom: 1.w,
                        ),
                        child: Container(
                          height: 4.w,
                          width: 4.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios_new_sharp,
                                  color: Colors.black,
                                  size: 24,
                                ),
                              ),
                              SizedBox(
                                width: 25.w,
                              ),
                              TextUtiles(
                                title: "Hospitality",
                                fontSize: 16.5,
                                fontWeight: FontWeight.w500,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.w, right: 4.w, left: 4.w),
                child: Container(
                  // height: 70.w,
                  // width: 90.w,
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.only(
                    //   topRight: Radius.circular(9.w),
                    //   topLeft: Radius.circular(9.w),
                    // ),
                      color: AppColors.white),
                  child: Column(
                    children: [
                      Container(
                        height: 124.w,
                        width: 88.w,
                        // color: Colors.red,
                        child:
                        ListView(
                          children: [
                            //what  occasion?
                            GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                crossAxisSpacing: 1.w,
                                mainAxisSpacing: 2.w,
                                mainAxisExtent: 235,
                              ),
                              itemCount: controller.joysServices
                                  .where((service) => service.name.toLowerCase().contains('hospitality'))
                                  .expand((service) => service.images)
                                  .toList()
                                  .length,
                              itemBuilder: (context, index) {
                                // جمع الصور من خدمات الضيافة فقط
                                final hospitalityImages = controller.joysServices
                                    .where((service) => service.name.toLowerCase().contains('hospitality'))
                                    .expand((service) => service.images)
                                    .toList();

                                final imagePath = ApiConst.urlImage + hospitalityImages[index].imagePath;

                                return Stack(
                                  alignment: Alignment.topLeft,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(imagePath),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),


                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
