import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthCustom {
  final FirebaseAuth _firebaseAuth;
  FirebaseAuthCustom({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  Future<UserCredential> signinWithEmail({
    required String email,
    required String password,
  }) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
