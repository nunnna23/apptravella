// // lib/services/prediction_service.dart

// // 1. تعريف الـ enum الذي يمثل أنواع الخدمات
// enum PredictionService { flights, hotels, carRental }

// // 2. تعريف الـ Map العام الذي سيحتوي على النتائج
// // هذا الـ Map سيكون متاحًا في أي مكان في التطبيق يتم فيه استيراد هذا الملف.
// final Map<PredictionService, String> predictionResults = {};
// 1. تعريف الـ enum الذي يمثل أنواع الخدمات
enum PredictionService { flights, hotels, carRental }

// 2. تعريف الـ Map العام الذي سيحتوي على النتائج
// هذا الـ Map سيكون متاحًا في أي مكان في التطبيق يتم فيه استيراد هذا الملف.
final Map<PredictionService, String> predictionResults = {};
