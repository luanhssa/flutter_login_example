import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_example/src/data/datasources/auth/v1_auth_datasource.dart';
import 'package:login_example/src/data/repositories/auth/data_authentication_repository.dart';

import 'bloc/login_bloc.dart';
import 'login_view.dart';

class LoginPage extends StatelessWidget {
  static String get routeName => '/login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(
        authenticationRepository:
            DataAuthenticationRepository(V1AuthDataSource()),
      ),
      child: LoginView(),
    );
  }
}
