import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(AuthState()) {
    on<SignInRequested>((event, emit) async {
      emit(state.copyWith(status: AuthStatus.loading));
      try {
        final user = await _authRepository.signInWithEmailAndPassword(event.email, event.password);
        if (user != null) {
          emit(state.copyWith(status: AuthStatus.success, user: user));
        } else {
          emit(state.copyWith(status: AuthStatus.error, errorMessage: 'Sign in failed'));
        }
      } catch (e) {
        emit(state.copyWith(status: AuthStatus.error, errorMessage: e.toString()));
      }
    });

    on<SignOutRequested>((event, emit) async {
      await _authRepository.signOut();
      emit(state.copyWith(status: AuthStatus.initial, user: null));
    });
  }
}
