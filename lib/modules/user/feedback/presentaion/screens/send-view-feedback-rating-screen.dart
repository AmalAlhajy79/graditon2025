import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:hall_gradition/core/core_components/button.dart';
import 'package:hall_gradition/core/core_components/textUtiles.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';

import '../../../../../core/consts/api_const.dart';
import '../../../../../core/consts/app_colors.dart';
import '../../../../../core/core_components/navBar-user-hall.dart';
import '../../../../../core/core_components/rating.dart';
import '../../../home-user/presentation/controller/home-user-controller.dart';
import '../component/user-rating.dart';
import '../controller/user-SendFeedbackRat-binding.dart';
import '../controller/user-SendFeedbackRat-controller.dart';

class SendFeedbackRatScreen extends GetView<FeedbackController> {
  //StatelessWidget {
  static const name = '/SendFeedbackRatScreen';
  static final page = GetPage(
      name: name,
      page: () => SendFeedbackRatScreen(),
      binding: SendFeedbackRatUserBinding());
  HomeUserController homeUserController=Get.put(HomeUserController());

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 5.w, left: 2.w, right: 6.w),
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 2.w),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
                      SizedBox(
                        width: 22.w,
                      ),
                      TextUtiles(
                        title: 'Feedback',
                        fontSize: 19.2,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.8.w,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 4.w,
                  ),
                  child: Row(
                    children: [
                      TextUtiles(
                        title: 'Click to rate a lounge : ',
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      CircleAvatar(
                        child: IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                return Dialog(
                                  child: Container(
                                    height: 50.w,
                                    width: 60.w,
                                    child: Column(
                                      children: [
                                        SizedBox(height: 3.w,),
                                        TextUtiles(title: 'Your rating',fontSize: 16,fontWeight: FontWeight.w500,),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 4.w, right: 4.w, top: 2.w),
                                          child: Container(
                                            height: 0.8,
                                            width: 89.w,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        SizedBox(height: 6.w,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            RatingUserContainer(),
                                          ],
                                        ),
                                        SizedBox(height:8.w,),
                                        ButtonScreen(
                                          title: 'Send',
                                          onTap: () {
                                            controller.submitFeedback(
                                              hallId:'${homeUserController.hallId_pub}', //'1',
                                              rating: controller.rating_user,
                                              comment: controller.commentController.text,
                                            );
                                            controller.fetchReviews(homeUserController.hallId_pub.toString());
                                            controller.fetchReviews(homeUserController.hallId_pub.toString());
                                            Get.back();
                                          },
                                          colorContainer: AppColors.zayteGamiq,
                                          fontWeight: FontWeight.w500,
                                          weight: 23.w,
                                          height: 9.w,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },

                              );
                            },
                            icon: Icon(Icons.star_border_purple500_outlined)),
                        maxRadius: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.5.w,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 2.7.w),
                  child: Row(
                    children: [
                      Container(
                        height: 9.w,
                        width: 23.w,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.w)),
                            border: Border.all(width: 1)),
                        child: Center(
                            child: TextUtiles(
                          title: 'All',
                          fontSize: 19,
                        )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.w,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.w, right: 1.w),
                  child: TextFormField(
                    controller: controller.commentController,
                    decoration: InputDecoration(
                      hintText: 'Write what you suggest...',
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      hintStyle: TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                      contentPadding:
                          EdgeInsets.only(top: 18.w, left: 4.w, right: 8.w),
                      enabledBorder: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(30.0), // حواف دائرية
                        borderSide: BorderSide(
                            color: Colors.transparent), // لا يظهر الخط
                      ),
                      focusedBorder: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(30.0), // حواف دائرية
                        borderSide: BorderSide(
                            color: Colors.transparent), // لا يظهر الخط
                      ),
                      border: OutlineInputBorder(
                        //  borderRadius: BorderRadius.circular(30.0), // حواف دائرية
                        borderSide: BorderSide(
                            color: Colors.transparent), // لا يظهر الخط
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.w,
                ),
                Container(
                  height: 83.w,
                  child: Obx(() {
                    if (controller.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                        itemCount: controller.reviews.length, // عدد التعليقات
                        controller: ScrollController(),
                        itemBuilder: (context, index) {
                          var reviw = controller.reviews[index];
                          print('controller.reviews.length....');
                          print(controller.reviews.length);
                          controller.viewUserRating = reviw.rating;
                          print(controller.viewUserRating);

                          return Padding(
                            padding: EdgeInsets.only(bottom: 0.02),
                            child: Container(
                              height: 42.w,  // تأكد من أن الارتفاع مناسب للمحتوى
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    title: TextUtiles(
                                      title: reviw.user.name, // عرض الاسم
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    onTap: () {},
                                    leading: CircleAvatar(
                                      backgroundImage: reviw.user.photo != null
                                          ? NetworkImage(ApiConst.urlImage + reviw.user.photo!)
                                          : null,
                                      child: reviw.user.photo == null
                                          ? Icon(Icons.person)
                                          : null,
                                      maxRadius: 7.w,
                                    ),
                                  ),
                                  SizedBox(height: 1.w),
                                  Padding(
                                    padding: EdgeInsets.only(left: 7.4.w),
                                    child: Row(
                                      children: [
                                        TextUtiles(
                                          title: '2/8/2020',
                                          fontWeight: FontWeight.w500,
                                        ),
                                        SizedBox(width: 6.w),
                                        RatingContainer(),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                                    child: Text(
                                      reviw.comment,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14.6,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 4.w),
                                  Padding(
                                    padding: EdgeInsets.only(left: 4.1.w),
                                    child: Container(
                                      height: 0.8,
                                      width: 89.w,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  }),
                ),

                     ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 3.w, right: 3.w, bottom: 4.w),
        child: UserNavigBarHallDetails(),
      ),
    );
  }
}

