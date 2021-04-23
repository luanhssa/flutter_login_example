import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_example/src/app/pages/home/home_page.dart';
import 'package:login_example/src/core/route/navigation_service.dart';
import 'package:login_example/src/core/utils/input_validation.dart';
import 'package:login_example/src/domain/repositories/auth/authentication_repository.dart';
import 'package:login_example/src/domain/repositories/auth/login_param.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })   : _authenticationRepository = authenticationRepository,
        super(const LoginState());

  final AuthenticationRepository _authenticationRepository;

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginUsernameChanged) {
      yield state.copyWith(username: event.username);
    } else if (event is LoginPasswordChanged) {
      yield state.copyWith(password: event.password);
    } else if (event is LoginSubmitted) {
      yield* _onSubmit(event, state);
    }
  }

  Stream<LoginState> _onSubmit(LoginSubmitted event, LoginState state) async* {
    yield state.copyWith(loading: true);
    try {
      final emailValidation = InputValidation.validateEmail(state.username);
      final passValidation = InputValidation.validatePassword(state.password);
      final isValid = emailValidation ?? passValidation ?? '';
      if (isValid.isNotEmpty) {
        NavigationService.showSnackbarMessage(isValid);
        yield state.copyWith(loading: false);
      } else {
        final response = await _authenticationRepository
            .login(LoginParam(login: state.username, password: state.password));
        yield state.copyWith(loading: false);

        if (response.isNotError) {
          await navigationService.pushReplacement(HomePage.routeName);
        }
      }
    } on Exception catch (_) {
      yield state.copyWith(loading: false);
    }
  }
}
