import 'package:firebase_auth/firebase_auth.dart';

class FirebaseLoginState {
  final User? loginUser;
  final String? message;

  FirebaseLoginState({this.loginUser, this.message});
}
