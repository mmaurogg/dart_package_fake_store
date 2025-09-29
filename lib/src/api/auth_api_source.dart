import 'package:dartz/dartz.dart';
import 'package:fake_store/utils/constants.dart';
import 'package:fake_store/src/api/api_source.dart';
import 'package:fake_store/src/exceptions/api_exceptions.dart';
import 'package:fake_store/src/repository/auth_repository.dart';

class AuthApiSource extends ApiSource implements AuthRepository {
  AuthApiSource([super.client]);

  final String _baseUrl = Constants.baseUrl;
  final String _endpoint = 'auth/login';

  @override
  Future<Either<ApiException, String?>> login(
    String username,
    String password,
  ) async {
    final url = '$_baseUrl/$_endpoint';
    final data = {'username': username, 'password': password};

    return await postApi<Map<String, dynamic>>(url, data).then((value) {
      return value.fold((l) => Left(l), (r) {
        String? token = r?['token'];
        return token != null
            ? Right(token)
            : Left(ServerException("No se encontró el token"));
      });
    });
  }
}
