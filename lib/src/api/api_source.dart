import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:fake_store/src/exceptions/api_exceptions.dart';

class ApiSource {
  final Dio? _client;

  ApiSource(Dio? client) : _client = client ?? Dio();

  Future<Either<ApiException, T?>> getApi<T>(String url) async {
    try {
      final response = await _client!.get(url);

      if (response.statusCode == 200) {
        final jsonResponse = response.data;
        //print(jsonResponse);
        return Right(jsonResponse);
      } else {
        //print('Request failed with status: ${response.statusCode}.');
        return Left(
          ServerException(
            'Request failed with status: ${response.statusCode} ',
          ),
        );
      }
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    }
  }

  Future<Either<ApiException, T?>> postApi<T>(String url, T data) async {
    try {
      final response = await _client!.post(url, data: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonResponse = response.data;
        //print(jsonResponse);
        return Right(jsonResponse);
      } else {
        //print('Request failed with status: ${response.statusCode}.');
        return Left(
          ServerException(
            'Request failed with status: ${response.statusCode} ',
          ),
        );
      }
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    }
  }

  ApiException _handleDioException(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.connectionError) {
      return NetworkException(
        e.message ??
            'No se pudo conectar al servidor. Revisa tu conexión a internet.',
      );
    }

    return ServerException(e.message ?? 'No se pudo conectar al servidor.');
  }
}
