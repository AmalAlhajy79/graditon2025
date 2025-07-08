import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import '../../../../../../../core/consts/api_const.dart';
import '../../../../../../../core/consts/app_colors.dart';
import '../../../../../../../core/core_components/app_scaffold.dart';
import '../../../../../../../core/core_components/textUtiles.dart';
import '../../../services-hall/services-both-Jo-Re-hall/presentation/controller/services-both-Jo-Re/services-both-Jo-Re-binding.dart';
import '../components/joys-video-details.dart';
import '../controller/both-joys-relived-details-controller.dart';

class VedioJoysOrReleviedScreen extends GetView<BothDetailsJoysReHallController> {
  static const name = '/VedioJoysOrReleviedScreen';
  static final page = GetPage(
      name: name,
      page: () => VedioJoysOrReleviedScreen(),
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
                                width: 22.w,
                              ),
                              TextUtiles(
                                title: "video service",
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
                      Padding(
                        padding: EdgeInsets.only(left: 4.0.w, top: 3.0.w),
                        child: Row(
                          children: [
                            TextUtiles(title: "All videos", fontSize: 18.5),
                          ],
                        ),
                      ),
                      SizedBox(height: 3.w),
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

                              var videoToDisplay = typeHall == 'joys'
                                  ? controller.joysVideos
                                  : controller.sorrowsVideos;

                              if (videoToDisplay.isEmpty) {
                                return Padding(
                                  padding: EdgeInsets.only(top: 60.w),
                                  child: Center(child: Text("No video available")),
                                );
                              }

                              return
                                GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      crossAxisSpacing: 1.w,
                                      mainAxisSpacing: 1.w,
                                      mainAxisExtent: 110,
                                    ),
                                    itemCount: videoToDisplay.length,
                                    itemBuilder: (context, index) {
                                      final video = videoToDisplay[index];
                                      final videoPath = video.videoPath;
                                      return Padding(
                                        padding: EdgeInsets.only(right: 1.0.w, left: 0.5.w,),
                                        child: InkWell(
                                          onTap: (){
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => FullScreenVideoPage(
                                                  videoUrl: ApiConst.urlImage + videoPath,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(9.w),
                                                child: Container(
                                                  height: 43.w,
                                                  width: 43.w,
                                                  child: PromoVideoPlayer(
                                                    videoUrl: ApiConst.urlImage + videoPath,
                                                  ),
                                                ),
                                              ),

                                              SizedBox(width: 2.0.w),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(left: 0.5),
                                                    child: TextUtiles(
                                                      title: "New baby party for..",
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  SizedBox(height: 2.0),
                                                  Padding(
                                                    padding: EdgeInsets.only(left: 0.5),
                                                    child: TextUtiles(
                                                      title: "Today at 05:00 pm.",
                                                      fontSize: 11,
                                                      colorTextStyle: Colors.grey,
                                                    ),
                                                  ),
                                                  SizedBox(height: 1.0),
                                                  Padding(
                                                    padding: EdgeInsets.only(left: 0.5),
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.remove_red_eye_rounded,
                                                            color: Colors.grey, size: 16),
                                                        SizedBox(width: 1.0),
                                                        TextUtiles(
                                                          title: "1000 view",
                                                          fontSize: 10,
                                                          colorTextStyle: Colors.grey,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    });
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
