import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/consts/api_const.dart';
import 'package:hall_gradition/core/consts/app_colors.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import '../../../../../../core/core_components/textUtiles.dart';


class OfficeCardDetails extends StatelessWidget {
  const OfficeCardDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // BothDetailsJoysReHallController bothDetailsJoysReHallController=Get.put(BothDetailsJoysReHallController());
    return
      Padding(
      padding: EdgeInsets.only(left: 5.w, right: 7.w, top: 2.5.w),
      child: Container(
        height: 108.w,
        width: 90.w,
        color: Colors.white70,
        child:
    // Obx(() {
    //       if (Get.find<HomeUserController>().isLoading.value) {
    //         return Center(child: CircularProgressIndicator());
    //       }
    //       return
            ListView(
            children: [
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 1.w,
                  mainAxisSpacing: 3.w,
                  childAspectRatio: 1,
                  mainAxisExtent: 140,
                ),
                itemCount:5, //Get.find<HomeUserController>().halls.length,
                itemBuilder: (context, index) {
                  // var hall = Get.find<HomeUserController>().halls[index];
                  // print(' controller.viewUserRating............');
                  // controller.viewUserRating = hall.averageRating;

                  return Padding(
                    padding: EdgeInsets.only(right: 1.w, left: 3.9.w),
                    child: InkWell(
                      onTap: () {
                        // controller.hallId_pub=hall.id;
                        // controller.avg_Ratting_OneHall=hall.averageRating;
                        // print(' controller.hallId_pub=hall.id;............');
                        // print('${ controller.hallId_pub}');
                        // bothDetailsJoysReHallController.fetchHallDetails(controller.hallId_pub);
                        // Get.toNamed(BothDetailsJoysReHallScreen.name);
                      },
                      child:
                      Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          // Add borders around the image
                          // hall.hallImage != null
                          //     ?
                          Container(
                            height: 70.w,
                            width: 79.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(9)),
                              border: Border.all(
                                color: AppColors.zayteGamiq.withOpacity(0.2), // Border color
                                width: 5, // Border width
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(6)),
                              child: Image.asset("assets/images/cars2.png",
                                fit: BoxFit.cover,

                              ),
                            ),
                          ),


                          Positioned(
                            bottom: 2.w,
                             left: 3.5.w,
                            //right: 2.5.w,
                            child: Container(
                              height: 10.w,
                              width: 72.6.w,
                              decoration: BoxDecoration(
                                color: Colors.grey.withAlpha(80),
                                borderRadius: BorderRadius.all(Radius.circular(9)),
                              ),
                              padding: EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextUtiles(
                                      title: "Car office",
                                      fontSize: 16,
                                      colorTextStyle: Colors.black87,
                                      fontWeight: FontWeight.w500),
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
          )
        //   ;
        // }),
      ),
    );
  }
}
