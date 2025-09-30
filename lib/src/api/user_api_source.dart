import 'package:dartz/dartz.dart';
import 'package:fake_store/src/api/api_source.dart';
import 'package:fake_store/src/exceptions/api_exceptions.dart';
import 'package:fake_store/src/models/user.dart';
import 'package:fake_store/src/repository/user_repository.dart';
import 'package:fake_store/utils/constants.dart';

class UserApiSource extends ApiSource implements UserRepository {
  UserApiSource([super.client]);

  final String _baseUrl = Constants.baseUrl;
  final String _endpoint = 'users';

  @override
  Future<Either<ApiException, User?>> addUser(User user) async {
    final url = '$_baseUrl/$_endpoint';
    final data = user.toJson();

    return await postApi<Map<String, dynamic>>(url, data).then((value) {
      return value.fold((l) => Left(l), (r) {
        return r != null ? Right(User.fromJson(r)) : Right(null);
      });
    });
  }

  @override
  Future<Either<ApiException, User?>> getUser(String id) async {
    final url = '$_baseUrl/$_endpoint/$id';

    return await getApi<Map<String, dynamic>>(url).then((value) {
      return value.fold((l) => Left(l), (r) {
        return r != null
            ? Right(User.fromJson(r))
            : Left(ServerException("No se encontró el usuario con id $id"));
      });
    });
  }
}
