import '../entities/pokemon.dart';
import '../entities/pokemon_expanded.dart';

abstract interface class PokemonRepository {
  Future<Iterable<Pokemon>> getAllPokemons();
  Future<Iterable<Pokemon>> getRandomPokemons(int count);
  Future<PokemonExpanded> getPokemonStats(String name);
}
