import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/consts/api_const.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import '../../../../../../core/core_components/textUtiles.dart';
import '../../../view-car-office-details/presentation/screens/view-car-office-details-screen.dart';


class OfficeCard extends StatelessWidget {
  const OfficeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // BothDetailsJoysReHallController bothDetailsJoysReHallController=Get.put(BothDetailsJoysReHallController());
    return
      Padding(
      padding: EdgeInsets.only(left: 7.w, right: 8.w, top: 2.5.w),
      child: Container(
        height: 110.w,
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
                  crossAxisCount: 2,
                  //crossAxisSpacing: 3.w,
                  mainAxisSpacing: 2.3.w,
                  childAspectRatio: 1,
                  mainAxisExtent: 148,
                ),
                itemCount:8, //Get.find<HomeUserController>().halls.length,
                itemBuilder: (context, index) {
                  // var hall = Get.find<HomeUserController>().halls[index];
                  // print(' controller.viewUserRating............');
                  // controller.viewUserRating = hall.averageRating;

                  return Padding(
                    padding: EdgeInsets.only(right: 1.w, left: 1.w),
                    child: InkWell(
                      onTap: () {
                        // controller.hallId_pub=hall.id;
                        // controller.avg_Ratting_OneHall=hall.averageRating;
                        // print(' controller.hallId_pub=hall.id;............');
                        // print('${ controller.hallId_pub}');
                        // bothDetailsJoysReHallController.fetchHallDetails(controller.hallId_pub);
                        Get.toNamed(UserCarOfficeDetailsScreen.name);
                      },
                      child:
                      Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          // Add borders around the image
                          // hall.hallImage != null
                          //     ?
                          Container(
                            height: 37.w,
                            width: 40.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(9)),
                              border: Border.all(
                                color: Colors.black.withOpacity(0.2), // Border color
                                width: 2, // Border width
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(6)),
                              child: Image.asset("assets/images/cars2.png",
                                fit: BoxFit.fill,

                              ),
                              // child:
                              // Image.network(
                              //   ApiConst.urlImage + '${hall.hallImage}',
                              //   fit: BoxFit.fill,
                              // ),
                            ),
                          ),
                          //     : Container(
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.all(Radius.circular(9)),
                          //     border: Border.all(
                          //       color: Colors.black.withOpacity(0.2),
                          //       width: 2,
                          //     ),
                          //   ),
                          // ),
                          // hall.hallImage != null
                          //     ? Container(
                          //   height: 50.w,
                          //   width: 50.w,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.all(Radius.circular(9)),
                          //     border: Border.all(
                          //       color: Colors.black.withOpacity(0.2), // Border color
                          //       width: 2, // Border width
                          //     ),
                          //   ),
                          //   child: ClipRRect(
                          //     borderRadius: BorderRadius.all(Radius.circular(6)),
                          //     child: Image.network(
                          //       ApiConst.urlImage + '${hall.hallImage}',
                          //       fit: BoxFit.fill,
                          //     ),
                          //   ),
                          // )
                          //     : Container(
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.all(Radius.circular(9)),
                          //     border: Border.all(
                          //       color: Colors.black.withOpacity(0.2),
                          //       width: 2,
                          //     ),
                          //   ),
                          // ),
                          // Positioned(
                          //   left: 1.2.w,
                          //   top: 1.w,
                          //   child: InkWell(
                          //     onTap: () {},
                          //     child: Container(
                          //       height: 6.w,
                          //       width: 6.w,
                          //       decoration: BoxDecoration(
                          //         color: Colors.grey.shade200,
                          //         shape: BoxShape.circle,
                          //       ),
                          //       child: Icon(
                          //         Icons.favorite_border,
                          //         size: 4.w,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Positioned(
                            bottom: 2.w,
                            left:3.5.w,
                            right: 3.5.w,
                            child: Container(
                              height: 10.w,
                              width: 27.w,
                              decoration: BoxDecoration(
                                color: Colors.grey.withAlpha(90),
                                borderRadius: BorderRadius.all(Radius.circular(9)),
                              ),
                              padding: EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextUtiles(
                                      title: "Car office",
                                      fontSize: 14,
                                      colorTextStyle: Colors.black,
                                      fontWeight: FontWeight.w400),
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
