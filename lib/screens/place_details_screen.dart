// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:intl/intl.dart';
// import 'package:travella/screens/explore_screen.dart';
// import 'package:travella/services/api/api_endpoints.dart';

// class PlaceDetailsScreen extends StatefulWidget {
//   final Activity place;

//   const PlaceDetailsScreen({super.key, required this.place});

//   @override
//   State<PlaceDetailsScreen> createState() => _PlaceDetailsScreenState();
// }

// class _PlaceDetailsScreenState extends State<PlaceDetailsScreen> {
//   bool isFavorite = false;
//   bool isReadMore = false;
//   bool _showMap = false;
//   GoogleMapController? _mapController;
//   final Set<Marker> _markers = {};
//   late LatLng _center;

//   static const Color _primaryColor = Color(0xFF406F89);
//   static const Color _secondaryTextColor = Colors.grey;
//   static const double _imageBorderRadius = 25.0;

//   @override
//   void initState() {
//     super.initState();
//     _center = LatLng(widget.place.location.split(',').first.isNotEmpty
//         ? double.parse(widget.place.location.split(',').first)
//         : 0.0, // افتراضي، قم بتحسين تحويل الإحداثيات
//         widget.place.location.split(',').length > 1
//             ? double.parse(widget.place.location.split(',')[1])
//             : 0.0);
//     _addMarker();
//   }

//   String get formattedPrice {
//     final formatter = NumberFormat("#,##0", "en_US");
//     return 'EGP ${formatter.format(0)}'; // افتراضي، لأن السعر غير موجود في Activity
//   }

//   void _onMapCreated(GoogleMapController controller) {
//     _mapController = controller;
//     _mapController?.animateCamera(
//       CameraUpdate.newCameraPosition(
//         CameraPosition(target: _center, zoom: 14.0),
//       ),
//     );
//   }

//   void _addMarker() {
//     _markers.clear();
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
//     if (_showMap && mounted) {
//       setState(() {});
//     }
//   }

//   void _toggleMapVisibility() {
//     setState(() {
//       _showMap = !_showMap;
//       if (_showMap && _mapController != null) {
//         if (_markers.isEmpty) _addMarker();
//         _mapController?.animateCamera(
//           CameraUpdate.newCameraPosition(
//             CameraPosition(target: _center, zoom: 14.0),
//           ),
//         );
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: screenHeight * 0.4,
//                   width: double.infinity,
//                   child: ClipRRect(
//                     borderRadius: const BorderRadius.vertical(
//                         bottom: Radius.circular(_imageBorderRadius)),
//                     child: Image.network(
//                       '${ApiEndpoints.imageUrlBase}/${widget.place.imageUrls.isNotEmpty ? widget.place.imageUrls[0] : 'assets/images/placeholder.jpg'}',
//                       fit: BoxFit.cover,
//                       errorBuilder: (context, error, stackTrace) => Container(
//                           color: Colors.grey[300],
//                           child: const Center(
//                               child: Icon(Icons.broken_image,
//                                   color: Colors.grey, size: 50))),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Expanded(
//                             child: Text(
//                               widget.place.name,
//                               style: const TextStyle(
//                                   fontSize: 22, fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           const SizedBox(width: 10),
//                           TextButton(
//                             onPressed: _toggleMapVisibility,
//                             style: TextButton.styleFrom(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 0, vertical: 4),
//                                 visualDensity: VisualDensity.compact,
//                                 foregroundColor: _primaryColor),
//                             child: Text(_showMap ? 'Hide map' : 'Show map',
//                                 style: const TextStyle(
//                                     fontWeight: FontWeight.w500)),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 6),
//                       Row(
//                         children: [
//                           Icon(Icons.star, color: Colors.amber[600], size: 18),
//                           const SizedBox(width: 4),
//                           Text('${widget.place.rate}',
//                               style: const TextStyle(
//                                   fontSize: 14, fontWeight: FontWeight.bold)),
//                           const SizedBox(width: 4),
//                           Text('(${0} Reviews)', // افتراضي، لأن عدد المراجعات غير موجود
//                               style: const TextStyle(
//                                   fontSize: 13, color: _secondaryTextColor)),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 const Divider(
//                     height: 1, thickness: 1, indent: 16, endIndent: 16),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 16.0, vertical: 8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         widget.place.description,
//                         style: TextStyle(
//                             fontSize: 14, color: Colors.grey[700], height: 1.4),
//                         maxLines: isReadMore ? null : 5,
//                         overflow: isReadMore
//                             ? TextOverflow.visible
//                             : TextOverflow.ellipsis,
//                       ),
//                       if (widget.place.description.length > 150)
//                         InkWell(
//                           onTap: () => setState(() => isReadMore = !isReadMore),
//                           child: Padding(
//                               padding: const EdgeInsets.only(top: 8.0),
//                               child: Text(
//                                   isReadMore ? 'Read less' : 'Read more',
//                                   style: const TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.bold,
//                                       color: _primaryColor))),
//                         ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 AnimatedSwitcher(
//                   duration: const Duration(milliseconds: 400),
//                   transitionBuilder:
//                       (Widget child, Animation<double> animation) {
//                     return FadeTransition(opacity: animation, child: child);
//                   },
//                   child: _showMap
//                       ? _buildMapView(key: const ValueKey('mapView'))
//                       : Container(key: const ValueKey('placeholderMap')),
//                 ),
//                 const SizedBox(height: 40),
//               ],
//             ),
//           ),
//           Positioned(
//               top: MediaQuery.of(context).padding.top + 10,
//               left: 10,
//               child: _buildAppBarButton(
//                   icon: Icons.arrow_back,
//                   onPressed: () => Navigator.of(context).pop())),
//           Positioned(
//               top: MediaQuery.of(context).padding.top + 10,
//               right: 10,
//               child: _buildAppBarButton(
//                   icon: isFavorite ? Icons.favorite : Icons.favorite_border,
//                   color: isFavorite ? Colors.redAccent : Colors.white,
//                   onPressed: () {
//                     setState(() => isFavorite = !isFavorite);
//                   })),
//         ],
//       ),
//     );
//   }

