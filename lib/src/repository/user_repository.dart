import 'package:dartz/dartz.dart' show Either;
import 'package:fake_store/src/exceptions/api_exceptions.dart';
import 'package:fake_store/src/models/user.dart';

abstract class UserRepository {
  //Future<Either<ApiException, List<User?>>> getUsers();
  Future<Either<ApiException, User?>> addUser(User user);
  Future<Either<ApiException, User?>> getUser(String id);
}
