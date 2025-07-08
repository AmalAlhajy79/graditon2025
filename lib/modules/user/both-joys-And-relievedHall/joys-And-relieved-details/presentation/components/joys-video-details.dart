import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/consts/api_const.dart';
import 'package:hall_gradition/core/core_components/textUtiles.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import 'package:video_player/video_player.dart';

import '../../../services-hall/services-both-Jo-Re-hall/presentation/screens/promoVideo-service.dart';
import '../controller/both-joys-relieved-detail-pinding.dart';
import '../controller/both-joys-relived-details-controller.dart';

class BothJoysVideoScreen extends GetView<BothDetailsJoysReHallController> {
  static const name = '/BothJoysVideoScreen';
  static final page = GetPage(
      name: name,
      page: () => BothJoysVideoScreen(),
      binding: BothDetailsJoysReHallBinding());

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return
      Padding(
      padding: EdgeInsets.only(top: 29.0.w, right: 3.0.w, left: 3.0.w),
      child: Container(
        height: mq.height * 20,
        width: mq.width * 45,
        decoration: BoxDecoration(color: Colors.white),
        child:
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 3.0.w, top: 3.0.w),
              child: Row(
                children: [
                  TextUtiles(title: "All videos", fontSize: 18.5),
                ],
              ),
            ),
            SizedBox(height: 2.w),
            Container(
              height: mq.height * 0.73,
              width: mq.width * 0.90,
              child: Obx(() {
                if (controller.joysVideos.isEmpty) {
                  return Center(child: Text("No videos available"));
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
                  itemCount: controller.joysVideos.length,
                  itemBuilder: (context, index) {
                    final video = controller.joysVideos[index];
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
            ),
          ],
        ),
      ),
    );
  }
}
class FullScreenVideoPage extends StatelessWidget {
  final String videoUrl;

  const FullScreenVideoPage({Key? key, required this.videoUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: PromoVideoPlayer(videoUrl: videoUrl, isFullScreen: true),
        ),
      ),
    );
  }
}

class PromoVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final bool isFullScreen;

  const PromoVideoPlayer({Key? key, required this.videoUrl, this.isFullScreen = false}) : super(key: key);

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
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
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

    return GestureDetector(
      onTap: _togglePlayPause,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
            aspectRatio: widget.isFullScreen
                ? _controller.value.aspectRatio
                : 16 / 9,
            child: VideoPlayer(_controller),
          ),
          Icon(
            _isPlaying ? Icons.pause_circle : Icons.play_circle,
            size: 60,
            color: Colors.white.withOpacity(0.7),
          ),
        ],
      ),
    );
  }
}


