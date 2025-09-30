import 'package:dartz/dartz.dart';
import 'package:fake_store/utils/constants.dart';
import 'package:fake_store/src/api/api_source.dart';
import 'package:fake_store/src/exceptions/api_exceptions.dart';
import 'package:fake_store/src/repository/cart_repository.dart';
import 'package:fake_store/src/models/cart.dart';

class CartApiSource extends ApiSource implements CartRepository {
  CartApiSource([super.client]);

  final String _baseUrl = Constants.baseUrl;
  final String _endpoint = 'carts';

  @override
  Future<Either<ApiException, List<Cart?>>>? getCarts() async {
    final url = '$_baseUrl/$_endpoint';

    return await getApi<List>(url).then((value) {
      return value.fold((l) => Left(l), (r) {
        final products = r?.map((json) => Cart.fromJson(json)).toList() ?? [];
        return Right(products);
      });
    });
  }

  @override
  Future<Either<ApiException, Cart>> getCart(String id) async {
    final url = '$_baseUrl/$_endpoint/$id';

    return await getApi<Map<String, dynamic>>(url).then((value) {
      return value.fold((l) => Left(l), (r) {
        return r != null
            ? Right(Cart.fromJson(r))
            : Left(ServerException("No se encontró el carrito con id $id"));
      });
    });
  }

  @override
  Future<Either<ApiException, Cart?>>? addCart(Cart cart) async {
    final url = '$_baseUrl/$_endpoint';
    final data = cart.toJson();

    return await postApi<Map<String, dynamic>>(url, data).then((value) {
      return value.fold((l) => Left(l), (r) {
        return r != null ? Right(Cart.fromJson(r)) : Right(null);
      });
    });
  }

  @override
  Future<Either<ApiException, Cart?>>? deleteCart(String id) async {
    final url = '$_baseUrl/$_endpoint/$id';

    return await deleteApi<Map<String, dynamic>>(url).then((value) {
      return value.fold((l) => Left(l), (r) {
        return r != null
            ? Right(Cart.fromJson(r))
            : Left(ServerException("No se encontró el carrito con id $id"));
      });
    });
  }

  @override
  Future<Either<ApiException, Cart?>>? updateCart(Cart cart) async {
    final url = '$_baseUrl/$_endpoint/${cart.id}';
    final data = cart.toJson();

    return await putApi<Map<String, dynamic>>(url, data).then((value) {
      return value.fold((l) => Left(l), (r) {
        return r != null ? Right(Cart.fromJson(r)) : Right(null);
      });
    });
  }
}
