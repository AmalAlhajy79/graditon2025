import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import '../../../../../../../core/consts/app_colors.dart';
import '../../../../../../core/consts/api_const.dart';
import '../controller/both-joys-relieved-detail-pinding.dart';
import '../controller/both-joys-relived-details-controller.dart';


//نهائي قسم الافراح
class BothRelievedPhotoScreen extends GetView<BothDetailsJoysReHallController> {
  static const name = '/BothRelievedPhotoScreen';
  static final page = GetPage(
      name: name,
      page: () => BothRelievedPhotoScreen(),
      binding: BothDetailsJoysReHallBinding());

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return
      Padding(
      padding: EdgeInsets.only(top: 29.w, right: 3.w, left: 3.w),
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
                    if (controller.sorrowsImages.isEmpty) {
                      return Padding(
                        padding:  EdgeInsets.only(top: 60.w),
                        child: Center(child: Text("No images available")),
                      );
                    }
                    return
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        crossAxisSpacing: 1.w,
                        mainAxisSpacing: 2.w,
                        // childAspectRatio: 1,
                        mainAxisExtent: 230),
                    itemCount: controller.sorrowsImages.length,//6,
                    itemBuilder: (context, index) {
                      final image = controller.sorrowsImages[index];
                      return
                        Padding(
                        padding: EdgeInsets.only(right: 1.w, left: 1.w),
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                // borderRadius:
                                // BorderRadius.all(Radius.circular(9)),
                                image: DecorationImage(
                                  image:NetworkImage(ApiConst.urlImage +'${image.imagePath}'),
                                  // AssetImage('assets/images/aminhall.jpg'),
                                  // استبدل بالصور المناسبة
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),


                          ],
                        ),
                      );
                    },
                  );
                   }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

