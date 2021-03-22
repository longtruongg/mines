import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationService {
  Future<void> sendEmailVerifycation();

  Future<bool> isEmailVerify();
}
