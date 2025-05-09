import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../app/di/di.dart';
import '../../../../core/domain/firebase/service/firebase_auth_service.dart';
import '../../../../core/domain/routing/routing.dart';
import '../../../game/game.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuthService _authService = getIt();
  AuthBloc() : super(AuthState.initial()) {
    on<AuthSignUp>((event, emit) async {
      try {
        await _authService.registerWithEmail(
          event.email,
          event.password,
        );
      } on FirebaseAuthException catch (err) {
        debugPrint(err.message);

        emit(AuthError(state, err));
      }
    });

    on<AuthSignIn>((event, emit) async {
      emit(AuthLoading(state));
      try {
        await _authService.signInWithEmail(
          event.email,
          event.password,
        );

        emit(AuthPushRoute(state, GameInitialRoute()));
      } on FirebaseAuthException catch (err) {
        debugPrint(err.message);
        emit(AuthError(state, err));
      }
    });

    on<AuthSwitchAuthMethod>((event, emit) {
      emit(state.copyWith(authMethod: state.authMethod.opposite));
    });
  }
}

enum AuthMethod {
  signIn,
  signUp,
  ;

  AuthMethod get opposite {
    switch (this) {
      case AuthMethod.signIn:
        return AuthMethod.signUp;
      case AuthMethod.signUp:
        return AuthMethod.signIn;
    }
  }
}
