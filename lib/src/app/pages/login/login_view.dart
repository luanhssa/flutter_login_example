import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login_bloc.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (previous, current) =>
                    previous.username != current.username,
                builder: (context, state) {
                  return TextField(
                    key: Key('#login.input.username'),
                    onChanged: (username) => context
                        .read<LoginBloc>()
                        .add(LoginUsernameChanged(username)),
                    decoration: InputDecoration(labelText: 'username'),
                  );
                },
              ),
              BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (previous, current) =>
                    previous.password != current.password,
                builder: (context, state) {
                  return TextField(
                    key: Key('#login.input.password'),
                    onChanged: (password) => context
                        .read<LoginBloc>()
                        .add(LoginPasswordChanged(password)),
                    decoration: InputDecoration(labelText: 'password'),
                  );
                },
              ),
              BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (previous, current) =>
                    previous.loading != current.loading,
                builder: (context, state) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: state.loading
                          ? null
                          : () => context
                              .read<LoginBloc>()
                              .add(const LoginSubmitted()),
                      child: state.loading
                          ? SizedBox(
                              height: 20,
                              width: 20,
                              child: Center(child: CircularProgressIndicator()),
                            )
                          : Text('Submit'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
