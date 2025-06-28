// class Car {
//   final String id;
//   final String name;
//   final String brand; // Added Brand
//   final String type; // Added Type (Sedan, SUV, Hatchback)
//   final String imageUrl;
//   final double price;
//   final double rating;
//   final String transmission;
//   final String fuelType; // Renamed from engineType to fuelType
//   final int seats;
//   bool isFavorite;

//   Car({
//     required this.id,
//     required this.name,
//     required this.brand,
//     required this.type,
//     required this.imageUrl,
//     required this.price,
//     required this.rating,
//     required this.transmission,
//     required this.fuelType,
//     required this.seats,
//     this.isFavorite = false,
//   });

//   // Sample Data Function - Updated image paths
//   static List<Car> getSampleCars() {
//     return [
//       Car(
//           id: '1',
//           name: 'Toyota Innova',
//           brand: 'Toyota',
//           type: 'SUV',
//           imageUrl: 'assets/car.jpeg', // <--- Updated
//           price: 1200,
//           rating: 4.5,
//           transmission: 'Manual',
//           fuelType: 'Diesel',
//           seats: 7,
//           isFavorite: false),
//       Car(
//           id: '2',
//           name: 'Honda City',
//           brand: 'Honda',
//           type: 'Sedan',
//           imageUrl: 'assets/car.jpeg', // <--- Updated
//           price: 850,
//           rating: 4.2,
//           transmission: 'Manual',
//           fuelType: 'Petrol',
//           seats: 5,
//           isFavorite: true),
//       Car(
//           id: '3',
//           name: 'Hyundai Verna',
//           brand: 'Hyundai',
//           type: 'Sedan',
//           imageUrl: 'assets/car.jpeg', // <--- Updated
//           price: 900,
//           rating: 4.0,
//           transmission: 'Automatic',
//           fuelType: 'Petrol',
//           seats: 5,
//           isFavorite: false),
//       Car(
//           id: '4',
//           name: 'Toyota Fortuner Legender',
//           brand: 'Toyota',
//           type: 'SUV',
//           imageUrl: 'assets/car.jpeg', // <--- Updated
//           price: 1800,
//           rating: 4.8,
//           transmission: 'Automatic',
//           fuelType: 'Diesel',
//           seats: 7,
//           isFavorite: false),
//       Car(
//           id: '5',
//           name: 'Ford Ecosport',
//           brand: 'Ford',
//           type: 'SUV',
//           imageUrl: 'assets/car.jpeg', // <--- Updated
//           price: 950,
//           rating: 3.9,
//           transmission: 'Manual',
//           fuelType: 'Petrol',
//           seats: 5), // Example Ford (default isFavorite = false)
//       Car(
//           id: '6',
//           name: 'BMW X1',
//           brand: 'BMW',
//           type: 'SUV',
//           imageUrl: 'assets/car.jpeg', // <--- Updated
//           price: 2500,
//           rating: 4.7,
//           transmission: 'Automatic',
//           fuelType: 'Petrol',
//           seats: 5), // Example BMW (default isFavorite = false)
//       Car(
//           id: '7',
//           name: 'Audi Q3',
//           brand: 'Audi',
//           type: 'SUV',
//           imageUrl: 'assets/car.jpeg', // <--- Updated
//           price: 2800,
//           rating: 4.6,
//           transmission: 'Automatic',
//           fuelType: 'Petrol',
//           seats: 5), // Example Audi (default isFavorite = false)
//       Car(
//           id: '8',
//           name: 'Suzuki Swift',
//           brand: 'Suzuki',
//           type: 'Hatchback',
//           imageUrl: 'assets/car.jpeg', // <--- Updated
//           price: 600,
//           rating: 3.5,
//           transmission: 'CVT',
//           fuelType: 'Gas',
//           seats: 5), // Example Hatchback, CVT, Gas (default isFavorite = false)
//       Car(
//           id: '9',
//           name: 'Hyundai i20',
//           brand: 'Hyundai',
//           type: 'Hatchback',
//           imageUrl: 'assets/car.jpeg', // <--- Updated
//           price: 750,
//           rating: 2.8,
//           transmission: 'Automatic',
//           fuelType: 'Petrol',
//           seats: 5), // (default isFavorite = false)
//       Car(
//           id: '10',
//           name: 'Honda Civic',
//           brand: 'Honda',
//           type: 'Sedan',
//           imageUrl: 'assets/car.jpeg', // <--- Updated
//           price: 1100,
//           rating: 2.2,
//           transmission: 'CVT',
//           fuelType: 'Petrol',
//           seats: 5), // (default isFavorite = false)
//     ];
//   }
// }
// lib/models/car.dart

class Car {
  final String id;
  final String name;
  final String brand;
  final String type;
  final String imageUrl;
  final double price;
  final double rating;
  final String transmission;
  final String fuelType;
  final int seats;
  bool isFavorite;

  Car({
    required this.id,
    required this.name,
    required this.brand,
    required this.type,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.transmission,
    required this.fuelType,
    required this.seats,
    this.isFavorite = false,
  });

  // Sample Data Function is kept for reference or testing purposes if needed.
  static List<Car> getSampleCars() {
    return [
      Car(
          id: '1',
          name: 'Toyota Innova',
          brand: 'Toyota',
          type: 'SUV',
          imageUrl: 'assets/car.jpeg',
          price: 1200,
          rating: 4.5,
          transmission: 'Manual',
          fuelType: 'Diesel',
          seats: 7,
          isFavorite: false),
      Car(
          id: '2',
          name: 'Honda City',
          brand: 'Honda',
          type: 'Sedan',
          imageUrl: 'assets/car.jpeg',
          price: 850,
          rating: 4.2,
          transmission: 'Manual',
          fuelType: 'Petrol',
          seats: 5,
          isFavorite: true),
    ];
  }
}
