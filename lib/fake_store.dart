library fake_store;

export 'src/models/cart.dart';
export 'src/models/product.dart';
export 'src/models/user.dart';

import 'package:dio/dio.dart';
import 'package:fake_store/src/api/auth_api_source.dart';
import 'package:fake_store/src/api/cart_api_source.dart';
import 'package:fake_store/src/api/product_api_source.dart';
import 'package:fake_store/src/api/user_api_source.dart';
import 'package:fake_store/src/repository/auth_repository.dart';
import 'package:fake_store/src/repository/cart_repository.dart';
import 'package:fake_store/src/repository/product_repository.dart';
import 'package:fake_store/src/repository/user_repository.dart';

class FakeStore {
  final Dio? _client;

  late final AuthRepository auth;
  late final CartRepository cart;
  late final ProductRepository product;
  late final UserRepository user;

  FakeStore({Dio? client}) : _client = client ?? Dio() {
    auth = AuthApiSource(client: _client);
    cart = CartApiSource(client: _client);
    product = ProductApiSource(client: _client);
    user = UserApiSource(client: _client);
  }
}
