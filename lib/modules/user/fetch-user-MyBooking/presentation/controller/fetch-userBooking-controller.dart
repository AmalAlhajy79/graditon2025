import 'package:get/get.dart';
import '../../data/data_source/fetch-userBooking-datasource.dart';
import '../../data/models/fetch-user-MyBooking-model.dart';

class FetchBookingUserHallController extends GetxController {
  var bookings = <UserMyBookingModel>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  final FetchUserBookingHallDataSource dataSource = FetchUserBookingHallDataSource();

  @override
  void onInit() {
    super.onInit();
    fetchBookings();
  }
var Pub_Id_Booking_request;
  Future<void> fetchBookings() async {
    try {
      isLoading(true);
      var fetchedBookings = await dataSource.fetchBookings();
      bookings.assignAll(fetchedBookings);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading(false);
    }
  }
  void delete_REquestBooking(int id) async {
    try {
      isLoading(true);
      await dataSource.delete_booking(id);
      fetchBookings();
    } finally {
      isLoading(false);
    }
  }
}
