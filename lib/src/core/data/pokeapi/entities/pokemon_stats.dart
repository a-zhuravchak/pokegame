import 'package:json_annotation/json_annotation.dart';

part 'pokemon_stats.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class PokemonStats {
  final int id;
  final String name;
  final int? baseExperience;
  final int? order;
  final int? height;
  final int? weight;
  final List<Ability> abilities;
  final List<Stat> stats;
  final List<Type> types;

  PokemonStats({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.order,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.stats,
    required this.types,
  });

  factory PokemonStats.fromJson(Map<String, dynamic> json) => _$PokemonStatsFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class Ability {
  final LinkInfo ability;
  final bool? isHidden;
  final int? slot;

  const Ability({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  factory Ability.fromJson(Map<String, dynamic> json) => _$AbilityFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class VersionDetail {
  final int? rarity;
  final LinkInfo? version;

  const VersionDetail({
    required this.rarity,
    required this.version,
  });

  factory VersionDetail.fromJson(Map<String, dynamic> json) => _$VersionDetailFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class Stat {
  final int? baseStat;
  final int? effort;
  final LinkInfo? stat;

  const Stat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class Type {
  final int? slot;
  final LinkInfo type;

  const Type({
    required this.slot,
    required this.type,
  });

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class LinkInfo {
  final String name;
  final String url;

  const LinkInfo({
    required this.name,
    required this.url,
  });

  factory LinkInfo.fromJson(Map<String, dynamic> json) => _$LinkInfoFromJson(json);
}
