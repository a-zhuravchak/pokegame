import 'package:json_annotation/json_annotation.dart';

part 'pokemon_data.g.dart';

@JsonSerializable()
class PokemonListData {
  final int count;
  final String? next;
  final String? previous;
  final List<PokemonLink> results;

  const PokemonListData(
      {required this.count, required this.next, required this.previous, required this.results});

  factory PokemonListData.fromJson(Map<String, dynamic> json) => _$PokemonListDataFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonListDataToJson(this);
}

@JsonSerializable()
class PokemonLink {
  final String name;
  final String url;

  const PokemonLink({required this.name, required this.url});

  factory PokemonLink.fromJson(Map<String, dynamic> json) => _$PokemonLinkFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonLinkToJson(this);
}
