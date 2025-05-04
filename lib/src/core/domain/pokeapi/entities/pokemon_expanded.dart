import '../../../data/pokeapi/entities/pokemon_species_stats.dart';
import '../../../data/pokeapi/entities/pokemon_stats.dart';

class PokemonExpanded {
  final int id;
  final String name;
  final int? height;
  final int? weight;
  final int? baseExperience;
  final int? baseHappiness;
  final Iterable<String> types;
  final String? flavorText;
  final Iterable<String> abilities;
  // final List<Stat>? stats;

  const PokemonExpanded({
    required this.id,
    required this.name,
    this.height,
    this.weight,
    this.baseExperience,
    this.baseHappiness,
    this.flavorText,
    this.types = const [],
    this.abilities = const [],
  });

  factory PokemonExpanded.empty() => PokemonExpanded(id: -1, name: '');

  PokemonExpanded.fromDSModels(PokemonStats model, PokemonSpeciesStats model2)
      : id = model.id,
        name = model.name,
        height = model.height,
        weight = model.weight,
        baseExperience = model.baseExperience,
        baseHappiness = model2.baseHappiness,
        flavorText = model2.flavorTextEntries.firstWhere((e) => e.language.name == 'en').flavorText,
        types = model.types.map((e) => e.type.name),
        abilities = model.abilities.map((e) => e.ability.name);
}
