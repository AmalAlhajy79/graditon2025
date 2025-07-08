
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/consts/api_const.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import '../../../../../../core/core_components/textUtiles.dart';
import '../../../../both-joys-And-relievedHall/joys-And-relieved-details/presentation/controller/both-joys-relived-details-controller.dart';
import '../../../../both-joys-And-relievedHall/joys-And-relieved-details/presentation/screens/joys-relieved-details-screen.dart';
import '../../controller/home-user-controller.dart';
import '../viewRatingAllHalls.dart';

class Lounges extends GetView<HomeUserController> {
  const Lounges({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BothDetailsJoysReHallController bothDetailsJoysReHallController=Get.put(BothDetailsJoysReHallController());
    return Padding(
      padding: EdgeInsets.only(left: 5.w, right: 7.w, top: 2.5.w),
      child: Container(
        height: 62.w,
        width: 90.w,
        color: Colors.white70,
        child: Obx(() {
          if (Get.find<HomeUserController>().isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: [
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1.w,
                  mainAxisSpacing: 2.w,
                  childAspectRatio: 1,
                  mainAxisExtent: 165,
                ),
                itemCount: Get.find<HomeUserController>().halls.length,
                itemBuilder: (context, index) {
                  var hall = Get.find<HomeUserController>().halls[index];
                  print(' controller.viewUserRating............');
                  controller.viewUserRating = hall.averageRating;

                  return Padding(
                    padding: EdgeInsets.only(right: 1.w, left: 1.w),
                    child: InkWell(
                      onTap: () {
                        controller.hallId_pub=hall.id;
                        controller.avg_Ratting_OneHall=hall.averageRating;
                        print(' controller.hallId_pub=hall.id;............');
                        print('${ controller.hallId_pub}');
                        bothDetailsJoysReHallController.fetchHallDetails(controller.hallId_pub);
                        Get.toNamed(BothDetailsJoysReHallScreen.name);
                      },
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          // Add borders around the image
                          hall.hallImage != null
                              ? Container(
                            height: 50.w,
                            width: 50.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(9)),
                              border: Border.all(
                                color: Colors.black.withOpacity(0.2), // Border color
                                width: 2, // Border width
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(6)),
                              child: Image.network(
                                ApiConst.urlImage + '${hall.hallImage}',
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                              : Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(9)),
                              border: Border.all(
                                color: Colors.black.withOpacity(0.2),
                                width: 2,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 1.2.w,
                            top: 1.w,
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                height: 6.w,
                                width: 6.w,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.favorite_border,
                                  size: 4.w,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 2.w,
                            left: 2.5.w,
                            right: 2.5.w,
                            child: Container(
                              height: 14.w,
                              decoration: BoxDecoration(
                                color: Colors.white.withAlpha(140),
                                borderRadius: BorderRadius.all(Radius.circular(9)),
                              ),
                              padding: EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      TextUtiles(
                                          title: hall.name ?? "Unknown Hall",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ],
                                  ),
                                  Expanded(child: Rating_Container(rating: (hall.averageRating ?? 0).toDouble())),

                                  // Expanded(child: Rating_Container()),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          );
        }),
      ),
    );
  }
}
