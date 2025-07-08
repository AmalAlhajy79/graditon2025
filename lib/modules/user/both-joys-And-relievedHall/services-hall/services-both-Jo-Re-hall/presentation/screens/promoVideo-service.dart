import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import 'package:video_player/video_player.dart';
import '../../../../../../../core/consts/api_const.dart';
import '../../../../../../../core/consts/app_colors.dart';
import '../../../../../../../core/core_components/app_scaffold.dart';
import '../../../../../../../core/core_components/button.dart';
import '../../../../../../../core/core_components/textUtiles.dart';
import '../controller/services-both-Jo-Re/services-both-Jo-Re-binding.dart';
import '../controller/services-both-Jo-Re/services-both-Jo-Re-hall-Controller.dart';

class PromoVideoServicesScreen extends GetView<BothJoysReHallController> {
  static const name = '/PromoVideoServicesScreen';
  static final page = GetPage(
      name: name,
      page: () => PromoVideoServicesScreen(),
      binding: BothJoysReHallBinding());
  final BothJoysReHallController controller =
  Get.put(BothJoysReHallController());

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<BothJoysReHallController>(() => BothJoysReHallController());
    var mq = MediaQuery.of(context).size;

    final promoVedioServices = controller.joysServices
        .where((service) => service.name.toLowerCase().contains('promo'))
        .toList();

    if (promoVedioServices.isEmpty) {
      return AppScaffold(
        body: Column(
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
                      color:AppColors.zayteFateh,
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
                              width: 20.w,
                            ),
                            TextUtiles(
                              title: "Promo service",
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
              padding:  EdgeInsets.only(top: 50.w),
              child: Center(
                child: TextUtiles(title: "the service not found.",fontSize: 17,fontWeight: FontWeight.w400,),
              ),
            ),
          ],
        ),
      );
    }

    final promoVedio = promoVedioServices.expand((service) => service.images).toList();
    final promoDescription = promoVedioServices.first.description;
    final promoPrice = promoVedioServices.first.servicePrice;
    final vedioPath = promoVedioServices.isNotEmpty
        ? ApiConst.urlImage + promoVedioServices[0].video!.videoPath
        : '';
    return AppScaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 1.w, right: 1.w),
        child: Container(
          height: mq.height,
          color: AppColors.zayteFateh,
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.1.w, right: 0.1.w),
                    child: Container(
                      height: mq.height * 0.58,
                      width: mq.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(7.w),
                            bottomRight: Radius.circular(7.w)),
                        color: Colors.grey.shade300,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 1.5.w,
                          right: 12.w,
                          bottom: 83.w,
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
                                  size: 23,
                                ),
                              ),

                              Padding(
                                padding:  EdgeInsets.only(left: 26.w,top: 1.w),
                                child: TextUtiles(
                                  title: "Promo video",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, top: 24.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          //height: 54.w,
                          width: mq.width * 0.73,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(9.w)),
                          ),
                          child: Container(
                            height: 69.w,
                           width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(7.w)),
                            ),
                            child: PromoVideoPlayer(videoUrl: vedioPath),
                            // child: ClipRRect(
                            //   borderRadius: BorderRadius.all(Radius.circular(7.w)),
                            //   child: Image.asset("assets/images/promo.png",
                            //     fit: BoxFit.fill,
                            //
                            //   ),
                            // ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.w, top: 6.w),
                child: Row(
                  children: [
                    Container(
                      height: 9.2.w,
                      width: 26.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4.w)),
                        color: Colors.white,
                      ),
                      child: Center(
                          child: TextUtiles(
                            title: "explain",
                            fontSize: 17,
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 6.6.w, top: 5.w,right: 2.w),
                child: Row(
                  children: [
                    Expanded(
                      child: TextUtiles(
                        title:promoDescription,
                        //"The bride\'s dress and groom\'s suit are in the hall, and the bride and groom are present an hour before the party to be photographed,and then the video is shown during the party.",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        colorTextStyle: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only( top: 12.w,right: 1.w),
                child: ButtonScreen(
                  title: '${promoPrice} \$',
                  onTap: () {},
                  colorTextStyle: Colors.white,
                  colorContainer: AppColors.zayteGamiq,
                  fontSize: 20,
                  height: 11.4.w,
                  weight: 87.w,
                  borderRadius: BorderRadius.all(Radius.zero),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class PromoVideoPlayer extends StatefulWidget {
  final String videoUrl;

  const PromoVideoPlayer({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _PromoVideoPlayerState createState() => _PromoVideoPlayerState();
}

class _PromoVideoPlayerState extends State<PromoVideoPlayer> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _isPlaying = true;
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (!_controller.value.isInitialized) return;
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _isPlaying = false;
      } else {
        _controller.play();
        _isPlaying = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Center(child: CircularProgressIndicator());
    }

    return Stack(
      children: [
        Container(
          width: double.infinity,
          child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),
        ),
        // زر شفاف كامل الفيديو للتحكم بالتشغيل والإيقاف
        Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: _togglePlayPause,
            child: Container(
              color: Colors.transparent,
              alignment: Alignment.center,
              // عرض أيقونة تشغيل/إيقاف في الوسط (اختياري)
              child: Icon(
                _isPlaying ? Icons.pause_circle_outline : Icons.play_circle_outline,
                color: Colors.white.withOpacity(0.2),
                size: 60,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// class PromoVideoPlayer extends StatefulWidget {
//   final String videoUrl;
//
//   const PromoVideoPlayer({Key? key, required this.videoUrl}) : super(key: key);
//
//   @override
//   _PromoVideoPlayerState createState() => _PromoVideoPlayerState();
// }
//
// class _PromoVideoPlayerState extends State<PromoVideoPlayer> {
//   late VideoPlayerController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(widget.videoUrl)
//       ..initialize().then((_) {
//         setState(() {});
//         _controller.play();
//       });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print('Loading video URL: ${widget.videoUrl}');
//
//     return _controller.value.isInitialized
//         ? AspectRatio(
//       aspectRatio: _controller.value.aspectRatio,
//       child: VideoPlayer(_controller),
//     )
//         : Center(child: CircularProgressIndicator());
//   }
// }
