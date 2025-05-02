part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  final AuthMethod authMethod;

  const AuthState({this.authMethod = AuthMethod.signIn});

  AuthState.fromState(AuthState state) : authMethod = state.authMethod;

  static initial() => const AuthIdle._initial();

  AuthState copyWith({
    AuthMethod? authMethod,
  }) {
    return AuthIdle(
      authMethod: authMethod ?? this.authMethod,
    );
  }
}

final class AuthIdle extends AuthState {
  const AuthIdle({required super.authMethod});

  const AuthIdle._initial() : super(authMethod: AuthMethod.signIn);
}

final class AuthLoading extends AuthState {
  AuthLoading(super.state) : super.fromState();
}

final class AuthError extends AuthState {
  final Exception exception;

  AuthError(super.state, this.exception) : super.fromState();
}

final class AuthPushRoute extends AuthState {
  final AppRoute route;

  AuthPushRoute(super.state, this.route) : super.fromState();
}
