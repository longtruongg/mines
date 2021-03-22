import 'package:firebase_auth/firebase_auth.dart';
import 'package:mineapss/service/authentication_service.dart';

class AuthenticationServiceImpl extends AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> sendEmailVerification() async {
    User user = await _firebaseAuth.currentUser;
    return user.sendEmailVerification();
  }

  @override
  Future<bool> isEmailVerify() async {
    User user = await _firebaseAuth.currentUser;
    return user.emailVerified;
  }

  @override
  Future<String> createWithEmailPassWord(
      {String email, String password}) async {
    try {
      User user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password) as User;
      return user.uid;
    } on Exception catch (e) {
      return "On errors :${e.toString()}";
    }
  }

  @override
  FirebaseAuth getFirebaseAuth() {
    return _firebaseAuth;
  }

  @override
  Future<String> getUserUid() async {
    User user = await _firebaseAuth.currentUser;
    return user.uid;
  }

  @override
  Future<String> signInWithEmailPassWord(
      {String email, String password}) async {
    try {
      User user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password) as User;
      return user.uid;
    } on Exception catch (e) {
      return "On errors :${e.toString()}";
    }
  }

  @override
  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}
