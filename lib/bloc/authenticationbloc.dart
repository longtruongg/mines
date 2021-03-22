import 'dart:async';

import 'package:mineapss/service/authentication_service.dart';
import 'package:mineapss/service/impl/authentication_service_impl.dart';

class AuthenticationBloc {
  final AuthenticationServiceImpl authenticationService;
  final StreamController<String> _authenController = StreamController<String>();

  Sink<String> get addUser => _authenController.sink;

  Stream<String> get user => _authenController.stream;
  final StreamController<bool> _logoutController = StreamController<bool>();

  Sink<bool> get logoutUser => _logoutController.sink;

  Stream<bool> get listLogOutUser => _logoutController.stream;

  AuthenticationBloc({this.authenticationService}) {
    onAuthChange();
  }

  void onAuthChange() {
    authenticationService.getFirebaseAuth().authStateChanges().listen((user) {
      final String userId = user != null ? user.uid : null;
      addUser.add(userId);
    });
    _logoutController.stream.listen((logOut) {
      if (logOut == true) _signOut();
    });
  }


  void _signOut() {
    authenticationService.signOut();
  }

  void dispose() {
    _logoutController.close();
    _authenController.close();
  }
}
