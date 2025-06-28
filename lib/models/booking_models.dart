// // class BookingsResponse {
// //   final List<Booking>? activeBookings;
// //   final List<Booking>? canceledBookings;
// //   final List<Booking>? pastBookings;

// //   BookingsResponse({
// //     this.activeBookings,
// //     this.canceledBookings,
// //     this.pastBookings,
// //   });

// //   factory BookingsResponse.fromJson(Map<String, dynamic> json) {
// //     return BookingsResponse(
// //       activeBookings: (json['activeBookings'] as List?)
// //           ?.map((e) => Booking.fromJson(e))
// //           .toList(),
// //       canceledBookings: (json['canceledBookings'] as List?)
// //           ?.map((e) => Booking.fromJson(e))
// //           .toList(),
// //       pastBookings: (json['pastBookings'] as List?)
// //           ?.map((e) => Booking.fromJson(e))
// //           .toList(),
// //     );
// //   }
// // }

// // class Booking {
// //   final int id;
// //   final int hotelId;
// //   final String hotelName;
// //   final String hotelCity;
// //   final String hotelImageUrl;
// //   final double hotelRating;
// //   final DateTime checkInDate;
// //   final DateTime checkOutDate;
// //   final int numberOfGuests;
// //   final DateTime bookingDate;
// //   final String status;
// //   final String paymentStatus;
// //   final double totalPrice;
// //   final String confirmationCode;

// //   Booking({
// //     required this.id,
// //     required this.hotelId,
// //     required this.hotelName,
// //     required this.hotelCity,
// //     required this.hotelImageUrl,
// //     required this.hotelRating,
// //     required this.checkInDate,
// //     required this.checkOutDate,
// //     required this.numberOfGuests,
// //     required this.bookingDate,
// //     required this.status,
// //     required this.paymentStatus,
// //     required this.totalPrice,
// //     required this.confirmationCode,
// //   });

// //   factory Booking.fromJson(Map<String, dynamic> json) {
// //     return Booking(
// //       id: json['id'],
// //       hotelId: json['hotelId'],
// //       hotelName: json['hotelName'],
// //       hotelCity: json['hotelCity'],
// //       hotelImageUrl: json['hotelImageUrl'],
// //       hotelRating: (json['hotelRating'] as num).toDouble(),
// //       checkInDate: DateTime.parse(json['checkInDate']),
// //       checkOutDate: DateTime.parse(json['checkOutDate']),
// //       numberOfGuests: json['numberOfGuests'],
// //       bookingDate: DateTime.parse(json['bookingDate']),
// //       status: json['status'],
// //       paymentStatus: json['paymentStatus'],
// //       totalPrice: (json['totalPrice'] as num).toDouble(),
// //       confirmationCode: json['confirmationCode'],
// //     );
// //   }
// // }
// // booking_models.dart

// class BookingsResponse {
//   final List<Booking>? activeBookings;
//   final List<Booking>? canceledBookings;
//   final List<Booking>? pastBookings;

//   BookingsResponse({
//     this.activeBookings,
//     this.canceledBookings,
//     this.pastBookings,
//   });

//   factory BookingsResponse.fromJson(Map<String, dynamic> json) {
//     return BookingsResponse(
//       activeBookings: (json['activeBookings'] as List?)
//           ?.map((e) => Booking.fromJson(e))
//           .toList(),
//       canceledBookings: (json['canceledBookings'] as List?)
//           ?.map((e) => Booking.fromJson(e))
//           .toList(),
//       pastBookings: (json['pastBookings'] as List?)
//           ?.map((e) => Booking.fromJson(e))
//           .toList(),
//     );
//   }
// }

// class Booking {
//   final int id;
//   final int hotelId;
//   final String hotelName;
//   final String hotelCity;
//   final String hotelImageUrl;
//   final double hotelRating;
//   final DateTime checkInDate;
//   final DateTime checkOutDate;
//   final int numberOfGuests;
//   final DateTime bookingDate;
//   final String status;
//   final String paymentStatus;
//   final double totalPrice;
//   final String confirmationCode;

