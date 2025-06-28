// // // class AiApiEndpoints {
// // //   // Base URL للـ AI API (Budget Prediction)
// // //   static const String baseUrl =
// // //       ' https://travel-api-448864052725.us-central1.run.app/docs#/';
// // //   //  'https://travel-api-448864052725.us-central1.run.app';
// // // //baseUrl: 'https://travel-api-448864052725.us-central1.run.app',
// // //   // AI Prediction endpoints
// // //   static const String flightPrediction = '/Budget prediction/Flight';
// // //   static const String carRentalPrediction = '/Budget prediction/Car Rental';
// // //   static const String hotelPrediction =
// // //       '/Budget prediction/Hotel'; // أضفنا الـ endpoint ده
// // // }
// // // lib/services/api/ai_api_endpoints.dart
// // class AiApiEndpoints {
// //   // تعريف الـ Base URL لكل خدمة AI على حدة باستخدام Proxy
// //   static const String flightApiBaseUrl =
// //       'https://cors-anywhere.herokuapp.com/https://flight-api-service-285212035997.europe-north1.run.app';
// //   static const String hotelApiBaseUrl =
// //       'https://cors-anywhere.herokuapp.com/https://my-api-service-487381667778.europe-north1.run.app';
// //   static const String carRentalApiBaseUrl =
// //       'https://cors-anywhere.herokuapp.com/https://car-rental-api-22797554089.europe-north1.run.app';

// //   // تعريف الـ Endpoints لكل خدمة
// //   static const String flightPrediction = '/Flight';
// //   static const String hotelPrediction = '/Hotel';
// //   static const String carRentalPrediction = '/car_rental';
// // }
// class AiApiEndpoints {
//   // تعريف الـ Base URL لكل خدمة AI على حدة
//   // ملاحظة: إذا لم يكن بإمكانك إزالة cors-anywhere، أعدي إضافته كالتالي:
//   // static const String flightApiBaseUrl = 'https://cors-anywhere.herokuapp.com/https://flight-api-service-285212035997.europe-north1.run.app';
//   static const String flightApiBaseUrl =
//       'https://flight-api-service-285212035997.europe-north1.run.app';
//   static const String hotelApiBaseUrl =
//       'https://my-api-service-487381667778.europe-north1.run.app';
//   static const String carRentalApiBaseUrl =
//       'https://car-rental-api-22797554089.europe-north1.run.app';

//   // تعريف الـ Endpoints لكل خدمة
//   static const String flightPrediction = '/Flight';
//   static const String hotelPrediction = '/Hotel';
//   static const String carRentalPrediction = '/car_rental';
// // }
// class AiApiEndpoints {
//   // تعريف الـ Base URL لكل خدمة AI على حدة
//   static const String flightApiBaseUrl =
//       'https://flight-api-service-285212035997.europe-north1.run.app';
//   static const String hotelApiBaseUrl =
//       'https://my-api-service-487381667778.europe-north1.run.app';
//   static const String carRentalApiBaseUrl =
//       'https://car-rental-api-22797554089.europe-north1.run.app';
//   static const String recommendationApiBaseUrl =
//       'https://hotel-recommendation-api-257940199735.europe-north1.run.app';
//   static const String hotelRecommendation = '/Recommendations/';

//   // تعريف الـ Endpoints لكل خدمة
//   static const String flightPrediction = '/Flight';
//   static const String hotelPrediction = '/Hotel';
//   static const String carRentalPrediction = '/car_rental';
// }
class AiApiEndpoints {
  // تعريف الـ Base URL لكل خدمة AI على حدة
  static const String flightApiBaseUrl =
      'https://flight-api-service-285212035997.europe-north1.run.app';
  static const String hotelApiBaseUrl =
      'https://my-api-service-487381667778.europe-north1.run.app';
  static const String carRentalApiBaseUrl =
      'https://car-rental-api-22797554089.europe-north1.run.app';

  // Base URL هذا صحيح ومتطابق مع الصورة
  static const String recommendationApiBaseUrl =
      'https://hotel-recommendation-api-257940199735.europe-north1.run.app';

  // --- التعديل هنا ---
  // تم حذف علامة / من النهاية ليصبح متطابقًا مع الصورة
  static const String hotelRecommendation = '/Recommendations';

  // تعريف الـ Endpoints لكل خدمة
  static const String flightPrediction = '/Flight';
  static const String hotelPrediction = '/Hotel';
  static const String carRentalPrediction = '/car_rental';
}
