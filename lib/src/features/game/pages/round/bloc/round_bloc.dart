import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../app/di/di.dart';
import '../../../../../core/domain/game/services/game_service.dart';
import '../../../../../core/domain/pokeapi/entities/pokemon.dart';
import '../../../../../core/domain/routing/routing.dart';
import '../../../game.dart';

part 'round_event.dart';
part 'round_state.dart';

class RoundBloc extends Bloc<RoundEvent, RoundState> {
  final GameService _gameService = getIt();

  int result = 0;

  RoundBloc() : super(RoundInitial()) {
    on<LoadGame>((event, emit) async {
      await _gameService.initGame(5);

      add(LoadRound(0));
    });

    on<LoadRound>((event, emit) async {
      if (event.roundNumber == 5) {
        emit(RoundFinalResultState(state, result));
        return;
      }
      final answers = await _gameService.startNewGameRound(event.roundNumber);
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
        if (isCorrect) result++;

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
