import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationService {
  Future<void> sendEmailVerification();

  Future<bool> isEmailVerify();

  getFirebaseAuth();

  Future<void> signOut();

  Future<String> signInWithEmailPassWord({String email, String password});

  Future<String> createWithEmailPassWord({String email, String password});

  Future<String> getUserUid();
}
