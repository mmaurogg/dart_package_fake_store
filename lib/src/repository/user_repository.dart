import 'package:dartz/dartz.dart' show Either;
import 'package:fake_store/fake_store.dart';

abstract class UserRepository {
  //Future<Either<ApiException, List<User?>>> getUsers();
  Future<Either<ApiException, User?>> addUser(User user);
  Future<Either<ApiException, User?>> getUser(String id);
}
