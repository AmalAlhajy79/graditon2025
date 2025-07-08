import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import '../../../../../../../core/consts/api_const.dart';
import '../../../../../../../core/consts/app_colors.dart';
import '../../../../../../../core/core_components/app_scaffold.dart';
import '../../../../../../../core/core_components/button.dart';
import '../../../../../../../core/core_components/textUtiles.dart';
import '../../../services-hall/services-both-Jo-Re-hall/presentation/controller/services-both-Jo-Re/services-both-Jo-Re-binding.dart';
import '../../../services-hall/services-both-Jo-Re-hall/presentation/controller/services-both-Jo-Re/services-both-Jo-Re-hall-Controller.dart';
import '../../data/models/details-oneHall-model.dart';
import '../controller/both-joys-relived-details-controller.dart';

class PhotoJoysOrReleviedScreen extends GetView<BothDetailsJoysReHallController> {
  static const name = '/PhotoJoysOrReleviedScreen';
  static final page = GetPage(
      name: name,
      page: () => PhotoJoysOrReleviedScreen(),
      binding: BothJoysReHallBinding());


  @override
  Widget build(BuildContext context) {

    var mq = MediaQuery.of(context).size;

    return AppScaffold(
      body: ListView(
        children: [
          Column(
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
                        color: AppColors.zayteFateh,
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
                                title: "photo service",
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
                padding: EdgeInsets.only(top: 3.w, right: 3.w, left: 3.w),
                child: Container(
                  height: mq.height * 20,
                  width: mq.width * 45,
                  decoration: BoxDecoration(
                      // borderRadius: BorderRadius.only(
                      //   topRight: Radius.circular(9.w),
                      //   topLeft: Radius.circular(9.w),
                      // ),
                      color: AppColors.white),
                  child: Column(
                    children: [
                      Container(
                        height: mq.height * 0.80,
                        width: mq.width * 0.90,
                        // color: Colors.red,
                        child: ListView(
                          children: [
                            //what  occasion?
                            SizedBox(
                              height: 1.w,
                            ),
                            Obx(() {
                              var typeHall = controller.hallDetails.value.type;

                              var imagesToDisplay = typeHall == 'joys'
                                  ? controller.joysImages
                                  : controller.sorrowsImages;

                              if (imagesToDisplay.isEmpty) {
                                return Padding(
                                  padding: EdgeInsets.only(top: 60.w),
                                  child: Center(child: Text("No images available")),
                                );
                              }

                              return GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  crossAxisSpacing: 1.w,
                                  mainAxisSpacing: 2.w,
                                  mainAxisExtent: 230,
                                ),
                                itemCount: imagesToDisplay.length,
                                itemBuilder: (context, index) {
                                  final image = imagesToDisplay[index];

                                  if (index == 0) {
                                    return Padding(
                                      padding: EdgeInsets.only(right: 1.w, left: 1.w),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(ApiConst.urlImage + image.imagePath),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    );
                                  } else if (index == 1 && imagesToDisplay.length > 1) {
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.only(right: 1.w),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(ApiConst.urlImage + image.imagePath),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 1.w),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(ApiConst.urlImage + image.imagePath),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Padding(
                                      padding: EdgeInsets.only(right: 1.w, left: 1.w),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(ApiConst.urlImage + image.imagePath),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                },
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
