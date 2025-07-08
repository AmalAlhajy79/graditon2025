import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';

import '../../../../../../core/core_components/rating.dart';
import '../../../../../../core/core_components/textUtiles.dart';
import '../../../../both-joys-And-relievedHall/joys-And-relieved-details/presentation/screens/joys-relieved-details-screen.dart';

class CloserToYou extends StatelessWidget {
  const CloserToYou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(left: 5.w, right: 7.w, top: 2.5.w),
      child: Container(
        height: 62.w,
        width: 90.w,
        color: Colors.white70,
        child:
        ListView(
          children: [
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1.w,
                  mainAxisSpacing: 2.w,
                  childAspectRatio: 1,
                  mainAxisExtent: 165),
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 1.w, left: 1.w),
                  child: InkWell(
                    onTap: (){
                      Get.toNamed(BothDetailsJoysReHallScreen.name);
                    },
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(9)),
                            image: DecorationImage(
                              image:
                              AssetImage('assets/images/hall1.jpg'),
                              // استبدل بالصور المناسبة
                              fit: BoxFit.cover,
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
                            decoration: BoxDecoration(
                              color: Colors.white.withAlpha(140),
                              borderRadius:
                              BorderRadius.all(Radius.circular(9)),
                            ),
                            padding: EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    TextUtiles(title: "Al-Amin Hall",fontSize: 12,fontWeight: FontWeight.w400),
                                  ],
                                ),
                                RatingContainer(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
