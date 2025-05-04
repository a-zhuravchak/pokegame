// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonStats _$PokemonStatsFromJson(Map<String, dynamic> json) => PokemonStats(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      baseExperience: (json['base_experience'] as num?)?.toInt(),
      order: (json['order'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toInt(),
      abilities: (json['abilities'] as List<dynamic>)
          .map((e) => Ability.fromJson(e as Map<String, dynamic>))
          .toList(),
      stats: (json['stats'] as List<dynamic>)
          .map((e) => Stat.fromJson(e as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>)
          .map((e) => Type.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Ability _$AbilityFromJson(Map<String, dynamic> json) => Ability(
      ability: LinkInfo.fromJson(json['ability'] as Map<String, dynamic>),
      isHidden: json['is_hidden'] as bool?,
      slot: (json['slot'] as num?)?.toInt(),
    );

VersionDetail _$VersionDetailFromJson(Map<String, dynamic> json) =>
    VersionDetail(
      rarity: (json['rarity'] as num?)?.toInt(),
      version: json['version'] == null
          ? null
          : LinkInfo.fromJson(json['version'] as Map<String, dynamic>),
    );

Stat _$StatFromJson(Map<String, dynamic> json) => Stat(
      baseStat: (json['base_stat'] as num?)?.toInt(),
      effort: (json['effort'] as num?)?.toInt(),
      stat: json['stat'] == null
          ? null
          : LinkInfo.fromJson(json['stat'] as Map<String, dynamic>),
    );

Type _$TypeFromJson(Map<String, dynamic> json) => Type(
      slot: (json['slot'] as num?)?.toInt(),
      type: LinkInfo.fromJson(json['type'] as Map<String, dynamic>),
    );

LinkInfo _$LinkInfoFromJson(Map<String, dynamic> json) => LinkInfo(
      name: json['name'] as String,
      url: json['url'] as String,
    );
