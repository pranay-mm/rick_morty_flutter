import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_flutter/features/auth/data_source.dart/auth_data_source.dart';
import 'package:rick_morty_flutter/features/auth/provider/state/authentication_state.dart';

class AuthNotifier extends StateNotifier<AuthenticationState> {
  AuthNotifier(this._dataSource) : super(const AuthenticationState.initial());

  final AuthDataSource _dataSource;

  Future<void> login({required String email, required String password}) async {
    state = const AuthenticationState.loading();
    //For now call signup first and check if user already is there then call login
    final response = await _dataSource.signup(email: email, password: password);
    state = response.loginUser != null
        ? AuthenticationState.authenticated(user: response.loginUser!)
        : AuthenticationState.unauthenticated(message: response.message);
  }

  Future<void> logOut() async {
    return _dataSource.logOutUser();
  }
}

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthenticationState>(
  (ref) => AuthNotifier(ref.read(authDataSourceProvider)),
);
