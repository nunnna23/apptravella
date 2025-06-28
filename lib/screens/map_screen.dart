// // // map_screen.dart
// // import 'package:flutter/material.dart';
// // // تأكد من أن هذا الاستيراد يعمل وأن الحزمة مثبتة
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // // استيراد PlaceData (تأكد من المسار الصحيح)
// // import 'place_details_screen.dart' show PlaceData;

// // class MapScreen extends StatefulWidget {
// //   final PlaceData place;

// //   const MapScreen({super.key, required this.place});

// //   @override
// //   State<MapScreen> createState() => _MapScreenState();
// // }

// // class _MapScreenState extends State<MapScreen> {
// //   // --- متغيرات الحالة ---
// //   // قد تحتاج إلى جعل mapController قابلاً للإلغاء (nullable) أو استخدام late
// //   late GoogleMapController
// //       _mapController; // استخدام late يتطلب تهيئة في initState أو onMapCreated
// //   late LatLng _center;
// //   final Set<Marker> _markers = {};

// //   @override
// //   void initState() {
// //     super.initState();
// //     // تعيين المركز والعلامة بناءً على بيانات المكان المستلمة
// //     _center = LatLng(widget.place.latitude, widget.place.longitude);
// //     _addMarker();
// //   }

// //   // دالة يتم استدعاؤها عند إنشاء الخريطة
// //   void _onMapCreated(GoogleMapController controller) {
// //     _mapController = controller;
// //     // يمكنك القيام بأشياء أخرى هنا بعد تهيئة الخريطة، مثل تحريك الكاميرا
// //     _mapController.animateCamera(
// //       CameraUpdate.newCameraPosition(
// //         CameraPosition(target: _center, zoom: 14.0),
// //       ),
// //     );
// //   }

// //   // دالة لإضافة علامة (دبوس) على الخريطة
// //   void _addMarker() {
// //     // لا حاجة لـ setState هنا طالما أن _markers يتم تمريرها إلى GoogleMap widget
// //     // setState يتم استخدامها إذا كنت تريد تحديث الواجهة بسبب تغيير في الحالة
// //     // ولكن إضافة علامة قبل بناء الواجهة لا يتطلب إعادة بناء فوري
// //     _markers.add(
// //       Marker(
// //         markerId: MarkerId(widget.place.name), // معرف فريد للعلامة
// //         position: _center, // موقع العلامة
// //         infoWindow: InfoWindow(
// //           // نافذة معلومات تظهر عند النقر
// //           title: widget.place.name,
// //           snippet: widget.place.location, // يمكنك إضافة وصف قصير هنا
// //         ),
// //         icon: BitmapDescriptor.defaultMarker, // استخدام العلامة الافتراضية
// //       ),
// //     );
// //     // إذا كنت تريد التأكد من إعادة البناء بعد إضافة العلامة (نادراً ما يكون ضرورياً في initState)
// //     // if (mounted) { // Check if the widget is still in the tree
// //     //   setState(() {});
// //     // }
// //   }

// // ignore_for_file: unused_import, duplicate_ignore

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(widget.place.name),
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back),
// //           onPressed: () => Navigator.of(context).pop(),
// //         ),
// //       ),
// //       body: GoogleMap(
// //         onMapCreated: _onMapCreated,
// //         initialCameraPosition: CameraPosition(
// //           target: _center, // تحديد موقع الكاميرا الأولي
// //           zoom: 14.0, // تحديد مستوى التقريب الأولي
// //         ),
// //         markers: _markers, // مجموعة العلامات التي ستظهر على الخريطة
// //         mapType: MapType.normal, // نوع الخريطة (عادي، قمر صناعي، إلخ)
// //         // --- خيارات إضافية (اختياري) ---
// //         zoomControlsEnabled: true, // إظهار أزرار التحكم في التقريب
// //         zoomGesturesEnabled: true, // السماح بإيماءات التقريب
// //         myLocationEnabled: true, // محاولة إظهار موقع المستخدم (يتطلب إذن)
// //         myLocationButtonEnabled: true, // زر للذهاب لموقع المستخدم (يتطلب إذن)
// //         compassEnabled: true, // إظهار البوصلة
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:travella/screens/explore_screen.dart';
// import 'package:travella/services/api/dio_client.dart';
// import 'package:travella/models/place_data.dart';
// import 'package:travella/models/attraction.dart'; // استيراد Attraction

// class MapScreen extends StatefulWidget {
//   final PlaceData place;

//   const MapScreen({super.key, required this.place});

//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   late GoogleMapController _mapController;
//   late LatLng _center;
//   final Set<Marker> _markers = {};
//   late Future<Attraction> _placeFuture;

//   @override
//   void initState() {
//     super.initState();
//     _center = LatLng(widget.place.latitude, widget.place.longitude);
//     _addMarker();
//     _placeFuture = _fetchPlaceDetails();
//   }

