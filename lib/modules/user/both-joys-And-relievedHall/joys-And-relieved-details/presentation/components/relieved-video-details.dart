import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/core_components/textUtiles.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import 'package:video_player/video_player.dart';
import '../../../../../../../core/consts/app_colors.dart';
import '../../../../../../core/consts/api_const.dart';
import '../controller/both-joys-relieved-detail-pinding.dart';
import '../controller/both-joys-relived-details-controller.dart';

//نهائي قسم الافراح
class BothRelivedVideoScreen extends GetView<BothDetailsJoysReHallController> {
  static const name = '/BothRelivedVideoScreen';
  static final page = GetPage(
      name: name,
      page: () => BothRelivedVideoScreen(),
      binding: BothDetailsJoysReHallBinding());

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: 28.w, right: 3.w, left: 3.w),
      child: Container(
        height: mq.height * 20,
        width: mq.width * 45,
        decoration: BoxDecoration(color: AppColors.white),
        child: Column(
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
              // color: Colors.red,
              child: Obx(() {
                if (controller.joysVideos.isEmpty) {
                  return Center(child: Text("No videos available"));
                }
                return
                  ListView(
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
                        mainAxisSpacing: 1.w,
                        mainAxisExtent: 110,
                      ),
                      itemCount:controller.sorrowsVideos.length, //2,
                      itemBuilder: (context, index) {
                        final video = controller.sorrowsVideos[index];
                        final videoPath = video.videoPath;
                        return Padding(
                          padding: EdgeInsets.only(
                              right: 1.w, left: 1.w, bottom: 2.w),
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
                                  borderRadius: BorderRadius.circular(8.w),
                                  child: Container(
                                    height: 43.w,
                                    width: 43.w,
                                    child: PromoVideoPlayer(
                                      videoUrl: ApiConst.urlImage + videoPath,
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
                                      padding:EdgeInsets.only(left: 0.5.w),
                                      child: TextUtiles(
                                        title: "New baby party for..",
                                        fontSize: 15,
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
                                          colorTextStyle: Colors.grey),
                                    ),
                                    SizedBox(
                                      height: 1.w,
                                    ),
                                    Padding(
                                      padding:EdgeInsets.only(left: 0.5.w),
                                      child: Row(
                                        children: [
                                          Icon(Icons.remove_red_eye_rounded,color: Colors.grey,size: 16,),
                                          SizedBox(width: 1.w,),
                                          TextUtiles(
                                              title: "1000 view",
                                              fontSize: 10,
                                              colorTextStyle: Colors.grey
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
                      })
                ],
              );
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
