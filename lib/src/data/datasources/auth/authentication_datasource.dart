import 'package:login_example/src/domain/repositories/auth/login_param.dart';
import 'package:login_example/src/domain/repositories/auth/login_response.dart';

abstract class AuthenticationDataSource {
  Future<LoginResponse> login(LoginParam param);
}