//   Widget _buildMapView({Key? key}) {
//     return Column(
//       key: key,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Padding(
//           padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 10.0),
//           child: Text('Location Map',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//         ),
//         Container(
//           height: 250,
//           margin: const EdgeInsets.symmetric(horizontal: 16.0),
//           decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child: GoogleMap(
//               onMapCreated: _onMapCreated,
//               initialCameraPosition: CameraPosition(
//                 target: _center,
//                 zoom: 14.0,
//               ),
//               markers: _markers,
//               mapType: MapType.normal,
//               myLocationButtonEnabled: false,
//               zoomControlsEnabled: false,
//               scrollGesturesEnabled: true,
//               tiltGesturesEnabled: false,
//               rotateGesturesEnabled: true,
//             ),
//           ),
//         ),
//         const SizedBox(height: 16),
//       ],
//     );
//   }

//   Widget _buildAppBarButton(
//       {required IconData icon, VoidCallback? onPressed, Color? color}) {
//     return Container(
//         decoration: BoxDecoration(
//             color: Colors.black.withOpacity(0.4), shape: BoxShape.circle),
//         child: IconButton(
//             icon: Icon(icon, color: color ?? Colors.white, size: 22),
//             onPressed: onPressed,
//             constraints: const BoxConstraints(),
//             padding: const EdgeInsets.all(8)));
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:apptravella/models/activity.dart';
import 'package:apptravella/models/place_data.dart';
// import 'package:travella/screens/map_screen.dart';
import 'package:apptravella/services/api/api_endpoints.dart';
// import 'package:travella/services/api/dio_client.dart';

class PlaceDetailsScreen extends StatefulWidget {
  final dynamic place; // يدعم Activity أو PlaceData

  const PlaceDetailsScreen({super.key, required this.place});

  @override
  State<PlaceDetailsScreen> createState() => _PlaceDetailsScreenState();
}

class _PlaceDetailsScreenState extends State<PlaceDetailsScreen> {
  bool isFavorite = false;
  bool isReadMore = false;
  bool _showMap = false;
  GoogleMapController? _mapController;
  final Set<Marker> _markers = {};
  late LatLng _center;

