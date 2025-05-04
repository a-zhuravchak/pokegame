import 'package:get_it/get_it.dart';

import '../../core/data/pokeapi/data_source/pokemon_data_source.dart';
import '../../core/data/pokeapi/repositories/pokemon_repository_impl.dart';
import '../../core/domain/game/services/game_service.dart';
import '../../core/domain/pokeapi/repository/pokemon_repository.dart';

void setup(GetIt getIt) {
  _setupPokemonDataSource(getIt);
  _setupPokemonRepository(getIt);
  _setupGameService(getIt);
}

void _setupPokemonDataSource(GetIt getIt) {
  getIt.registerLazySingleton<PokemonRemoteDataSource>(
    () => PokemonRemoteDataSource(),
  );
}

void _setupPokemonRepository(GetIt getIt) {
  getIt.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(getIt<PokemonRemoteDataSource>()),
  );
}

void _setupGameService(GetIt getIt) {
  getIt.registerLazySingleton<GameService>(
    () => GameService(getIt<PokemonRepository>()),
  );
}
