import 'package:fake_store/fake_store.dart';

Future<void> main() async {
  final store = FakeStore();

  //Auth
  final username = "mor_2314";
  final password = "83r5^_";
  final auth = await store.auth.login(username, password);
  auth.fold((l) => print(l), (r) => print(r));

  //user
  final user = await store.user.getUser('1');
  user.fold((l) => print(l), (r) => print(r));

  final newUser = User(id: 0, username: "User 0", password: '0000');
  final addUser = await store.user.addUser(newUser);
  addUser.fold((l) => print(l), (r) => print(r));

  //Product
  final products = await store.product.getProducts();
  products.fold((l) => print(l), (r) => print(r));

  final product = await store.product.getProduct('2');
  product.fold((l) => print(l), (r) => print(r));

  //Cart
  final cart = await store.cart.getCart('1');
  cart?.fold((l) => print(l), (r) => print(r));

  final newCart = Cart(
    id: 1,
    userId: 1,
    date: DateTime.now(),
    products: [CartProduct(id: 1, productId: 1, quantity: 1)],
  );

  final addCart = await store.cart.addCart(newCart);
  addCart?.fold((l) => print(l), (r) => print(r));

  newCart.products = [
    CartProduct(id: 1, productId: 1, quantity: 1),
    CartProduct(id: 2, productId: 2, quantity: 1),
  ];

  final updateCart = await store.cart.updateCart(newCart);
  updateCart?.fold((l) => print(l), (r) => print(r));

  final deleteCart = await store.cart.deleteCart('1');
  deleteCart?.fold((l) => print(l), (r) => print(r));

  final carts = await store.cart.getCarts();
  carts?.fold((l) => print(l), (r) => print(r));
}
