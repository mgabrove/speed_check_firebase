import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_speed_check/models/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserLocal? _userFromFirebaseUser(FirebaseUser user) {
    if(user != null) {
      return UserLocal(uid: user.uid);
    } else {
      return null;
    }
  }

  Stream<UserLocal?> get user {
    return _auth.onAuthStateChanged
        .map(_userFromFirebaseUser);
  }

  // sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}