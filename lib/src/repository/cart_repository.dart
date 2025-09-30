import 'package:dartz/dartz.dart' show Either;
import 'package:fake_store/fake_store.dart';

abstract class CartRepository {
  Future<Either<ApiException, List<Cart?>>>? getCarts();
  Future<Either<ApiException, Cart?>>? getCart(String id);
  Future<Either<ApiException, Cart?>>? addCart(Cart cart);
  Future<Either<ApiException, Cart?>>? updateCart(Cart cart);
  Future<Either<ApiException, Cart?>>? deleteCart(String id);
}
