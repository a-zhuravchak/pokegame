import '../../../domain/pokeapi/entities/pokemon.dart';
import '../../../domain/pokeapi/entities/pokemon_expanded.dart';
import '../../../domain/pokeapi/repository/pokemon_repository.dart';
import '../data_source/pokemon_data_source.dart';
import '../entities/pokemon_species_stats.dart';
import '../entities/pokemon_stats.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource dataSource;

  PokemonRepositoryImpl(this.dataSource);

  @override
  Future<Iterable<Pokemon>> getAllPokemons() async {
    final raw = await dataSource.getPokemons();
    return raw.results.map(Pokemon.fromDSModel).toList();
  }

  @override
  Future<Iterable<Pokemon>> getRandomPokemons(int count) async {
    final pokemons = await getAllPokemons();
    final randomized = pokemons.toList()..shuffle();

    return randomized.take(count);
  }

  @override
  Future<PokemonExpanded> getPokemonStats(String name) async {
    final pokemonStats = await Future.wait([
      dataSource.getPokemonStats(name: name),
      dataSource.getPokemonSpeciesStats(name: name),
    ]);

    return PokemonExpanded.fromDSModels(
      pokemonStats.first as PokemonStats,
      pokemonStats.last as PokemonSpeciesStats,
    );
  }
}
