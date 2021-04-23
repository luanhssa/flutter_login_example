import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:login_example/src/core/route/navigation_service.dart';
import 'package:login_example/src/domain/entities/user.dart';
import 'package:login_example/src/domain/repositories/auth/login_param.dart';
import 'package:login_example/src/domain/repositories/auth/login_response.dart';

import 'authentication_datasource.dart';

class V1AuthDataSource implements AuthenticationDataSource {
  final Dio _dio = Dio();
  String get path => 'https://example.com/auth';

  @override
  Future<LoginResponse> login(LoginParam param) async {
    return LoginResponse(
      code: 200,
      message: 'Success',
      data: NullUser(),
    );
    try {
      // final info = await PackageInfo.fromPlatform();
      final response = await _dio.post(
        '$path/login',
        // queryParameters: <String, dynamic>{
        //   'version': '${info.version}+${info.buildNumber}',
        // },
        data: param.toMap(),
      );
      // print('Received ${response.data}');
      final data = LoginResponse.fromJSON(response.data ?? {});
      if (!data.isError && !(data.data is NullUser)) {
        // final storage = await LocalStorage.instance;
        // storage.authorization = response.headers.value('Authorization') ?? '';
        // storage.user = data.data!;
      }
      return data;
    } on DioError catch (e) {
      print('Received $e');
      ScaffoldMessenger.of(NavigationService.navigationKey.currentContext!)
        ..hideCurrentSnackBar
        ..showSnackBar(const SnackBar(
          content: Text('Authentication Failure'),
        ));
      return LoginResponse(
        code: e.response?.statusCode ?? 500,
        message: e.message,
        data: NullUser(),
      );
    }
  }
}
