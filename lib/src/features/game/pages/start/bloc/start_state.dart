part of 'start_cubit.dart';

@immutable
sealed class StartState {
  final List<ScoreEntry> scores;
  final List<ScoreEntry> usersScores;
  final bool isLoading;

  const StartState({
    this.scores = const [],
    this.usersScores = const [],
    this.isLoading = true,
  });

  StartState copyWith({
    List<ScoreEntry>? scores,
    List<ScoreEntry>? usersScores,
    bool? isLoading,
  }) {
    return StartInitial(
      scores: scores ?? this.scores,
      usersScores: usersScores ?? this.usersScores,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

final class StartInitial extends StartState {
  const StartInitial({
    super.scores = const [],
    super.usersScores = const [],
    super.isLoading = true,
  });
}

final class StartGoRoute extends StartState {
  final AppRoute route;

  const StartGoRoute({required this.route});
}
