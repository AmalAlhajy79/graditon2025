import 'package:get/get.dart';
import '../../../../home-hall-admin/presentation/controller/home-hall-admin/home-hall-admin-Controller.dart';
import '../../../../notification-hall-admin/data/data_source/notification-hall-admin-data-source.dart';
import '../../../../notification-hall-admin/data/models/notification-hallAdmin-model.dart';
import '../../../data/data_source/myEmployees-hall-admin-data-source.dart';
import '../../../data/models/myEmployees-hallAdmin-model.dart';

class ApprovedAssistantController extends GetxController {
  var approvedUsers = <AssistantData>[].obs;
  var isLoading = true.obs;

  final MyEmployeesHallAdminDataSource dataSource=MyEmployeesHallAdminDataSource();
  HallDetailsAdminController hallDetailsAdminController=Get.find();
  // ApprovedAssistantController(this.dataSource);
// int hall_id=0;
  @override
  void onInit() {
   // fetchApprovedUsers();
    super.onInit();
    //fetchApprovedUsers();
  }

  NotificationHallAdminDataSource notificationHallAdminDataSource=NotificationHallAdminDataSource();
  Future<List<NotiAssistantData>> fetchIdHall() async {
    final users = await notificationHallAdminDataSource.fetchUsers();
    return users.toList();
  }
  Future<void> fetchApprovedUsers() async {
    print("hallDetailsAdminController.hallId_public in fetchApprovedUsers()....MyEmploys..\n");
    print(hallDetailsAdminController.hallId_public);
    try {
      isLoading(true);
      var userList = await dataSource.fetchApprovedAssistant(hallDetailsAdminController.hallId_public);//(2);
      approvedUsers.assignAll(userList);
    } finally {
      isLoading(false);
    }
  }


  void delete_Assistant(int id) async {
    try {
      isLoading(true);
      await dataSource.deleteAssistant(id);
    } finally {
      isLoading(false);
    }
  }
}
