
import 'dart:convert';

import '../../../../../../core/consts/api_const.dart';
import '../../../../../../core/network/network_helper.dart';
import '../models/notification-hallAdmin-model.dart';
class NotificationHallAdminDataSource{
  int idAssist=0;
  Future<List<NotiAssistantData>> fetchUsers() async {
    final response = await NetworkHelper().get(ApiConst.fetchPendingAssistant); // استبدل بـ URL الخاص بك
    if (response.statusCode == 200) {
      List<NotiAssistantData> users = (response.data as List)
          .map((user) => NotiAssistantData.fromJson(user))
          .toList();
      return users;
    } else {
      throw Exception('Failed to load MyEmployees');
    }
  }

  Future<List<NotiAssistantData>> fetchPendingUsers() async {
    final users = await fetchUsers();
    return users.where((user) => user.status == 'pending').toList();
  }

  Future<void> rejectedAssistant(int id)async{
    final response = await NetworkHelper().reject(ApiConst.rejectedAssistant(id), body: {
      'status': 'rejected',
    },);
    if(response.statusCode==200){
      print('reject Assistint succisfuly..');
    }else{
      print('error when reject Assistint ..');
    }
  }
  Future<void> approvedAssistant(int id)async{
    final response = await NetworkHelper().approved(ApiConst.approvedAssistant(id),body: {
      'status': 'approved',
    },);
    if(response.statusCode==200){
      print('approved Assistint succisfuly..');
    }else{
      print('error when approved Assistint ..');
    }
  }
}