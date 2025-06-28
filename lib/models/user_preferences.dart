// class UserPreferences {
//   String? preferredSeason;
//   String? travelStyle;
//   String? preferredFlightClass;
//   bool? ecoFriendlyOptions;
//   String? carTransmission;
//   String? foodPreferences;

//   UserPreferences({
//     this.preferredSeason,
//     this.travelStyle,
//     this.preferredFlightClass,
//     this.ecoFriendlyOptions,
//     this.carTransmission,
//     this.foodPreferences,
//   });

//   factory UserPreferences.fromJson(Map<String, dynamic> json) {
//     return UserPreferences(
//       preferredSeason: json['preferredSeason'],
//       travelStyle: json['travelStyle'],
//       preferredFlightClass: json['preferredFlightClass'],
//       ecoFriendlyOptions: json['ecoFriendlyOptions'],
//       carTransmission: json['carTransmission'],
//       foodPreferences: json['foodPreferences'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'preferredSeason': preferredSeason,
//       'travelStyle': travelStyle,
//       'preferredFlightClass': preferredFlightClass,
//       'ecoFriendlyOptions': ecoFriendlyOptions,
//       'carTransmission': carTransmission,
//       'foodPreferences': foodPreferences,
//     };
//   }
// }
class UserPreferences {
  String? preferredSeason;
  String? travelStyle;
  String? preferredFlightClass;
  bool? preferCarbonOffsetAirlines; // خيار جديد
  bool? preferEcoCertifiedHotels; // خيار جديد
  bool? preferHybridRentals; // خيار جديد
  String? carTransmission;
  String? foodPreferences;

  UserPreferences({
    this.preferredSeason,
    this.travelStyle,
    this.preferredFlightClass,
    this.preferCarbonOffsetAirlines,
    this.preferEcoCertifiedHotels,
    this.preferHybridRentals,
    this.carTransmission,
    this.foodPreferences,
  });

  factory UserPreferences.fromJson(Map<String, dynamic> json) {
    return UserPreferences(
      preferredSeason: json['preferredSeason'],
      travelStyle: json['travelStyle'],
      preferredFlightClass: json['preferredFlightClass'],
      preferCarbonOffsetAirlines: json['preferCarbonOffsetAirlines'],
      preferEcoCertifiedHotels: json['preferEcoCertifiedHotels'],
      preferHybridRentals: json['preferHybridRentals'],
      carTransmission: json['carTransmission'],
      foodPreferences: json['foodPreferences'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'preferredSeason': preferredSeason,
      'travelStyle': travelStyle,
      'preferredFlightClass': preferredFlightClass,
      'preferCarbonOffsetAirlines': preferCarbonOffsetAirlines,
      'preferEcoCertifiedHotels': preferEcoCertifiedHotels,
      'preferHybridRentals': preferHybridRentals,
      'carTransmission': carTransmission,
      'foodPreferences': foodPreferences,
    };
  }
}
