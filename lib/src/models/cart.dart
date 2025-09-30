import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
@JsonSerializable()
class Cart with _$Cart {
  int? id;
  int? userId;
  DateTime? date;
  List<CartProduct>? products;

  Cart({this.id, this.userId, this.date, this.products});

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, Object?> toJson() => _$CartToJson(this);
}

@freezed
@JsonSerializable()
class CartProduct with _$CartProduct {
  int? id;
  int? productId;
  int? quantity;

  CartProduct({this.id, this.productId, this.quantity});

  factory CartProduct.fromJson(Map<String, dynamic> json) =>
      _$CartProductFromJson(json);

  Map<String, Object?> toJson() => _$CartProductToJson(this);
}
