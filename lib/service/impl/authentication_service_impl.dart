import 'package:firebase_auth/firebase_auth.dart';
import 'package:mineapss/service/authentication_service.dart';

class AuthenticationServiceImpl extends AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> sendEmailVerifycation() async {
    User user = await _firebaseAuth.currentUser;
    return user.sendEmailVerification();
  }

  @override
  Future<bool> isEmailVerify() async {
    User user = await _firebaseAuth.currentUser;
    return user.emailVerified;
  }
}
