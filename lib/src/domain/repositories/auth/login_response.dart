import 'package:login_example/src/domain/entities/user.dart';
import 'package:login_example/src/domain/repositories/repository_response.dart';

class LoginResponse extends RepositoryResponse {
  LoginResponse({
    required int code,
    required String message,
    required this.data,
  }) : super(code: code, message: message);

  factory LoginResponse.fromJSON(Map<dynamic, dynamic> map) {
    final user = User.fromJSON(map['data'] ?? {});
    return LoginResponse(
      code: map['code'],
      message: map['message'],
      data: user is NullUser ? null : user,
    );
  }

  final User? data;

  @override
  Map<String, dynamic> toMap() => <String, dynamic>{
        'code': code,
        'message': message,
        'data': data?.toMap(),
      };
}
