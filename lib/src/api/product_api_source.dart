import 'package:dartz/dartz.dart';
import 'package:fake_store/utils/constants.dart';
import 'package:fake_store/src/api/api_source.dart';
import 'package:fake_store/src/exceptions/api_exceptions.dart';
import 'package:fake_store/src/repository/product_repository.dart';
import 'package:fake_store/src/models/product.dart';

class ProductApiSource extends ApiSource implements ProductRepository {
  ProductApiSource({super.client});

  final String _baseUrl = Constants.baseUrl;
  final String _endpoint = 'products';

  @override
  Future<Either<ApiException, List<Product>>> getProducts() async {
    final url = '$_baseUrl/$_endpoint';

    return await getApi<List>(url).then((value) {
      return value.fold((l) => Left(l), (r) {
        final products =
            r?.map((json) => Product.fromJson(json)).toList() ?? [];
        return Right(products);
      });
    });
  }

  @override
  Future<Either<ApiException, Product>> getProduct(String id) async {
    final url = '$_baseUrl/$_endpoint/$id';

    return await getApi<Map<String, dynamic>>(url).then((value) {
      return value.fold((l) => Left(l), (r) {
        return r != null
            ? Right(Product.fromJson(r))
            : Left(ServerException("No se encontró el producto con id $id"));
      });
    });
  }
}
