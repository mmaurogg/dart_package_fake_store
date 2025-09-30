import 'package:dartz/dartz.dart' show Either;
import 'package:fake_store/fake_store.dart';

abstract class ProductRepository {
  Future<Either<ApiException, List<Product?>>> getProducts();
  Future<Either<ApiException, Product?>> getProduct(String id);
}
