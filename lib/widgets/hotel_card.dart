// import 'package:flutter/material.dart';

// class HotelCard extends StatelessWidget {
//   final String image;
//   final String name;
//   final String location;
//   final double rating;
//   final int discount;
//   final double originalPrice;
//   final double discountedPrice;

//   const HotelCard({
//     super.key,
//     required this.image,
//     required this.name,
//     required this.location,
//     required this.rating,
//     required this.discount,
//     required this.originalPrice,
//     required this.discountedPrice,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 4,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Stack(
//             children: [
//               ClipRRect(
//                 borderRadius:
//                     const BorderRadius.vertical(top: Radius.circular(8)),
//                 child: Image.asset(
//                   image,
//                   height: 160,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Positioned(
//                 top: 8,
//                 right: 8,
//                 child: Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//                   decoration: BoxDecoration(
//                     color: Colors.blue[700],
//                     borderRadius: BorderRadius.circular(4),
//                   ),
//                   child: Text(
//                     'Up to $discount%',
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 10,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       name,
//                       style: const TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black,
//                       ),
//                     ),
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 6,
//                         vertical: 2,
//                       ),
//                       decoration: BoxDecoration(
//                         color: Colors.grey[100],
//                         borderRadius: BorderRadius.circular(4),
//                       ),
//                       child: Row(
//                         children: [
//                           const Icon(
//                             Icons.star,
//                             color: Colors.amber,
//                             size: 14,
//                           ),
//                           const SizedBox(width: 2),
//                           Text(
//                             rating.toString(),
//                             style: const TextStyle(
//                               fontSize: 10,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.black87,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 4),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.location_on_outlined,
//                       color: Colors.grey[400],
//                       size: 14,
//                     ),
//                     const SizedBox(width: 2),
//                     Text(
//                       location,
//                       style: TextStyle(
//                         color: Colors.grey[400],
//                         fontSize: 10,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 6),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.baseline,
//                   textBaseline: TextBaseline.alphabetic,
//                   children: [
//                     Text(
//                       'EGP ${originalPrice.toStringAsFixed(0)}',
//                       style: TextStyle(
//                         decoration: TextDecoration.lineThrough,
//                         color: Colors.grey[400],
//                         fontSize: 10,
//                       ),
//                     ),
//                     const SizedBox(width: 4),
//                     Text(
//                       'EGP ${discountedPrice.toStringAsFixed(0)}',
//                       style: const TextStyle(
//                         color: Colors.black,
//                         fontSize: 12,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     Text(
//                       ' /Per Night',
//                       style: TextStyle(
//                         color: Colors.grey[400],
//                         fontSize: 10,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class HotelCard extends StatelessWidget {
  final String image;
  final String name;
  final String location;
  final double rating;
  final int discount;
  final double originalPrice;
  final double discountedPrice;

  const HotelCard({
    super.key,
    required this.image,
    required this.name,
    required this.location,
    required this.rating,
    required this.discount,
    required this.originalPrice,
    required this.discountedPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(8)),
                child: Image.asset(
                  image,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.blue[700],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Up to $discount%',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 14,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            rating.toString(),
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.grey[400],
                      size: 14,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      location,
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      'EGP ${originalPrice.toStringAsFixed(0)}',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey[400],
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'EGP ${discountedPrice.toStringAsFixed(0)}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      ' /Per Night',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
