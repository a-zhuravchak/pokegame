part of 'splash_bloc.dart';

@immutable
sealed class SplashEvent {}

class SplashInitEvent extends SplashEvent {}

class SplashAnimationFinishedEvent extends SplashEvent {}

class SplashFinishedEvent extends SplashEvent {
  SplashFinishedEvent({required this.route});

  final AppRoute route;
}
