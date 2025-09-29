import 'package:dartz/dartz.dart' show Either;

abstract class AuthRepository {
  Future<Either<Exception, String?>> login(String username, String password);
}
