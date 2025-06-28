// import 'package:get_it/get_it.dart';
// import '../services/repositories/flight_repository.dart';
// import '../services/repositories/auth_repository.dart';
// import '../services/repositories/auth_repository_impl.dart';
// import '../cubit/flight/flight_cubit.dart';
// import '../cubit/auth/auth_cubit.dart';

// final getIt = GetIt.instance;

// void setupServiceLocator() {
//   // Repositories
//   getIt.registerLazySingleton<FlightRepository>(() => FlightRepository());
//   getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());

//   // Cubits
//   getIt.registerFactory<FlightCubit>(() => FlightCubit(getIt()));
//   getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt()));
// }
