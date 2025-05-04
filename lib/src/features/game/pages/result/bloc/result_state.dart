part of 'result_cubit.dart';

@immutable
sealed class ResultState {}

final class ResultInitial extends ResultState {}

final class ResultLoading extends ResultState {}

final class ResultLoaded extends ResultState {
  final PokemonExpanded pokemonStats;

  ResultLoaded({required this.pokemonStats});
}
