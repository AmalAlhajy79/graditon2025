class ApiConst {
  static const _baseUrl ='http://192.168.43.31:8001/api'; //'http://192.168.1.103:8001/api';//'http://192.168.43.31:8001/api'; //'http://127.0.0.1:8001/api';
 // http://127.0.0.1:8001/api/Client/inquiry                                             //'http://192.168.43.31:8004/api';

  static const urlImage="http://192.168.43.31:8001/";
  static const userProfile = '$_baseUrl/profiles';
  static const storeuserProfile = '$userProfile';

  static String changePasswordAdmin_Hall ='$_baseUrl';

  static String loginHallAdmin ='$_baseUrl/login';

  static String loungeInformationHallAdmin='$_baseUrl/halls';

  static String vereficationAdmin_Hall='$_baseUrl';

  static String EditProfileAdmin_Hall='$_baseUrl';

  static String send_User_Review='$_baseUrl/Client/reviews';

  static String booking_user_hall='$_baseUrl/Booking/bookings';

  static String fetch_UserBookingHall='$_baseUrl/Client/myBookings';

  static String fetchUserReviews(String hallId)=>'$_baseUrl/halls/$hallId/reviews';

  static var fetchAll_Halls_User='$_baseUrl/halls';

  static String home_Hall_Admin(int hallId)=>'$_baseUrl/halls/$hallId';

  static String notificationAdmin_Hall='$_baseUrl';

  static String sendUserInquiry_hall='$_baseUrl/Client/inquiry';

  String fetchInquiries_response(int hallId) =>'$_baseUrl/Client/myInquiries/$hallId';

  static String register='$_baseUrl/register';

  static String getMyHallsAdmin='$_baseUrl/owner/myhall';

  static String fetchAssistant(int hall_id) => '$_baseUrl/halls/$hall_id/employees';

  static String fetchPendingAssistant='$_baseUrl/owner/getStaffReqs';

  static String updateproviderProfile(int id, String name, String email, String address, String phone_number) =>"";

  static String rejectedAssistant(int id) => '$_baseUrl/owner/staffReqs/$id';

  static String approvedAssistant(int id) => '$_baseUrl/owner/staffReqs/$id';

  static String deleteAssistant(int id) => '$_baseUrl/halls/employee/$id';

  static String fetch_user_detailsOneHall(int hallId) => '$_baseUrl/halls/$hallId';

  static String showtime_Booking(int hallId) => '$_baseUrl/showtime/$hallId';

  static String delete_booking(int id) => '$_baseUrl/Booking/bookings/$id/request-delete';

  static String user_ShowServices(int hallId) => '$_baseUrl/showserv/$hallId';
}
