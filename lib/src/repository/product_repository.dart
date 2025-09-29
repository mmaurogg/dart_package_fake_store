import 'package:dartz/dartz.dart' show Either;
import 'package:fake_store/src/models/product.dart';

abstract class ProductRepository {
  Future<Either<Exception, List<Product?>>> getProducts();
  Future<Either<Exception, Product?>> getProduct(String id);
}
