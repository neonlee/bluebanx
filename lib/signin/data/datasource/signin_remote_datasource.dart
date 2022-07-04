import 'package:bluebenx/infra/firebase/firebase_auth.dart';
import 'package:bluebenx/signin/data/model/user_model.dart';
import 'package:bluebenx/signin/domain/entity/user_entity.dart';

abstract class SigninRemoteDatasource {
  Future<UserEntity> signin({
    required String email,
    required String password,
  });
}

class SigninRemoteDatasourceImpl extends SigninRemoteDatasource {
  final FirebaseAuthCustom _firebaseAuthCustom;

  SigninRemoteDatasourceImpl({
    required FirebaseAuthCustom firebaseAuthCustom,
  }) : _firebaseAuthCustom = firebaseAuthCustom;

  @override
  Future<UserEntity> signin({
    required String email,
    required String password,
  }) async {
    try {
      var response = await _firebaseAuthCustom.signinWithEmail(
        email: email,
        password: password,
      );

      return UserModel.formUser(response.user!);
    } catch (e) {
      rethrow;
    }
  }
}
