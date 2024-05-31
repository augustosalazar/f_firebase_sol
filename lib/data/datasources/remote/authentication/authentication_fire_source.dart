import 'package:firebase_auth/firebase_auth.dart';
import '../../../../domain/models/authentication_user.dart';
import 'i_authentication_source.dart';

class AuthenticationFireSource implements IAuthenticationSource {
  @override
  Future<bool> logOut() async {
    // TODO implement logOut with Firebase
    await FirebaseAuth.instance.signOut();
    return Future.value(true);
  }

  @override
  Future<bool> login(String username, String password) async {
    // TODO: implement login with Firebase
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: username, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Future.error('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return Future.error('Wrong password provided for that user.');
      }
      return Future.value(false);
    } catch (e) {
      return Future.error(e);
    }
    return Future.value(true);
  }

  @override
  Future<bool> signUp(AuthenticationUser user) async {
    // TODO: implement signUp with Firebase
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: user.username, password: user.password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Future.error('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return Future.error('The account already exists for that email.');
      }
      return Future.value(false);
    } catch (e) {
      return Future.error(e);
    }
    return Future.value(true);
  }
}
