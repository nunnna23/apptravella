// // import 'package:flutter/material.dart';

// // class FavoriteHotelCard extends StatelessWidget {
// //   final String hotelName;
// //   final String location;
// //   final double rating;
// //   final String price;
// //   final String imageUrl;

// //   const FavoriteHotelCard({
// //     super.key,
// //     required this.hotelName,
// //     required this.location,
// //     required this.rating,
// //     required this.price,
// //     required this.imageUrl,
// //     required bool isFavorite,
// //     required void Function() onTapFavorite,
// //     required Null Function() onTap,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Card(
// //       margin: const EdgeInsets.only(bottom: 16.0),
// //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //       elevation: 3,
// //       child: Row(
// //         children: [
// //           ClipRRect(
// //             borderRadius: const BorderRadius.only(
// //               topLeft: Radius.circular(12),
// //               bottomLeft: Radius.circular(12),
// //             ),
// //             child: Image.asset(
// //               imageUrl,
// //               height: 120,
// //               width: 100,
// //               fit: BoxFit.cover,
// //               errorBuilder: (context, error, stackTrace) {
// //                 return Container(
// //                   height: 120,
// //                   width: 100,
// //                   color: Colors.grey[300],
// //                   child: const Icon(Icons.broken_image,
// //                       color: Colors.grey, size: 40),
// //                 );
// //               },
// //             ),
// //           ),
// //           const SizedBox(width: 12),
// //           Expanded(
// //             child: Padding(
// //               padding: const EdgeInsets.symmetric(vertical: 8.0),
// //               child: Stack(
// //                 children: [
// //                   Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       Text(
// //                         hotelName,
// //                         style: const TextStyle(
// //                           fontWeight: FontWeight.bold,
// //                           fontSize: 16,
// //                         ),
// //                         maxLines: 2,
// //                         overflow: TextOverflow.ellipsis,
// //                       ),
// //                       const SizedBox(height: 6),
// //                       Row(
// //                         children: [
// //                           Icon(Icons.location_on,
// //                               size: 14, color: Colors.grey[600]),
// //                           const SizedBox(width: 4),
// //                           Expanded(
// //                             child: Text(
// //                               location,
// //                               style: TextStyle(
// //                                   fontSize: 12, color: Colors.grey[600]),
// //                               overflow: TextOverflow.ellipsis,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                       const SizedBox(height: 8),
// //                       Text(
// //                         price,
// //                         style: const TextStyle(
// //                           fontWeight: FontWeight.bold,
// //                           fontSize: 15,
// //                           color: Colors.black87,
// //                         ),
// //                       ),
// //                       Text(
// //                         'Per Night',
// //                         style: TextStyle(fontSize: 11, color: Colors.grey[600]),
// //                       ),
// //                     ],
// //                   ),
// //                   Positioned(
// //                     top: 0,
// //                     right: 8,
// //                     child: Row(
// //                       children: [
// //                         const Icon(Icons.star, color: Colors.amber, size: 16),
// //                         const SizedBox(width: 4),
// //                         Text(
// //                           rating.toString(),
// //                           style: const TextStyle(
// //                             fontWeight: FontWeight.bold,
// //                             fontSize: 14,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// // // // import 'package:flutter/material.dart';

// // // // class FavoriteHotelCard extends StatelessWidget {
// // // //   final String hotelName;
// // // //   final String location;
// // // //   final double rating;
// // // //   final String price;
// // // //   final String imageUrl;
// // // //   final bool isFavorite;
// // // //   final VoidCallback onTapFavorite;
// // // //   final VoidCallback? onTap;

