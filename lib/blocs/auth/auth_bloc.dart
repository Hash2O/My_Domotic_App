import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/auth_service.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final AuthService authService;

  AuthBloc(this.authService)
      : super(AuthInitial()) {

    on<LoginEvent>((event, emit) async {

      emit(AuthLoading());

      try {

        final result =
            await authService.login(
          email: event.email,
          password: event.password,
        );

        if (result['token'] != null) {

          final prefs =
              await SharedPreferences.getInstance();

          await prefs.setString(
            'jwt_token',
            result['token'],
          );

          emit(
            AuthSuccess(result['token']),
          );

        } else {

          emit(
            AuthError(
              result['error'] ??
              'Erreur login',
            ),
          );
        }

      } catch (e) {

        emit(
          AuthError(e.toString()),
        );
      }
    });

    on<RegisterEvent>((event, emit) async {

      emit(AuthLoading());

      try {

        final result =
            await authService.register(
          username: event.username,
          email: event.email,
          password: event.password,
        );

        if (result['message'] != null) {

          emit(
            const AuthSuccess('registered'),
          );

        } else {

          emit(
            AuthError(
              result['error'] ??
              'Erreur inscription',
            ),
          );
        }

      } catch (e) {

        emit(
          AuthError(e.toString()),
        );
      }
    });
  }
}