part of 'round_bloc.dart';

@immutable
sealed class RoundEvent {}

final class LoadGame extends RoundEvent {}

final class LoadRound extends RoundEvent {
  LoadRound();
}

final class UserAnswered extends RoundEvent {
  final String name;

  UserAnswered({required this.name});
}
