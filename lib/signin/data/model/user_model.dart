import 'package:bluebenx/signin/domain/entity/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.email,
    required super.name,
  });

  factory UserModel.formUser(User userCredential) {
    return UserModel(
      email: userCredential.email,
      name: userCredential.displayName,
    );
  }
}
