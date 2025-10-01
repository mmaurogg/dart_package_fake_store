import 'package:dartz/dartz.dart' show Either;
import 'package:fake_store/src/exceptions/api_exceptions.dart';

abstract class AuthRepository {
  Future<Either<ApiException, String?>> login(String username, String password);
}
