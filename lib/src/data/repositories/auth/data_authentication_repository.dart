import 'package:login_example/src/data/datasources/auth/authentication_datasource.dart';
import 'package:login_example/src/domain/repositories/auth/authentication_repository.dart';
import 'package:login_example/src/domain/repositories/auth/login_param.dart';
import 'package:login_example/src/domain/repositories/auth/login_response.dart';

class DataAuthenticationRepository implements AuthenticationRepository {
  DataAuthenticationRepository(this._dataSource);

  final AuthenticationDataSource _dataSource;
  @override
  Future<LoginResponse> login(LoginParam param) async {
    return await _dataSource.login(param);
  }
}
