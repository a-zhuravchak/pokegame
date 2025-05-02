// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonData _$PokemonDataFromJson(Map<String, dynamic> json) => PokemonData(
      id: (json['id'] as num).toInt(),
      abilities: json['abilities'] as List<dynamic>,
      name: json['name'] as String,
      species: json['species'],
      sprites: json['sprites'],
      stats: json['stats'] as List<dynamic>,
      height: (json['height'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
    );

Map<String, dynamic> _$PokemonDataToJson(PokemonData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'abilities': instance.abilities,
      'name': instance.name,
      'species': instance.species,
      'sprites': instance.sprites,
      'stats': instance.stats,
      'height': instance.height,
      'weight': instance.weight,
    };

PokemonListData _$PokemonListDataFromJson(Map<String, dynamic> json) =>
    PokemonListData(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => _PokemonLink.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonListDataToJson(PokemonListData instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

_PokemonLink _$PokemonLinkFromJson(Map<String, dynamic> json) => _PokemonLink(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$PokemonLinkToJson(_PokemonLink instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
