import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import '../../../../../../../core/consts/api_const.dart';
import '../../../../../../../core/consts/app_colors.dart';
import '../../../../../../../core/core_components/app_scaffold.dart';
import '../../../../../../../core/core_components/button.dart';
import '../../../../../../../core/core_components/textUtiles.dart';
import '../controller/services-both-Jo-Re/services-both-Jo-Re-binding.dart';
import '../controller/services-both-Jo-Re/services-both-Jo-Re-hall-Controller.dart';

class CarServicesScreen extends GetView<BothJoysReHallController> {
  static const name = '/CarServicesScreen';
  static final page = GetPage(
      name: name,
      page: () => CarServicesScreen(),
      binding: BothJoysReHallBinding());

  final BothJoysReHallController controller =
  Get.put(BothJoysReHallController());

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<BothJoysReHallController>(() => BothJoysReHallController());

    final carServices = controller.joysServices
        .where((service) => service.name.toLowerCase().contains('car'))
        .toList();
    var mq = MediaQuery.of(context).size;

    if (carServices.isEmpty) {
      return
        AppScaffold(
        body: Column(
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
                              title: "Car service",
                              fontSize: 17.5,
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
              padding:  EdgeInsets.only(top: 50.w),
              child: Center(
                child: TextUtiles(title: "the service not found.",fontSize: 17,fontWeight: FontWeight.w400,),
              ),
            ),
          ],
        ),
      );
    }

    final carImages = carServices.expand((service) => service.images).toList();
    final carDescription = carServices.first.description;
    final carPrice = carServices.first.servicePrice;
    final imagePath = carImages.isNotEmpty
        ? ApiConst.urlImage + carImages[0].imagePath
        : '';


    return AppScaffold(
      body:
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.w),
        child: Container(
          height: mq.height,
          color: AppColors.zayteFateh,
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.1.w),
                    child: Container(
                      height: mq.height * 0.58,
                      width: mq.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(7.w),
                          bottomRight: Radius.circular(7.w),
                        ),
                        color: Colors.grey.shade300,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 1.5.w,
                          right: 12.w,
                          bottom: 83.w,
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
                                  size: 23,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 26.w, top: 1.w),
                                child: TextUtiles(
                                  title: "Car Service",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (carImages.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.only(left: 10.w, top: 24.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: mq.width * 0.73,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1.w),
                              color: AppColors.white,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(1.w),
                              child: Image.network(
                                imagePath,
                                height: 57.8.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.w, top: 6.w),
                child: Row(
                  children: [
                    Container(
                      height: 9.2.w,
                      width: 27.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.w),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: TextUtiles(
                          title: "Description",
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 6.6.w, top: 5.w),
                child: Row(
                  children: [
                    Expanded(
                      child: TextUtiles(
                        title: carDescription,
                        fontSize: 14.8,
                        fontWeight: FontWeight.w400,
                        colorTextStyle: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.w, right: 1.w),
                child: ButtonScreen(
                  title: '$carPrice \$',
                  onTap: () {},
                  colorTextStyle: Colors.white,
                  colorContainer: AppColors.zayteGamiq,
                  fontSize: 20,
                  height: 11.4.w,
                  weight: 87.w,
                  borderRadius: BorderRadius.zero,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

