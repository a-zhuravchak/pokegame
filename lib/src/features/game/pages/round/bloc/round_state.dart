part of 'round_bloc.dart';

@immutable
sealed class RoundState {
  final int roundNumber;

  const RoundState(this.roundNumber);

  RoundState.fromState(RoundState state) : roundNumber = state.roundNumber;

  RoundReadyState startRound({required Pokemon pokemon, required Iterable<String> answerOptions}) =>
      RoundReadyState.fromState(this, pokemon: pokemon, answerOptions: answerOptions);

  RoundStatePushRoute pushRoute({required AppRoute route}) =>
      RoundStatePushRoute.fromState(this, route: route);
}

final class RoundInitial extends RoundState {
  const RoundInitial() : super(0);
}

final class RoundStatePushRoute extends RoundState {
  final AppRoute route;

  RoundStatePushRoute.fromState(super.state, {required this.route}) : super.fromState();
}

final class RoundReadyState extends RoundState {
  final Pokemon pokemon;
  final Iterable<String> answerOptions;

  RoundReadyState.fromState(
    RoundState state, {
    required this.pokemon,
    required this.answerOptions,
  }) : super(state.roundNumber + 1);
}

final class RoundFinalResultState extends RoundState {
  final int result;

  RoundFinalResultState(super.state, this.result) : super.fromState();
}
