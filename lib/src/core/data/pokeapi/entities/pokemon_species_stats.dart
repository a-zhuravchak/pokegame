import 'package:json_annotation/json_annotation.dart';

part 'pokemon_species_stats.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class PokemonSpeciesStats {
  final int? baseHappiness;
  final List<FlavorTextEntry> flavorTextEntries;
  final int? id;
  final String? name;

  PokemonSpeciesStats({
    required this.baseHappiness,
    required this.flavorTextEntries,
    required this.id,
    required this.name,
  });

  factory PokemonSpeciesStats.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpeciesStatsFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class EvolutionChain {
  final String? url;

  EvolutionChain({
    required this.url,
  });

  factory EvolutionChain.fromJson(Map<String, dynamic> json) => _$EvolutionChainFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class FlavorTextEntry {
  final String? flavorText;
  final LinkInfo language;
  final LinkInfo? version;

  FlavorTextEntry({
    required this.flavorText,
    required this.language,
    required this.version,
  });

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) => _$FlavorTextEntryFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class LinkInfo {
  final String? name;
  final String? url;

  LinkInfo({
    required this.name,
    required this.url,
  });

  factory LinkInfo.fromJson(Map<String, dynamic> json) => _$LinkInfoFromJson(json);
}
