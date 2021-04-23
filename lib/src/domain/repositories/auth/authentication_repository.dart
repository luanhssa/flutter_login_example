import 'login_param.dart';
import 'login_response.dart';

abstract class AuthenticationRepository {
  Future<LoginResponse> login(LoginParam param);
}