// class BothJoysVideoScreen extends GetView<BothDetailsJoysReHallController> {
//   static const name = '/BothJoysVideoScreen';
//   static final page = GetPage(
//       name: name,
//       page: () => BothJoysVideoScreen(),
//       binding: BothDetailsJoysReHallBinding());
//
//   @override
//   Widget build(BuildContext context) {
//     var mq = MediaQuery.of(context).size;
//     return Padding(
//       padding: EdgeInsets.only(top: 29.0.w, right: 3.0.w, left: 3.0.w),
//       child: Container(
//         height: mq.height * 20,
//         width: mq.width * 45,
//         decoration: BoxDecoration(color: Colors.white),
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.only(left: 3.0.w, top: 1.0.w),
//               child: Row(
//                 children: [
//                   TextUtiles(title: "All videos", fontSize: 18.5),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height:3.0.w,
//             ),
//             Container(
//               height: mq.height * 0.73,
//               width: mq.width * 0.90,
//               child: Obx(() {
//                 if (controller.joysVideos.isEmpty) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//                 return ListView.builder(
//                   itemCount: controller.joysVideos.length,
//                   itemBuilder: (context, index) {
//                     final video = controller.joysVideos[index];
//                     final videoPath = video.videoPath;
//                     return Padding(
//                       padding: EdgeInsets.only(right: 1.0.w, left: 0.5.w, bottom: 2.0.w),
//                       child: Row(
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               showDialog(
//                                 context: context,
//                                 builder: (context) {
//                                   return FullScreenVideoDialog(videoUrl:ApiConst.urlImage+videoPath);
//                                 },
//                               );
//                             },
//                             child: Container(
//                               height: 35.w,
//                               width: 43.w,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.all(Radius.circular(9.w)),
//                               ),
//                               child: ClipRRect(
//                             borderRadius: BorderRadius.circular(9.w),
//                       child: PromoVideoPlayer(
//                         videoUrl: ApiConst.urlImage + videoPath,
//                       ),
//                     ),
//
//                     // PromoVideoPlayer(
//                               //   videoUrl: ApiConst.urlImage + videoPath,
//                               // ),
//                             ),
//                           ),
//
//                           // Container(
//                           //   height: 45.0,
//                           //   width: 43.0,
//                           //   decoration: BoxDecoration(
//                           //     borderRadius: BorderRadius.all(Radius.circular(9)),
//                           //   ),
//                           //   child: PromoVideoPlayer(videoUrl: ApiConst.urlImage+videoPath),
//                           // ),
//                           SizedBox(
//                             width: 2.0,
//                           ),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.only(left: 0.5),
//                                 child: TextUtiles(
//                                   title: "New baby party for..",
//                                   fontSize: 15,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 2.0,
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(left: 0.5),
//                                 child: TextUtiles(
//                                   title: "Today at 05:00 pm.",
//                                   fontSize: 11,
//                                   colorTextStyle: Colors.grey,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 1.0,
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(left: 0.5),
//                                 child: Row(
//                                   children: [
//                                     Icon(
//                                       Icons.remove_red_eye_rounded,
//                                       color: Colors.grey,
//                                       size: 16,
//                                     ),
//                                     SizedBox(
//                                       width: 1.0,
//                                     ),
//                                     TextUtiles(
//                                       title: "1000 view",
//                                       fontSize: 10,
//                                       colorTextStyle: Colors.grey,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// class FullScreenVideoPage extends StatelessWidget {
//   final String videoUrl;
//
//   const FullScreenVideoPage({Key? key, required this.videoUrl}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Center(
//           child: PromoVideoPlayer(videoUrl: videoUrl, isFullScreen: true),
//         ),
//       ),
//     );
//   }
// }

// class PromoVideoPlayer extends StatefulWidget {
//   final String videoUrl;
//   final bool isFullScreen;
//
//   const PromoVideoPlayer({Key? key, required this.videoUrl, this.isFullScreen = false}) : super(key: key);
//
//   @override
//   _PromoVideoPlayerState createState() => _PromoVideoPlayerState();
// }
//
// class _PromoVideoPlayerState extends State<PromoVideoPlayer> {
//   late VideoPlayerController _controller;
//   bool _isPlaying = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(widget.videoUrl)
//       ..initialize().then((_) {
//         setState(() {});
//       });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   void _togglePlayPause() {
//     setState(() {
//       if (_controller.value.isPlaying) {
//         _controller.pause();
//         _isPlaying = false;
//       } else {
//         _controller.play();
//         _isPlaying = true;
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (!_controller.value.isInitialized) {
//       return Center(child: CircularProgressIndicator());
//     }
//
//     return GestureDetector(
//       onTap: _togglePlayPause,
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           AspectRatio(
//             aspectRatio: _controller.value.aspectRatio,
//             child: VideoPlayer(_controller),
//           ),
//           Icon(
//             _isPlaying ? Icons.pause_circle : Icons.play_circle,
//             size: 60,
//             color: Colors.white.withOpacity(0.7),
//           ),
//         ],
//       ),
//     );
//   }
// }

// //نهائي قسم الافراح
// class BothJoysVideoScreen extends GetView<BothDetailsJoysReHallController> {
//   static const name = '/BothJoysVideoScreen';
//   static final page = GetPage(
//       name: name,
//       page: () => BothJoysVideoScreen(),
//       binding: BothDetailsJoysReHallBinding());
//
//   @override
//   Widget build(BuildContext context) {
//     var mq = MediaQuery.of(context).size;
//     return Padding(
//       padding: EdgeInsets.only(top: 28.w, right: 3.w, left: 3.w),
//       child: Container(
//         height: mq.height * 20,
//         width: mq.width * 45,
//         decoration: BoxDecoration(color: AppColors.white),
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.only(left: 3.w, top: 1.w),
//               child: Row(
//                 children: [
//                   TextUtiles(title: "All videos", fontSize: 17.5),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 2.w,
//             ),
//             Container(
//               height: mq.height * 0.73,
//               width: mq.width * 0.90,
//               // color: Colors.red,
//               child: ListView(
//                 children: [
//                   //what  occasion?
//                   SizedBox(
//                     height: 1.w,
//                   ),
//                   GridView.builder(
//                       physics: NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 1,
//                         crossAxisSpacing: 1.w,
//                         mainAxisSpacing: 2.w,
//                         mainAxisExtent: 120,
//                       ),
//                       itemCount: 3,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: EdgeInsets.only(
//                               right: 1.w, left: 0.5.w, bottom: 2.w),
//                           child: Row(
//                             children: [
//                               Container(
//                                 height: 45.w,
//                                 width: 43.w,
//                                 decoration: BoxDecoration(
//                                   // color: Colors.cyanAccent,
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(9)),
//                                   image: DecorationImage(
//                                     image: AssetImage(
//                                         'assets/images/aminhall.jpg'),
//                                     // استبدل بالصور المناسبة
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 2.w,
//                               ),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Padding(
//                                     padding:EdgeInsets.only(left: 0.5.w),
//                                     child: TextUtiles(
//                                       title: "New baby party for..",
//                                       fontSize: 15,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 2.w,
//                                   ),
//                                   Padding(
//                                     padding:EdgeInsets.only(left: 0.5.w),
//                                     child: TextUtiles(
//                                         title: "Today at 05:00 pm.",
//                                         fontSize: 11,
//                                         colorTextStyle: Colors.grey),
//                                   ),
//                                   SizedBox(
//                                     height: 1.w,
//                                   ),
//                                   Padding(
//                                     padding:EdgeInsets.only(left: 0.5.w),
//                                     child: Row(
//                                       children: [
//                                         Icon(Icons.remove_red_eye_rounded,color: Colors.grey,size: 16,),
//                                         SizedBox(width: 1.w,),
//                                         TextUtiles(
//                                           title: "1000 view",
//                                           fontSize: 10,
//                                             colorTextStyle: Colors.grey
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         );
//                       })
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
