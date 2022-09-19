import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ARduckFirebaseUser {
  ARduckFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

ARduckFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ARduckFirebaseUser> aRduckFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<ARduckFirebaseUser>((user) => currentUser = ARduckFirebaseUser(user));
