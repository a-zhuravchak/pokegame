import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../app/di/di.dart';
import '../../../../../core/domain/firebase/service/firebase_score_service.dart';
import '../../../../../core/domain/game/services/game_service.dart';
import '../../../../../core/domain/pokeapi/entities/pokemon.dart';
import '../../../../../core/domain/routing/routing.dart';
import '../../../game.dart';

part 'round_event.dart';
part 'round_state.dart';

const int _rounds = 5;

class RoundBloc extends Bloc<RoundEvent, RoundState> {
  final GameService _gameService = getIt();
  final ScoreFirebaseService _scoreFirebaseService = getIt();

  int _result = 0;

  RoundBloc() : super(RoundInitial()) {
    on<LoadGame>((event, emit) async {
      await _gameService.initGame(_rounds);

      add(LoadRound());
    });

    on<LoadRound>((event, emit) async {
      if (state.roundNumber == _rounds) {
        await _scoreFirebaseService.saveScore(_result);
        emit(RoundFinalResultState(state, _result));
        return;
      }
      final answers = await _gameService.startNewGameRound(state.roundNumber);
      final rightAnswer = _gameService.getCorrectPokemon(answers.toList());

      emit(state.startRound(
        pokemon: rightAnswer,
        answerOptions: answers.map((e) => e.name),
      ));
    });

    on<UserAnswered>((event, emit) {
      final currentState = state;
      if (currentState is RoundReadyState) {
        final isCorrect = event.name == currentState.pokemon.name;
        if (isCorrect) _result++;

        emit(
          state.pushRoute(
            route: GameResultRoute(
              GameResultArguments(
                pokemon: currentState.pokemon,
                answerCorrect: isCorrect,
              ),
            ),
          ),
        );
      }
    });

    add(LoadGame());
  }
}
