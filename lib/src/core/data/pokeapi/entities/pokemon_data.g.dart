// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonListData _$PokemonListDataFromJson(Map<String, dynamic> json) =>
    PokemonListData(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => PokemonLink.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonListDataToJson(PokemonListData instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

PokemonLink _$PokemonLinkFromJson(Map<String, dynamic> json) => PokemonLink(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$PokemonLinkToJson(PokemonLink instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
