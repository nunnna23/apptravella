// class ApiEndpoints {
//   static const String baseUrl = 'http://travella.runasp.net/api';
//   static const String fastApiBaseUrl = 'http://127.0.0.1:8000';
//   static const String imageUrlBase = 'http://travella.runasp.net';

//   static const String login = '/Accounts/Login';
//   static const String register = '/Accounts/Register';
//   static const String forgotPassword = '/Accounts/ForgotPassword';
//   static const String verifyOtp = '/Accounts/VerifyOtp';
//   static const String resetPassword = '/Accounts/ChangePassword';
//   static const String deactivateAccount = '/Accounts/DeactivateAccount';
//   static const String reactivateAccount = '/Accounts/ReactivateAccount';
//   static const String deleteAccount = '/Accounts/DeleteAccount';
//   static const String logout = '/Accounts/logout';
//   static const String history = '/Accounts/history';
//   static const String points = '/Accounts/Points';
//   static const String createPreferences = '/Preference/CreatePreferences';
//   static const String updatePreferences = '/Preference/UpdatePreferences';
//   static const String getPreferences = '/Preference';
//   static const String recommendations = '$fastApiBaseUrl/Recommendations/';
//   static const String bookingList = '/Bookings';
//   static const String createBooking = '/Bookings/hotel';
//   static String updateBooking(int id) => '/Bookings/$id';
//   static String deleteBooking(int id) => '/Bookings/$id';
//   static const String sendNotification = '/Notification/send';
//   static const String getNotifications = '/Notification';
//   static const String updateNotificationSettings = '/Notification/settings';
//   static const String flights = '/Flights';
//   static const String flightSearch = '/Flights/search';
//   static const String flightFilter = '/Flights/filter';
//   static String flightById(int id) => '/Flights/$id';
//   static String deleteFlight(int id) => '/Flights/$id';
//   static const String Hotels = '/Hotels';
//   static const String getAllHotels = '/Hotels/GetAllHotels';
//   static const String hotelSearch = '/Hotels/search';
//   static String hotelById(int id) => '/Hotels/$id';
//   static const String hotelFilter = '/Hotels/Filter';
//   static String toggleFavorite(int id) => '/Hotels/favourite/$id';
//   static String compareHotels(int id1, int id2) => '/Hotels/compare/$id1/$id2';
//   static const String userFavorites = '/Hotels/Favourites';
//   static const String suggestions = '/Hotels/Suggestions';
//   static const String hotelDeals = '/Hotels/Deals';
//   static const String topRated = '/Hotels/TopRated';
//   static const String nearbyByLocation = '/Hotels/NearbyByLocation';
//   static const String userProfile = '/user/profile';
//   static const String userBookings = '/user/bookings';
//   static const String createCheckoutSession =
//       '/Payment/create-checkout-session';
//   static const String paymentSuccess = '/Payment/success';
//   static const String paymentCancel = '/Payment/cancel';
//   static const String paymentWebhook = '/Payment/webhook';
//   static const String initiatePayment = '/payments/initiate';
//   static const String verifyPayment = '/payments/verify';
//   static const String carRentalList = '/CarRental';
//   static String carRentalById(int id) => '/CarRental/$id';
//   static const String searchCarRentals = '/CarRental/search';
//   static const String filterCarRentals = '/CarRental/filter';
//   static const String availableCarRentals = '/CarRental/available';
//   static String deleteCarRental(int id) => '/CarRental/$id';
//   static const String taxiList = '/Taxi';
//   static String taxiById(int id) => '/Taxi/$id';
//   static const String searchTaxis = '/Taxi/search';
//   static const String filterTaxis = '/Taxi/filter';
//   static String availableTaxis(
//           String pickUpLocation, DateTime date, int adults, int children) =>
//       '/Taxi/available?pickupLocation=$pickUpLocation&date=${date.toIso8601String()}&adults=$adults&children=$children';
//   static const String activeBookings = '/Bookings/active';
//   static const String canceledBookings = '/Bookings/canceled';
//   static const String pastBookings = '/Bookings/past';
//   static String cancelBooking(int id) => '/Bookings/$id/cancel';
//   static const String activityList = '/Activity';
//   static String activityById(int id) => '$activityList/$id';
//   static const String exploreEgypt = '/Activity/ExploreEgypt';
//   static const String activityByLocation = '/Activity/ByLocation';
//   static String activityByLocationPath(String location) =>
//       '$activityByLocation/$location';
//   static const String citiesByCountry = '/Cities/ByCountry';
// }
class ApiEndpoints {
  static const String baseUrl = 'http://travella.runasp.net/api';
  static const String fastApiBaseUrl = 'http://127.0.0.1:8000';
  static const String imageUrlBase = 'http://travella.runasp.net';

