import 'dart:math';

import '../../pokeapi/entities/pokemon.dart';
import '../../pokeapi/repository/pokemon_repository.dart';

const _optionsInRound = 4;

class GameService {
  final PokemonRepository repository;
  final Random _rng = Random();

  Iterable<Pokemon>? _gameData;

  GameService(this.repository);

  Future<void> initGame(int rounds) async {
    _gameData = await repository.getRandomPokemons(rounds * _optionsInRound);
  }

  Future<Iterable<Pokemon>> startNewGameRound(int roundIndex) async {
    final gameData = _gameData;

    if (gameData == null || gameData.length < roundIndex * _optionsInRound) {
      throw Exception('Game not initialized or initialized incorrectly');
    }

    return gameData.skip(roundIndex * _optionsInRound).take(_optionsInRound);
  }

  Pokemon getCorrectPokemon(List<Pokemon> options) => options[_rng.nextInt(options.length)];
}