//   Booking({
//     required this.id,
//     required this.hotelId,
//     required this.hotelName,
//     required this.hotelCity,
//     required this.hotelImageUrl,
//     required this.hotelRating,
//     required this.checkInDate,
//     required this.checkOutDate,
//     required this.numberOfGuests,
//     required this.bookingDate,
//     required this.status,
//     required this.paymentStatus,
//     required this.totalPrice,
//     required this.confirmationCode,
//   });

//   factory Booking.fromJson(Map<String, dynamic> json) {
//     return Booking(
//       id: json['id'],
//       hotelId: json['hotelId'],
//       hotelName: json['hotelName'],
//       hotelCity: json['hotelCity'],
//       // hotelImageUrl: json['hotelImageUrl'],
//       hotelImageUrl: json['hotelImageUrl'] ?? '',

//       hotelRating: (json['hotelRating'] as num).toDouble(),
//       checkInDate: DateTime.parse(json['checkInDate']),
//       checkOutDate: DateTime.parse(json['checkOutDate']),
//       numberOfGuests: json['numberOfGuests'],
//       bookingDate: DateTime.parse(json['bookingDate']),
//       status: json['status'],
//       paymentStatus: json['paymentStatus'],
//       totalPrice: (json['totalPrice'] as num).toDouble(),
//       confirmationCode: json['confirmationCode'],
//     );
//   }
// }
class BookingsResponse {
  final List<Booking>? activeBookings;
  final List<Booking>? canceledBookings;
  final List<Booking>? pastBookings;

  BookingsResponse({
    this.activeBookings,
    this.canceledBookings,
    this.pastBookings,
  });

  factory BookingsResponse.fromJson(Map<String, dynamic> json) {
    return BookingsResponse(
      activeBookings: (json['activeBookings'] as List<dynamic>?)
          ?.map((e) => Booking.fromJson(e as Map<String, dynamic>))
          .toList(),
      canceledBookings: (json['canceledBookings'] as List<dynamic>?)
          ?.map((e) => Booking.fromJson(e as Map<String, dynamic>))
          .toList(),
      pastBookings: (json['pastBookings'] as List<dynamic>?)
          ?.map((e) => Booking.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Booking {
  final int id;
  final int hotelId;
  final String hotelName;
  final String hotelCity;
  final String hotelImageUrl;
  final double hotelRating;
  final DateTime checkInDate;
  final DateTime checkOutDate;
  final int numberOfGuests;
  final DateTime bookingDate;
  final String status;
  final String paymentStatus;
  final double totalPrice;
  final String confirmationCode;

  Booking({
    required this.id,
    required this.hotelId,
    required this.hotelName,
    required this.hotelCity,
    required this.hotelImageUrl,
    required this.hotelRating,
    required this.checkInDate,
    required this.checkOutDate,
    required this.numberOfGuests,
    required this.bookingDate,
    required this.status,
    required this.paymentStatus,
    required this.totalPrice,
    required this.confirmationCode,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'] as int? ?? 0,
      hotelId: json['hotelId'] as int? ?? 0,
      hotelName: json['hotelName'] as String? ?? '',
      hotelCity: json['hotelCity'] as String? ?? '',
      hotelImageUrl: json['hotelImageUrl'] as String? ?? '',
      hotelRating: (json['hotelRating'] as num?)?.toDouble() ?? 0.0,
      checkInDate: _parseDateTime(json['checkInDate']),
      checkOutDate: _parseDateTime(json['checkOutDate']),
      numberOfGuests: json['numberOfGuests'] as int? ?? 0,
      bookingDate: _parseDateTime(json['bookingDate']),
      status: json['status'] as String? ?? '',
      paymentStatus: json['paymentStatus'] as String? ?? '',
      totalPrice: (json['totalPrice'] as num?)?.toDouble() ?? 0.0,
      confirmationCode: json['confirmationCode'] as String? ?? '',
    );
  }

  static DateTime _parseDateTime(dynamic date) {
    if (date is String) {
      try {
        return DateTime.parse(date).toLocal();
      } catch (e) {
        return DateTime
            .now(); // Default to now for invalid dates like "0001-01-01"
      }
    }
    return DateTime.now();
  }
}
