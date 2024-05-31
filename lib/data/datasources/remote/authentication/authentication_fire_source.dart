import 'package:firebase_auth/firebase_auth.dart';
import '../../../../domain/models/authentication_user.dart';
import 'i_authentication_source.dart';

class AuthenticationFireSource implements IAuthenticationSource {
  @override
  Future<bool> logOut() async {
    // TODO implement logOut with Firebase
    return Future.value(true);
  }

  @override
  Future<bool> login(String username, String password) async {
    // TODO: implement login with Firebase
    return Future.value(true);
  }

  @override
  Future<bool> signUp(AuthenticationUser user) async {
    // TODO: implement signUp with Firebase
    return Future.value(false);
  }
}
