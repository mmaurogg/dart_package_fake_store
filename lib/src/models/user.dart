import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
@JsonSerializable()
class User with _$User {
  int? id;
  String? userName;
  String? email;
  String? password;

  User({this.id, this.userName, this.email, this.password});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, Object?> toJson() => _$UserToJson(this);
}
