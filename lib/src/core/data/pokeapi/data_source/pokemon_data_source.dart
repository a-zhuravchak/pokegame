import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../config/app_config.dart';
import '../entities/pokemon_data.dart';
import '../entities/pokemon_species_stats.dart';
import '../entities/pokemon_stats.dart';

class PokemonRemoteDataSource {
  Future<PokemonListData> getPokemons() async {
    try {
      final uri = Uri.https(
        AppConfig.apiHost,
        '${AppConfig.apiBasePath}/pokemon',
        {'limit': '1025', 'offset': '0'},
      );
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body) as Map<String, dynamic>;

        final results = PokemonListData.fromJson(decoded);

        return results;
      } else {
        throw Exception('Failed to load Pokemons: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<PokemonStats> getPokemonStats({required String name}) async {
    try {
      final uri = Uri.https(AppConfig.apiHost, '${AppConfig.apiBasePath}/pokemon/$name');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body) as Map<String, dynamic>;

        final results = PokemonStats.fromJson(decoded);

        return results;
      } else {
        throw Exception('Failed to load Pokemon Stats: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<PokemonSpeciesStats> getPokemonSpeciesStats({required String name}) async {
    try {
      final uri = Uri.https(AppConfig.apiHost, '${AppConfig.apiBasePath}/pokemon-species/$name');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body) as Map<String, dynamic>;

        final results = PokemonSpeciesStats.fromJson(decoded);

        return results;
      } else {
        throw Exception('Failed to load Pokemon Stats: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
