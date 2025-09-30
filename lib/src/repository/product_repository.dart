import 'package:dartz/dartz.dart' show Either;
import 'package:fake_store/src/exceptions/api_exceptions.dart';
import 'package:fake_store/src/models/product.dart';

abstract class ProductRepository {
  Future<Either<ApiException, List<Product?>>> getProducts();
  Future<Either<ApiException, Product?>> getProduct(String id);
}
