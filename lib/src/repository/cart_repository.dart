import 'package:dartz/dartz.dart' show Either;
import 'package:fake_store/src/models/cart.dart';

abstract class CartRepository {
  Future<Either<Exception, Cart?>>? getCart(String id);
}