  static const Color _primaryColor = Color(0xFF406F89);
  static const Color _secondaryTextColor = Colors.grey;
  static const double _imageBorderRadius = 25.0;

  @override
  void initState() {
    super.initState();
    // استخدام الإحداثيات من PlaceData إذا كان موجودًا، أو افتراضي إذا لم يكن
    _center = LatLng(
      widget.place is PlaceData
          ? widget.place.latitude
          : 30.0444, // إحداثيات افتراضية لمصر (القاهرة)
      widget.place is PlaceData
          ? widget.place.longitude
          : 31.2357, // إحداثيات افتراضية لمصر (القاهرة)
    );
    _addMarker();
  }

  String get formattedPrice {
    final formatter = NumberFormat("#,##0", "en_US");
    return widget.place is PlaceData
        ? 'EGP ${formatter.format(widget.place.price)}'
        : 'EGP ${formatter.format(0)}'; // افتراضي إذا لم يكن هناك سعر
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: _center, zoom: 14.0),
      ),
    );
  }

  void _addMarker() {
    _markers.clear();
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
    if (_showMap && mounted) {
      setState(() {});
    }
  }

  void _toggleMapVisibility() {
    setState(() {
      _showMap = !_showMap;
      if (_showMap && _mapController != null) {
        if (_markers.isEmpty) _addMarker();
        _mapController?.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: _center, zoom: 14.0),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final place = widget.place;
    final rating = place is Activity ? place.rate : (place as PlaceData).rating;
    final reviewCount = place is Activity
        ? 0
        : (place as PlaceData).reviewCount; // افتراضي إذا لم يكن موجودًا
    final description = place.description;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight * 0.4,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(_imageBorderRadius)),
                    child: Image.network(
                      '${ApiEndpoints.imageUrlBase}/${place.imageUrls.isNotEmpty ? place.imageUrls[0] : (place is PlaceData ? place.imageUrl : 'assets/images/placeholder.jpg')}',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.grey[300],
                        child: const Center(
                          child: Icon(Icons.broken_image,
                              color: Colors.grey, size: 50),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              place.name,
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            onPressed: _toggleMapVisibility,
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 4),
                              visualDensity: VisualDensity.compact,
                              foregroundColor: _primaryColor,
                            ),
                            child: Text(
                              _showMap ? 'Hide map' : 'Show map',
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber[600], size: 18),
                          const SizedBox(width: 4),
                          Text(
                            '$rating',
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '($reviewCount Reviews)',
                            style: const TextStyle(
                                fontSize: 13, color: _secondaryTextColor),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        formattedPrice,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: _primaryColor),
                      ),
                    ],
                  ),
                ),
                const Divider(
                    height: 1, thickness: 1, indent: 16, endIndent: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        description,
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey[700], height: 1.4),
                        maxLines: isReadMore ? null : 5,
                        overflow: isReadMore
                            ? TextOverflow.visible
                            : TextOverflow.ellipsis,
                      ),
                      if (description.length > 150)
                        InkWell(
                          onTap: () => setState(() => isReadMore = !isReadMore),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              isReadMore ? 'Read less' : 'Read more',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: _primaryColor,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: _showMap
                      ? _buildMapView(key: const ValueKey('mapView'))
                      : Container(key: const ValueKey('placeholderMap')),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 10,
            child: _buildAppBarButton(
              icon: Icons.arrow_back,
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            right: 10,
            child: _buildAppBarButton(
              icon: isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.redAccent : Colors.white,
              onPressed: () {
                setState(() => isFavorite = !isFavorite);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapView({Key? key}) {
    return Column(
      key: key,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 10.0),
          child: Text('Location Map',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        Container(
          height: 250,
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 14.0,
              ),
              markers: _markers,
              mapType: MapType.normal,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              scrollGesturesEnabled: true,
              tiltGesturesEnabled: false,
              rotateGesturesEnabled: true,
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildAppBarButton({
    required IconData icon,
    VoidCallback? onPressed,
    Color? color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: color ?? Colors.white, size: 22),
        onPressed: onPressed,
        constraints: const BoxConstraints(),
        padding: const EdgeInsets.all(8),
      ),
    );
  }
}
