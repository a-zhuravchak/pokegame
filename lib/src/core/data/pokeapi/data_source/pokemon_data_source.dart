import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokegame/src/core/config/app_config.dart';
import 'package:pokegame/src/core/data/pokeapi/entities/pokemon_data.dart';

// abstract class PokemonDataSource{}

class PokemonRemoteDataSource {
  PokemonRemoteDataSource();
  Future<Iterable<PokemonData>> getPokemons() async {
    try {
      final uri = Uri.https(
        AppConfig.apiHost,
        '${AppConfig.apiBasePath}/pokemon',
        {'limit': '41', 'offset': '0'},
      );
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final decoded =
            jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

        final results = PokemonListData.fromJson(decoded).results;

        final result = <PokemonData>{};

        await Future.wait(results.map((pokemonLink) async {
          final pokemonDetails = await _getPokemonDetails(pokemonLink.url);
          result.add(pokemonDetails);
        }));

        if (decoded.containsKey('next')) {
          final next = decoded['next'] as String?;
          final uri = next?.let((it) => Uri.parse(it));
          print('Next page URI: $uri');
        }

        return result;
      } else {
        throw Exception('Failed to load Pokemons: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching Pokemons: $e');
      rethrow;
    }
  }

  Future<PokemonData> _getPokemonDetails(String url) async {
    final response = await http.get(Uri.parse(url));

    return PokemonData.fromJson(jsonDecode(response.body));
  }
}

extension ObjectExt<T extends Object?> on T {
  R? let<R>(R Function(T it) block) => this == null ? null : block(this);
}
