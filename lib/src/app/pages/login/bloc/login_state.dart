part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.username = '',
    this.password = '',
    this.loading = false,
  });

  final String username;
  final String password;
  final bool loading;

  LoginState copyWith({
    String? username,
    String? password,
    bool loading = false,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      loading: loading,
    );
  }

  @override
  List<Object> get props => [username, password, loading];
}
