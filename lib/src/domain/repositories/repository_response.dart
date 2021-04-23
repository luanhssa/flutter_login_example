import 'dart:convert';

class RepositoryResponse {
  RepositoryResponse({
    required this.code,
    required this.message,
  });

  factory RepositoryResponse.fromJSON(Map<String, dynamic> map) {
    return RepositoryResponse(
      code: map['code'],
      message: map['message'],
    );
  }

  final int code;
  final String message;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'code': code,
        'message': message,
      };

  bool get isError => code != 200 && code != 201;

  bool get isNotError => !isError;

  @override
  String toString() => json.encode(toMap());
}
