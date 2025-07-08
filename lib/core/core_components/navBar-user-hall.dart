import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hall_gradition/core/core_components/textUtiles.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import 'package:hall_gradition/modules/user/feedback/presentaion/controller/user-SendFeedbackRat-controller.dart';
import 'package:hall_gradition/modules/user/feedback/presentaion/screens/send-view-feedback-rating-screen.dart';
import '../../../../../core/consts/app_colors.dart';
import '../../modules/user/both-joys-And-relievedHall/joys-And-relieved-details/presentation/screens/joys-relieved-details-screen.dart';

import '../../modules/user/home-user/presentation/controller/home-user-controller.dart';
import '../../modules/user/inquiry/presentation/screens/send-and-view-user-inquiry.dart';
import '../../modules/user/send-user-complaint/presentation/screens/send-user-complaint.dart';
import '../../modules/user/view-hall-policy/presentation/screens/view-hall-policy.dart';

class UserNavigBarHallDetails extends StatelessWidget {

  final NavigaHallDetailsUserController controller = Get.put(NavigaHallDetailsUserController());
  final FeedbackController feedbackController=Get.put(FeedbackController());
  HomeUserController homeUserController=Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      height: 13.5.w,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(3.w),
          topRight: Radius.circular(3.w),
          bottomRight: Radius.circular(3.w),
          bottomLeft: Radius.circular(3.w),
        ),
        border: Border(
            left: BorderSide(width: 1),
            right: BorderSide(width: 1),
            top: BorderSide(width: 1),
            bottom: BorderSide(width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.all(1.2.w),
            child: Container(
              decoration: BoxDecoration(
                color: controller.selectedIndex.value == 0
                    ? AppColors.zayteGamiq
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(3.w),
                  topRight: Radius.circular(3.w),
                  bottomRight: Radius.circular(3.w),
                  bottomLeft: Radius.circular(3.w),
                ),
              ),

              //Colors.yellowAccent,
              child: Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.house_siding_rounded,
                        color: controller.selectedIndex.value == 0
                            ? Colors.white
                            : Colors.black),
                    onPressed: () {
                      controller.changeIndex(0);
                      Get.toNamed(BothDetailsJoysReHallScreen.name);
                    },
                  ),
                  Positioned(
                    bottom: 0.1,
                    right: 1.w,
                    left: 2.w,
                    child: TextUtiles(
                      title: "lounge" ,
                      colorTextStyle: controller.selectedIndex.value == 0 ? AppColors.zayteGamiq:Colors.black87,
                      fontSize: 9,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(1.2.w),
            child: Container(
              decoration: BoxDecoration(
                color: controller.selectedIndex.value == 1
                    ? AppColors.zayteGamiq
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(3.w),
                  topRight: Radius.circular(3.w),
                  bottomRight: Radius.circular(3.w),
                  bottomLeft: Radius.circular(3.w),
                ),
              ),
              //Colors.yellowAccent,
              child: Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.insert_invitation,
                      color: controller.selectedIndex.value == 1
                          ? Colors.white
                          : Colors.black,size: 24,),
                    onPressed: () {
                      controller.changeIndex(1);
                       Get.to(SendUserComplaintScreen());
                    },
                  ),
                  Positioned(
                    bottom: 0.1,
                    right: 1.w,
                    left: 0.1.w,
                    top: 7.6.w,
                    child: TextUtiles(
                      title:"complaint" ,
                      colorTextStyle: controller.selectedIndex.value == 1 ? AppColors.zayteGamiq:Colors.black87,
                      fontSize: 7.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(1.2.w),
            child: Container(
              decoration: BoxDecoration(
                color: controller.selectedIndex.value == 2
                    ? AppColors.zayteGamiq
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(3.w),
                  topRight: Radius.circular(3.w),
                  bottomRight: Radius.circular(3.w),
                  bottomLeft: Radius.circular(3.w),
                ),
              ),
              //Colors.yellowAccent,
              child: Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.insert_comment_rounded,
                      color: controller.selectedIndex.value == 2
                          ? Colors.white
                          : Colors.black,size: 25,),
                    onPressed: () {
                      controller.changeIndex(2);
                      feedbackController.fetchReviews(homeUserController.hallId_pub.toString());
                       Get.toNamed(SendFeedbackRatScreen.name);
                    },
                  ),
                  Positioned(
                    bottom: 0.1,
                    right: 1.w,
                    left: 0.2.w,
                    top: 7.5.w,
                    child: TextUtiles(
                      title: "comment",
                      colorTextStyle: controller.selectedIndex.value == 2 ? AppColors.zayteGamiq:Colors.black87,
                      fontSize: 8.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(1.2.w),
            child: Container(
              decoration: BoxDecoration(
                color: controller.selectedIndex.value == 3
                    ? AppColors.zayteGamiq
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(3.w),
                  topRight: Radius.circular(3.w),
                  bottomRight: Radius.circular(3.w),
                  bottomLeft: Radius.circular(3.w),
                ),
              ),
              //Colors.yellowAccent,
              child: Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.messenger_outline,
                        color: controller.selectedIndex.value == 3
                            ? Colors.white
                            : Colors.black),
                    onPressed: () {
                      controller.changeIndex(3);
                       Get.toNamed(ChatUserScreen.name);
                    },
                  ),
                  SizedBox(height: 1.w,),
                  Positioned(
                    bottom: 0,
                    right: 0.w,
                    left: 0.2.w,
                    top: 7.w,
                    child: TextUtiles(
                      title: "Message",
                      colorTextStyle: controller.selectedIndex.value == 3 ? AppColors.zayteGamiq:Colors.black87,
                      fontSize: 9,
                    ),
                  ),

                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(1.2.w),
            child: Container(
              decoration: BoxDecoration(
                color: controller.selectedIndex.value == 4
                    ? AppColors.zayteGamiq
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(3.w),
                  topRight: Radius.circular(3.w),
                  bottomRight: Radius.circular(3.w),
                  bottomLeft: Radius.circular(3.w),
                ),
              ),
              //Colors.yellowAccent,
              child: Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.local_police_outlined,
                        color: controller.selectedIndex.value == 4
                            ? Colors.white
                            : Colors.black),
                    onPressed: () {
                      controller.changeIndex(4);
                     Get.to(ViewHallPolicyScreen());
                    },
                  ),
                  SizedBox(height: 1.w,),
                  Positioned(
                    bottom: 0,
                    right: 0.w,
                    left: 2.w,
                    top: 7.5.w,
                    child: TextUtiles(
                      title: "policy",
                      colorTextStyle: controller.selectedIndex.value == 4 ? AppColors.zayteGamiq:Colors.black87,
                      fontSize: 9,
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class NavigaHallDetailsUserController extends GetxController {
  var selectedIndex = 0.obs; // تعيين Home كأيقونة افتراضية

  void changeIndex(int index) {
    selectedIndex.value = index; // تحديث الأيقونة المحددة
  }
}