// // // //   const FavoriteHotelCard({
// // // //     Key? key,
// // // //     required this.hotelName,
// // // //     required this.location,
// // // //     required this.rating,
// // // //     required this.price,
// // // //     required this.imageUrl,
// // // //     required this.isFavorite,
// // // //     required this.onTapFavorite,
// // // //     this.onTap,
// // // //   }) : super(key: key);

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return GestureDetector(
// // // //       onTap: onTap,
// // // //       child: Card(
// // // //         clipBehavior: Clip.antiAlias,
// // // //         elevation: 2,
// // // //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// // // //         child: Row(
// // // //           children: [
// // // //             // الصورة
// // // //             Image.network(
// // // //               imageUrl,
// // // //               width: 120,
// // // //               height: 120,
// // // //               fit: BoxFit.cover,
// // // //               errorBuilder: (context, error, stackTrace) {
// // // //                 return Container(
// // // //                   width: 120,
// // // //                   height: 120,
// // // //                   color: Colors.grey[300],
// // // //                   child: const Icon(Icons.broken_image, size: 40),
// // // //                 );
// // // //               },
// // // //               loadingBuilder: (context, child, loadingProgress) {
// // // //                 if (loadingProgress == null) return child;
// // // //                 return Center(
// // // //                   child: CircularProgressIndicator(
// // // //                     value: loadingProgress.expectedTotalBytes != null
// // // //                         ? loadingProgress.cumulativeBytesLoaded /
// // // //                             loadingProgress.expectedTotalBytes!
// // // //                         : null,
// // // //                   ),
// // // //                 );
// // // //               },
// // // //             ),
// // // //             Expanded(
// // // //               child: Padding(
// // // //                 padding: const EdgeInsets.all(12.0),
// // // //                 child: Column(
// // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // //                   children: [
// // // //                     Text(
// // // //                       hotelName,
// // // //                       style: const TextStyle(
// // // //                         fontSize: 16,
// // // //                         fontWeight: FontWeight.bold,
// // // //                       ),
// // // //                       maxLines: 2,
// // // //                       overflow: TextOverflow.ellipsis,
// // // //                     ),
// // // //                     const SizedBox(height: 4),
// // // //                     Text(
// // // //                       location,
// // // //                       style: TextStyle(
// // // //                         fontSize: 14,
// // // //                         color: Colors.grey[600],
// // // //                       ),
// // // //                       maxLines: 1,
// // // //                       overflow: TextOverflow.ellipsis,
// // // //                     ),
// // // //                     const SizedBox(height: 8),
// // // //                     Text(
// // // //                       price,
// // // //                       style: const TextStyle(
// // // //                         fontSize: 16,
// // // //                         fontWeight: FontWeight.bold,
// // // //                       ),
// // // //                     ),
// // // //                     const Spacer(),
// // // //                     Row(
// // // //                       mainAxisAlignment: MainAxisAlignment.end,
// // // //                       children: [
// // // //                         IconButton(
// // // //                           icon: Icon(
// // // //                             isFavorite ? Icons.favorite : Icons.favorite_border,
// // // //                             color: isFavorite ? Colors.red : null,
// // // //                           ),
// // // //                           onPressed: onTapFavorite,
// // // //                           tooltip: isFavorite
// // // //                               ? 'Remove from Favorites'
// // // //                               : 'Add to Favorites',
// // // //                         ),
// // // //                       ],
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // // }
// // // import 'package:flutter/material.dart';

// // // class FavoriteHotelCard extends StatelessWidget {
// // //   final String hotelName;
// // //   final String location;
// // //   final double rating;
// // //   final String price;
// // //   final String imageUrl;

// // //   const FavoriteHotelCard({
// // //     super.key,
// // //     required this.hotelName,
// // //     required this.location,
// // //     required this.rating,
// // //     required this.price,
// // //     required this.imageUrl,
// // //     required bool isFavorite,
// // //     required void Function() onTapFavorite,
// // //     required Null Function() onTap,
// // //   });

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Card(
// // //       margin: const EdgeInsets.only(bottom: 16.0),
// // //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// // //       elevation: 3,
// // //       child: Row(
// // //         children: [
// // //           ClipRRect(
// // //             borderRadius: const BorderRadius.only(
// // //               topLeft: Radius.circular(12),
// // //               bottomLeft: Radius.circular(12),
// // //             ),
// // //             child: Image.asset(
// // //               imageUrl,
// // //               height: 120,
// // //               width: 100,
// // //               fit: BoxFit.cover,
// // //               errorBuilder: (context, error, stackTrace) {
// // //                 return Container(
// // //                   height: 120,
// // //                   width: 100,
// // //                   color: Colors.grey[300], // استبدال الأيقونة بحاوية فارغة بلون محايد
// // //                 );
// // //               },
// // //             ),
// // //           ),
// // //           const SizedBox(width: 12),
// // //           Expanded(
// // //             child: Padding(
// // //               padding: const EdgeInsets.symmetric(vertical: 8.0),
// // //               child: Stack(
// // //                 children: [
// // //                   Column(
// // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                     children: [
// // //                       Text(
// // //                         hotelName,
// // //                         style: const TextStyle(
// // //                           fontWeight: FontWeight.bold,
// // //                           fontSize: 16,
// // //                         ),
// // //                         maxLines: 2,
// // //                         overflow: TextOverflow.ellipsis,
// // //                       ),
// // //                       const SizedBox(height: 6),
// // //                       Row(
// // //                         children: [
// // //                           Icon(Icons.location_on,
// // //                               size: 14, color: Colors.grey[600]),
// // //                           const SizedBox(width: 4),
// // //                           Expanded(
// // //                             child: Text(
// // //                               location,
// // //                               style: TextStyle(
// // //                                   fontSize: 12, color: Colors.grey[600]),
// // //                               overflow: TextOverflow.ellipsis,
// // //                             ),
// // //                           ),
// // //                         ],
// // //                       ),
// // //                       const SizedBox(height: 8),
// // //                       Text(
// // //                         price,
// // //                         style: const TextStyle(
// // //                           fontWeight: FontWeight.bold,
// // //                           fontSize: 15,
// // //                           color: Colors.black87,
// // //                         ),
// // //                       ),
// // //                       Text(
// // //                         'Per Night',
// // //                         style: TextStyle(fontSize: 11, color: Colors.grey[600]),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                   Positioned(
// // //                     top: 0,
// // //                     right: 8,
// // //                     child: Row(
// // //                       children: [
// // //                         const Icon(Icons.star, color: Colors.amber, size: 16),
// // //                         const SizedBox(width: 4),
// // //                         Text(
// // //                           rating.toString(),
// // //                           style: const TextStyle(
// // //                             fontWeight: FontWeight.bold,
// // //                             fontSize: 14,
// // //                           ),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ),
// //         ],
// // //       ),
// // //     );
// // //   }
// // // }
// import 'package:flutter/material.dart';

// class FavoriteHotelCard extends StatelessWidget {
//   final String hotelName;
//   final String location;
//   final double rating;
//   final String price;
//   final String imageUrl;
//   final bool isFavorite;
//   final VoidCallback onTapFavorite;
//   final VoidCallback? onTap;

//   const FavoriteHotelCard({
//     super.key,
//     required this.hotelName,
//     required this.location,
//     required this.rating,
//     required this.price,
//     required this.imageUrl,
//     required this.isFavorite,
//     required this.onTapFavorite,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Card(
//         margin: const EdgeInsets.only(bottom: 16.0),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         elevation: 3,
//         child: Row(
//           children: [
//             ClipRRect(
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(12),
//                 bottomLeft: Radius.circular(12),
//               ),
//               child: Image.network(
//                 imageUrl,
//                 height: 120,
//                 width: 100,
//                 fit: BoxFit.cover,
//                 errorBuilder: (context, error, stackTrace) {
//                   return Container(
//                     height: 120,
//                     width: 100,
//                     color: Colors.grey[300],
//                   );
//                 },
//                 loadingBuilder: (context, child, loadingProgress) {
//                   if (loadingProgress == null) return child;
//                   return Center(
//                     child: CircularProgressIndicator(
//                       value: loadingProgress.expectedTotalBytes != null
//                           ? loadingProgress.cumulativeBytesLoaded /
//                               loadingProgress.expectedTotalBytes!
//                           : null,
//                     ),
//                   );
//                 },
//               ),
//             ),
//             const SizedBox(width: 12),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: Stack(
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           hotelName,
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                           ),
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         const SizedBox(height: 6),
//                         Row(
//                           children: [
//                             Icon(Icons.location_on,
//                                 size: 14, color: Colors.grey[600]),
//                             const SizedBox(width: 4),
//                             Expanded(
//                               child: Text(
//                                 location,
//                                 style: TextStyle(
//                                     fontSize: 12, color: Colors.grey[600]),
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           price,
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 15,
//                             color: Colors.black87,
//                           ),
//                         ),
//                         Text(
//                           'Per Night',
//                           style:
//                               TextStyle(fontSize: 11, color: Colors.grey[600]),
//                         ),
//                       ],
//                     ),
//                     Positioned(
//                       top: 0,
//                       right: 8,
//                       child: Row(
//                         children: [
//                           const Icon(Icons.star, color: Colors.amber, size: 16),
//                           const SizedBox(width: 4),
//                           Text(
//                             rating.toString(),
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 14,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class FavoriteHotelCard extends StatelessWidget {
  final String hotelName;
  final String location;
  final double rating;
  final String price;
  final String imageUrl;
  final bool isFavorite;
  final VoidCallback onTapFavorite;
  final VoidCallback? onTap;

  const FavoriteHotelCard({
    super.key,
    required this.hotelName,
    required this.location,
    required this.rating,
    required this.price,
    required this.imageUrl,
    required this.isFavorite,
    required this.onTapFavorite,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.only(bottom: 16.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: Image.network(
                imageUrl,
                height: 120,
                width: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 120,
                    width: 100,
                    color: Colors.grey[300], // استبدال الأيقونة بحاوية فارغة
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          hotelName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(Icons.location_on,
                                size: 14, color: Colors.grey[600]),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                location,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey[600]),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          price,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'Per Night',
                          style:
                              TextStyle(fontSize: 11, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      right: 8,
                      child: Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            rating.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
