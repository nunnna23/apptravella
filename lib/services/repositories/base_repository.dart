import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../api/dio_client.dart';

abstract class BaseRepository {
  final DioClient dioClient = DioClient();

  Future<bool> get hasInternetConnection async =>
      await InternetConnectionChecker.createInstance().hasConnection;

  Future<Either<String, T>> handleApiCall<T>({
    required Future<T> Function() apiCall,
  }) async {
    try {
      if (!await hasInternetConnection) {
        return const Left('No internet connection');
      }

      final response = await apiCall();
      return Right(response);
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(e.toString());
    }
  }

  String _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout';
      case DioExceptionType.sendTimeout:
        return 'Send timeout';
      case DioExceptionType.receiveTimeout:
        return 'Receive timeout';
      case DioExceptionType.badCertificate:
        return 'Bad certificate';
      case DioExceptionType.badResponse:
        return _handleBadResponse(error.response?.statusCode);
      case DioExceptionType.cancel:
        return 'Request cancelled';
      case DioExceptionType.connectionError:
        return 'Connection error';
      case DioExceptionType.unknown:
        return 'Unknown error occurred';
    }
  }

  String _handleBadResponse(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Not found';
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      case 503:
        return 'Service unavailable';
      default:
        return 'Something went wrong';
    }
  }
}
