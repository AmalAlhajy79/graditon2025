import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../core/data_state/data_state.dart';
import '../../../../../../../core/handler/handler.dart';
import '../../../../myEmployees-hall-admin/data/data_source/myEmployees-hall-admin-data-source.dart';
import '../../../../myEmployees-hall-admin/presentation/controller/myEmployees-hallAdmin/myEmployees-hallAdmin-Controller.dart';
import '../../../data/data_source/notification-hall-admin-data-source.dart';
import '../../../data/models/notification-hallAdmin-model.dart';

class NotificationHallAdminController extends GetxController {

  var pendingUsers = <NotiAssistantData>[].obs;
  var isLoading = true.obs;

  final NotificationHallAdminDataSource dataSource=NotificationHallAdminDataSource();

  // PendingAssistantController(this.dataSource);

  @override
  void onInit() {
    fetchPendingUsers();
    super.onInit();
  }

  void fetchPendingUsers() async {
    try {
      isLoading(true);
      var userList = await dataSource.fetchPendingUsers();
      pendingUsers.assignAll(userList);
    } finally {
      isLoading(false);
    }
  }
  ApprovedAssistantController approvedAssistantController=Get.put(ApprovedAssistantController());
  void ApprovedAssistant(int id) async {
    try {
      isLoading(true);
      await dataSource.approvedAssistant(id);
      approvedAssistantController.fetchApprovedUsers();

    } finally {
      isLoading(false);
    }
  }
  void RejectedAssistant(int id) async {
    try {
      isLoading(true);
      await dataSource.rejectedAssistant(id);
      approvedAssistantController.fetchApprovedUsers();
    } finally {
      isLoading(false);
    }
  }
}
