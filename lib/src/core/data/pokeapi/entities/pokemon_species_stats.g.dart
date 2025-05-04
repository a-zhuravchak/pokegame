// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_species_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonSpeciesStats _$PokemonSpeciesStatsFromJson(Map<String, dynamic> json) =>
    PokemonSpeciesStats(
      baseHappiness: (json['base_happiness'] as num?)?.toInt(),
      flavorTextEntries: (json['flavor_text_entries'] as List<dynamic>)
          .map((e) => FlavorTextEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

EvolutionChain _$EvolutionChainFromJson(Map<String, dynamic> json) =>
    EvolutionChain(
      url: json['url'] as String?,
    );

FlavorTextEntry _$FlavorTextEntryFromJson(Map<String, dynamic> json) =>
    FlavorTextEntry(
      flavorText: json['flavor_text'] as String?,
      language: LinkInfo.fromJson(json['language'] as Map<String, dynamic>),
      version: json['version'] == null
          ? null
          : LinkInfo.fromJson(json['version'] as Map<String, dynamic>),
    );

LinkInfo _$LinkInfoFromJson(Map<String, dynamic> json) => LinkInfo(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );
