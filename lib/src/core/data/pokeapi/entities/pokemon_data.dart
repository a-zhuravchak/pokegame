import 'package:json_annotation/json_annotation.dart';

part 'pokemon_data.g.dart';

@JsonSerializable()
class PokemonData {
  final int id;
  final List<dynamic> abilities;
  final String name;
  final dynamic species;
  final dynamic sprites;
  final List<dynamic> stats;
  final int height;
  final int weight;

  const PokemonData(
      {required this.id,
      required this.abilities,
      required this.name,
      required this.species,
      required this.sprites,
      required this.stats,
      required this.height,
      required this.weight});

  factory PokemonData.fromJson(Map<String, dynamic> json) =>
      _$PokemonDataFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonDataToJson(this);
}

@JsonSerializable()
class PokemonListData {
  final int count;
  final String? next;
  final String? previous;
  final List<_PokemonLink> results;

  const PokemonListData(
      {required this.count,
      required this.next,
      required this.previous,
      required this.results});

  factory PokemonListData.fromJson(Map<String, dynamic> json) =>
      _$PokemonListDataFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonListDataToJson(this);
}

@JsonSerializable()
class _PokemonLink {
  final String name;
  final String url;

  const _PokemonLink({required this.name, required this.url});

  factory _PokemonLink.fromJson(Map<String, dynamic> json) =>
      _$PokemonLinkFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonLinkToJson(this);
}