  static const String login = '/Accounts/Login';
  static const String register = '/Accounts/Register';
  static const String forgotPassword = '/Accounts/ForgotPassword';
  static const String verifyOtp = '/Accounts/VerifyOtp';
  static const String resetPassword = '/Accounts/ChangePassword';
  static const String deactivateAccount = '/Accounts/DeactivateAccount';
  static const String reactivateAccount = '/Accounts/ReactivateAccount';
  static const String deleteAccount = '/Accounts/DeleteAccount';
  static const String logout = '/Accounts/logout';
  static const String history = '/Accounts/history';
  static const String points = '/Accounts/Points';
  static const String createPreferences = '/Preference/CreatePreferences';
  static const String updatePreferences = '/Preference/UpdatePreferences';
  static const String getPreferences = '/Preference';
  static const String recommendations = '$fastApiBaseUrl/Recommendations/';
  static const String bookingList = '/Bookings';
  static const String createBooking = '/Bookings/hotel';
  static String updateBooking(int id) => '/Bookings/$id';
  static String deleteBooking(int id) => '/Bookings/$id';
  static const String sendNotification = '/Notification/send';
  static const String getNotifications = '/Notification';
  static const String updateNotificationSettings = '/Notification/settings';
  static const String flights = '/Flights';
  static const String flightSearch = '/Flights/search';
  static const String flightFilter = '/Flights/filter';
  static String flightById(int id) => '/Flights/$id';
  static String deleteFlight(int id) => '/Flights/$id';
  static const String Hotels = '/Hotels';
  static const String getAllHotels = '/Hotels/GetAllHotels';
  static const String hotelSearch = '/Hotels/search';
  static String hotelById(int id) => '/Hotels/$id';
  static const String hotelFilter = '/Hotels/Filter';
  static String toggleFavorite(int id) => '/Hotels/favourite/$id';
  static String compareHotels(int id1, int id2) => '/Hotels/compare/$id1/$id2';
  static const String userFavorites = '/Hotels/Favourites';
  static const String suggestions = '/Hotels/Suggestions';
  static const String hotelDeals = '/Hotels/Deals';
  static const String topRated = '/Hotels/TopRated';
  static const String nearbyByLocation = '/Hotels/NearbyByLocation';
  static const String userProfile = '/user/profile';
  static const String userBookings = '/user/bookings';
  static const String createCheckoutSession =
      '/Payment/create-checkout-session';
  static const String paymentSuccess = '/Payment/success';
  static const String paymentCancel = '/Payment/cancel';
  static const String paymentWebhook = '/Payment/webhook';
  static const String initiatePayment = '/payments/initiate';
  static const String verifyPayment = '/payments/verify';
  static const String carRentalList = '/CarRental';
  static String carRentalById(int id) => '/CarRental/$id';
  static const String searchCarRentals = '/CarRental/search';
  static const String filterCarRentals = '/CarRental/filter';
  static const String availableCarRentals = '/CarRental/available';
  static String deleteCarRental(int id) => '/CarRental/$id';
  static const String taxiList = '/Taxi';
  static String taxiById(int id) => '/Taxi/$id';
  static const String searchTaxis = '/Taxi/search';
  static const String filterTaxis = '/Taxi/filter';
  static String availableTaxis(
          String pickUpLocation, DateTime date, int adults, int children) =>
      '/Taxi/available?pickupLocation=$pickUpLocation&date=${date.toIso8601String()}&adults=$adults&children=$children';
  static const String activeBookings = '/Bookings/active';
  static const String canceledBookings = '/Bookings/canceled';
  static const String pastBookings = '/Bookings/past';
  static String cancelBooking(int id) => '/Bookings/$id/cancel';
  static const String activityList = '/Activity';
  static String activityById(int id) => '$activityList/$id';
  static const String exploreEgypt = '/Activity/ExploreEgypt';
  static const String activityByLocation = '/Activity/ByLocation';
  static String activityByLocationPath(String location) =>
      '$activityByLocation/$location';
  static const String citiesByCountry = '/Cities/ByCountry';

  // إضافة النهاية الجديدة
  static const String createTaxiCheckoutSession =
      '/Payment/create-taxi-checkout-session';
  static const String createCarRentalCheckoutSession =
      '/Payment/create-carrental-checkout-session';
  static const String createFlightCheckoutSession =
      '/Payment/create-flight-checkout-session';
}
