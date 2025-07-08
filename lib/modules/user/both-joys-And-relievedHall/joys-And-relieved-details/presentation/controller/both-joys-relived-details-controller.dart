import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../home-user/presentation/controller/home-user-controller.dart';
import '../../data/data_source/details-oneHall-user-dataSource.dart';
import '../../data/models/details-oneHall-model.dart';

class BothDetailsJoysReHallController extends GetxController {
  var showListPhoto = true.obs;
  var isJoysSelected = true.obs; // للتحكم في زر joys

  void showListPhoto1() {
    showListPhoto.value = true;
    isJoysSelected.value = true; // تعيين حالة زر joys
  }

  void showListPhoto2() {
    showListPhoto.value = false;
    isJoysSelected.value = false; // تعيين حالة زر relieved
  }

  //video
  var showListVideo = true.obs;
  var isJoysSelectedVideo = true.obs; // للتحكم في زر joys

  void showListVideo1() {
    showListVideo.value = true;
    isJoysSelectedVideo.value = true; // تعيين حالة زر joys
  }

  void showListVideo2() {
    showListVideo.value = false;
    isJoysSelectedVideo.value = false; // تعيين حالة زر relieved
  }

  var isLoading = true.obs;
  var hallDetails = ViewDetailsOneHallModel().obs;
  var errorMessage = ''.obs;

   HallDetailsDataSource dataSource=HallDetailsDataSource();

  HomeUserController homeUserController=Get.put(HomeUserController());
  // controller.fetchHallDetails(homeUserController.hallId_pub);
  @override
  void onInit() {
    super.onInit();
    //fetchHallDetails(homeUserController.hallId_pub);
    // fetchEventImages(1);//1
    // fetchEventVideos(1);//1
  }

  Future<void> fetchHallDetails(int hallId) async {
    try {
      isLoading(true);
      var hallData = await dataSource.getHallDetails(hallId);
      print(hallData);
      hallDetails(hallData);
    } catch (e) {
      print('Error: $e');
      errorMessage('Error: $e');
    } finally {
      isLoading(false);
    }
  }


  //
  var joysImages = <EventImage>[].obs;
  var sorrowsImages = <EventImage>[].obs;
  final EventImageDataSource eventImageDataSource = EventImageDataSource();


  Future<void> fetchEventImages(int hallId) async {
    try {
      final images = await eventImageDataSource.fetchEventImages(hallId);
      joysImages.value = images.where((image) => image.eventType == 'joys').toList();
      sorrowsImages.value = images.where((image) => image.eventType == 'sorrows').toList();
    } catch (e) {
      print('Error fetching event images: $e');
    }
  }
  var joysVideos = <EventVideo>[].obs;
  var sorrowsVideos = <EventVideo>[].obs;
  final EventVideoDataSource eventVideoDataSource = EventVideoDataSource();


  Future<void> fetchEventVideos(int hallId) async {
    try {
      final videos = await eventVideoDataSource.fetchEventVideos(hallId);
      joysVideos.value = videos.where((video) => video.eventType == 'joys').toList();
      sorrowsVideos.value = videos.where((video) => video.eventType == 'sorrows').toList();
    } catch (e) {
      print('Error fetching event videos: $e');
    }
  }
}