//   Future<Attraction> _fetchPlaceDetails() async {
//     try {
//       final dioClient = DioClient();
//       if (widget.place.id != null) {
//         final response = await dioClient.getActivityById(widget.place.id!);
//         return Attraction.fromJson(response);
//       }
//       return Attraction(
//         name: widget.place.name,
//         location: widget.place.location,
//         imageUrl: widget.place.imageUrl,
//         rating: widget.place.rating,
//         reviewCount: widget.place.reviewCount,
//         description: widget.place.description,
//         facilities: widget.place.facilities,
//         price: widget.place.price,
//         latitude: widget.place.latitude,
//         longitude: widget.place.longitude,
//       );
//     } catch (e) {
//       print('Error fetching place details: $e');
//       return Attraction(
//         name: widget.place.name,
//         location: widget.place.location,
//         imageUrl: widget.place.imageUrl,
//         rating: widget.place.rating,
//         reviewCount: widget.place.reviewCount,
//         description: widget.place.description,
//         facilities: widget.place.facilities,
//         price: widget.place.price,
//         latitude: widget.place.latitude,
//         longitude: widget.place.longitude,
//       );
//     }
//   }

//   void _onMapCreated(GoogleMapController controller) {
//     _mapController = controller;
//     _mapController.animateCamera(
//       CameraUpdate.newCameraPosition(
//         CameraPosition(target: _center, zoom: 14.0),
//       ),
//     );
//   }

//   void _addMarker() {
//     _markers.add(
//       Marker(
//         markerId: MarkerId(widget.place.name),
//         position: _center,
//         infoWindow: InfoWindow(
//           title: widget.place.name,
//           snippet: widget.place.location,
//         ),
//         icon: BitmapDescriptor.defaultMarker,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.place.name),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ),
//       body: FutureBuilder<Attraction>(
//         future: _placeFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError || !snapshot.hasData) {
//             return const Center(child: Text('Error loading map data.'));
//           }
//           return GoogleMap(
//             onMapCreated: _onMapCreated,
//             initialCameraPosition: CameraPosition(
//               target: _center,
//               zoom: 14.0,
//             ),
//             markers: _markers,
//             mapType: MapType.normal,
//             zoomControlsEnabled: true,
//             zoomGesturesEnabled: true,
//             myLocationEnabled: true,
//             myLocationButtonEnabled: true,
//             compassEnabled: true,
//           );
//         },
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _mapController.dispose();
//     super.dispose();
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:apptravella/models/attraction.dart';
import 'package:apptravella/models/place_data.dart';
import 'package:apptravella/services/api/dio_client.dart';

class MapScreen extends StatefulWidget {
  final PlaceData place;

  const MapScreen({super.key, required this.place});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _mapController;
  late LatLng _center;
  final Set<Marker> _markers = {};
  late Future<Attraction> _placeFuture;

  @override
  void initState() {
    super.initState();
    _center = LatLng(widget.place.latitude, widget.place.longitude);
    _addMarker();
    _placeFuture = _fetchPlaceDetails();
  }

  Future<Attraction> _fetchPlaceDetails() async {
    try {
      final dioClient = DioClient();
      if (widget.place.id != null) {
        final response = await dioClient.getActivityById(widget.place.id!);
        return Attraction.fromJson(response);
      }
      return Attraction(
        name: widget.place.name,
        location: widget.place.location,
        imageUrl: widget.place.imageUrl,
        rating: widget.place.rating,
        reviewCount: widget.place.reviewCount,
        description: widget.place.description,
        facilities: widget.place.facilities,
        price: widget.place.price,
        latitude: widget.place.latitude,
        longitude: widget.place.longitude,
        imageUrls: [],
      );
    } catch (e) {
      print('Error fetching place details: $e');
      return Attraction(
        name: widget.place.name,
        location: widget.place.location,
        imageUrl: widget.place.imageUrl,
        rating: widget.place.rating,
        reviewCount: widget.place.reviewCount,
        description: widget.place.description,
        facilities: widget.place.facilities,
        price: widget.place.price,
        latitude: widget.place.latitude,
        longitude: widget.place.longitude,
        imageUrls: [],
      );
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _mapController.animateCamera(
      CameraUpdate.newCameraPosition(
          CameraPosition(target: _center, zoom: 14.0)),
    );
  }

  void _addMarker() {
    _markers.add(
      Marker(
        markerId: MarkerId(widget.place.name),
        position: _center,
        infoWindow: InfoWindow(
          title: widget.place.name,
          snippet: widget.place.location,
        ),
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.place.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: FutureBuilder<Attraction>(
        future: _placeFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError || !snapshot.hasData) {
            return const Center(child: Text('Error loading map data.'));
          }
          return GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 14.0,
            ),
            markers: _markers,
            mapType: MapType.normal,
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            compassEnabled: true,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }
}
