part of 'splash_bloc.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}

final class SplashGoRoute extends SplashState {
  SplashGoRoute({required this.route});

  final AppRoute route;
}
