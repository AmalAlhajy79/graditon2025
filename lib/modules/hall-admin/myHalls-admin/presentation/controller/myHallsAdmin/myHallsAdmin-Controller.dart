
import 'package:get/get.dart';
import '../../../data/data_source/myHalls-admin-data-source.dart';
import '../../../data/models/myHallsAdmin-model.dart';

class MyHallAdminController extends GetxController {
  var halls = <MyHallSHallAdminModel>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  final MyHallSHallAdminDataSource _dataSource = MyHallSHallAdminDataSource();

  @override
  void onInit() {
    super.onInit();
    fetchHalls();
  }

  void fetchHalls() async {
    try {
      isLoading(true);
      var result = await _dataSource.getHalls();
      halls.assignAll(result);
    } catch (e) {
      errorMessage('Error: $e');
    } finally {
      isLoading(false);
    }
  }
}
