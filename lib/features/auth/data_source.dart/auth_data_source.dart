import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_flutter/core/provider/firebase_provider.dart';
import 'package:rick_morty_flutter/models/firebase_auth_state.dart';

class AuthDataSource {
  final FirebaseAuth _firebaseAuth;

  AuthDataSource(this._firebaseAuth);

  Future<FirebaseLoginState> signup(
      {required String email, required String password}) async {
    try {
      final response = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return FirebaseLoginState(loginUser: response.user!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return login(email: email, password: password);
      } else if (e.code == 'weak-password') {
        return FirebaseLoginState(
            message: 'The password provided is too weak.');
      } else {
        return FirebaseLoginState(message: e.message ?? 'Failed to SignUp.');
      }
    }
  }

  Future<FirebaseLoginState> login(
      {required String email, required String password}) async {
    try {
      final response = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return FirebaseLoginState(loginUser: response.user!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        return FirebaseLoginState(
            message: 'Wrong password provided for that user.');
      } else {
        return FirebaseLoginState(message: e.message ?? 'Failed to Login.');
      }
    }
  }

  Future<void> logOutUser() async {
    return _firebaseAuth.signOut();
  }
}

final authDataSourceProvider = Provider<AuthDataSource>(
  (ref) => AuthDataSource(ref.read(firebaseAuthProvider)),
);
