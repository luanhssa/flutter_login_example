import 'package:login_example/src/domain/repositories/repository_param.dart';

class LoginParam extends RepositoryParam {
  LoginParam({
    required this.login,
    required this.password,
  });

  final String login;
  final String password;

  @override
  Map<String, dynamic> toMap() => <String, dynamic>{
        'email': login,
        'password': password,
      };
}
