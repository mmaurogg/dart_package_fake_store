# Fake Store API Package

Un paquete de Dart que proporciona una envoltura simple y tipada para la popular Fake Store API, facilitando la integración de sus funcionalidades en proyectos de Dart y Flutter.

## Características

*   **Autenticación**: Inicio de sesión de usuarios.
*   **Productos**: Obtener la lista completa de productos y detalles de un producto específico.
*   **Carritos**: Gestionar carritos de compra, incluyendo obtener, crear, actualizar y eliminar.
*   **Usuarios**: Obtener información de usuarios y crear nuevos.
*   **Seguridad de tipos**: Modelos de datos fuertemente tipados para `Product`, `Cart` y `User`.
*   **Manejo de errores**: Uso de `Either` para un manejo explícito de éxito o `ApiException`.

## Pila Tecnológica y Dependencias Clave

- **[Flutter](https://flutter.dev/):** Framework para el desarrollo multiplataforma.  
- **[Freezed](https://pub.dev/packages/freezed):** Creación de clases inmutables.  
- **[json_serializable](https://pub.dev/packages/json_serializable):** Genera to/from JSON de clases.  
- **[Dio](https://pub.dev/packages/dio):** Manejo de las peticiones HTTP.  
- **[Fake Store API](https://fakestoreapi.com/):** Api encargada de datos.

## Primeros Pasos

Agrega el paquete a las dependencias de tu archivo `pubspec.yaml`:

```yaml
dependencies:
  fake_store:
    git:
      url: https://github.com/mmaurogg/dart_package_fake_store.git
      ref: main
```

Luego, ejecuta `flutter pub get` o `dart pub get`.

## Uso

Primero, importa el paquete y obtén la instancia principal para acceder a las APIs.

```dart
import 'package:fake_store_package/fake_store.dart';

final fakeStore = FakeStore.instance;
```

Luego, en la instancia busca el repositorio (`product`, `cart`, `user` y `auth`) y el metodo que te proveera los datos.

```dart
import 'package:fake_store_package/fake_store.dart';

final result = await fakeStore.product.getProducts();
```

Todas las llamadas a la API devuelven un `Either<ApiException, T>`, donde `Left` contiene un error y `Right` contiene la respuesta exitosa.

**Ejemplo para obtener todos los productos:**

```dart
import 'package:fake_store_package/src/exceptions/api_exceptions.dart';

  final result = await fakeStore.product.getProducts();

  result.fold(
    (ApiException exception) {
      // Manejar el error
      print('Ocurrió un error: ${exception.message}');
    },
    (List<Product> products) {
      // Usar la lista de productos
      print('Se encontraron ${products.length} productos.');
      // Ejemplo: print(products.first.title);
    },
  );
```

### Metodos disponibles

```dart
  //Auth
  final username = "mor_2314";
  final password = "83r5^_";
  final auth = await store.auth.login(username, password);

  //user
  final user = await store.user.getUser('1');

  final newUser = User(id: 0, username: "User 0", password: '0000');
  final addUser = await store.user.addUser(newUser);

  //Product
  final products = await store.product.getProducts();

  final product = await store.product.getProduct('2');

  //Cart
  final cart = await store.cart.getCart('1');

  final newCart = Cart(
    id: 1,
    userId: 1,
    date: DateTime.now(),
    products: [CartProduct(id: 1, productId: 1, quantity: 1)],
  );
  final addCart = await store.cart.addCart(newCart);

  newCart.products = [
    CartProduct(id: 1, productId: 1, quantity: 1),
    CartProduct(id: 2, productId: 2, quantity: 1),
  ];
  final updateCart = await store.cart.updateCart(newCart);

  final deleteCart = await store.cart.deleteCart('1');

  final carts = await store.cart.getCarts();
```

## Información Adicional

Este paquete es un cliente para la Fake Store API. Consulta su documentación oficial para obtener más detalles sobre los endpoints y los datos que devuelven.
