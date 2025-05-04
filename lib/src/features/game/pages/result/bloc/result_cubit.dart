import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../app/di/di.dart';
import '../../../../../core/domain/pokeapi/entities/pokemon_expanded.dart';
import '../../../../../core/domain/pokeapi/repository/pokemon_repository.dart';

part 'result_state.dart';

class ResultCubit extends Cubit<ResultState> {
  final PokemonRepository repository = getIt();

  ResultCubit() : super(ResultInitial());

  fetchStats(String pokemonName) async {
    emit(ResultLoading());
    final stats = await repository.getPokemonStats(pokemonName);

    emit(ResultLoaded(pokemonStats: stats));
  }
}
