 
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  const UserModel({
    required this.email,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.profilePicture,
    required this.id,
  });
  final String id;
  final String email;
  final String userName;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String profilePicture;
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  /// Connect the generated [_$UserModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
