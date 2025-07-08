import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/core_components/textUtiles.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import '../../../../../../../core/consts/app_colors.dart';
import '../../../../../../../core/core_components/button.dart';
import '../controller/services-both-Jo-Re/services-both-Jo-Re-binding.dart';
import '../controller/services-both-Jo-Re/services-both-Jo-Re-hall-Controller.dart';


class JoysGirlsAradaBand extends GetView<BothJoysReHallController> {
  static const name = '/JoysGirlsAradaBand';
  static final page = GetPage(
      name: name,
      page: () => JoysGirlsAradaBand(),
      binding: BothJoysReHallBinding());

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: 37.w, right: 3.w, left: 5.w),
      child: Stack(
        children: [
          Container(
            height: mq.height * 0.60,
            width: 99.w,
            decoration: BoxDecoration(color: AppColors.zayteFateh),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.zayteFateh,
                    //  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(9),bottomRight: Radius.circular(9)),
                  ),
                  height: mq.height * 0.55,
                  width: mq.width * 0.99,
                  // color: Colors.red,
                  child: ListView(
                    children: [
                      //what  occasion?
                      SizedBox(
                        height: 1.w,
                      ),
                      GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            crossAxisSpacing: 1.w,
                            mainAxisSpacing: 2.w,
                            mainAxisExtent: 120,
                          ),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  right: 1.w, left: 0.5.w, bottom: 2.w),
                              child: Row(
                                children: [
                                  Container(
                                    height: 45.w,
                                    width: 43.w,
                                    decoration: BoxDecoration(
                                      // color: Colors.cyanAccent,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(9)),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/aminhall.jpg'),
                                        // استبدل بالصور المناسبة
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:EdgeInsets.only(left: 0.5.w,top: 2.w),
                                        child: TextUtiles(
                                          title: "New baby party for..",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.w,
                                      ),
                                      Padding(
                                        padding:EdgeInsets.only(left: 0.5.w),
                                        child: TextUtiles(
                                            title: "Today at 05:00 pm.",
                                            fontSize: 11,
                                            colorTextStyle: Colors.black54),
                                      ),
                                      SizedBox(
                                        height: 1.w,
                                      ),
                                      Padding(
                                        padding:EdgeInsets.only(left: 0.5.w),
                                        child: Row(
                                          children: [
                                            Icon(Icons.remove_red_eye_rounded,color: Colors.black54,size: 16,),
                                            SizedBox(width: 1.w,),
                                            TextUtiles(
                                                title: "1000 view",
                                                fontSize: 10,
                                                colorTextStyle: Colors.black54
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          })
                    ],
                  ),
                ),

              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 4.w, right: 3.w,top: 117.w),
            child: ButtonScreen(
              title: '100 \$',
              onTap: () {},
              colorTextStyle: Colors.white,
              colorContainer: AppColors.zayteGamiq,
              fontSize: 20,
              height: 11.4.w,
              weight: 80.w,
              borderRadius: BorderRadius.all(Radius.zero),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
