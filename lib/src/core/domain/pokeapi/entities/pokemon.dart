import '../../../data/pokeapi/entities/pokemon_data.dart';

class Pokemon {
  final int id;
  final String name;

  const Pokemon({
    required this.id,
    required this.name,
  });

  Pokemon.fromDSModel(PokemonLink model)
      : id = int.tryParse(Uri.parse(model.url).pathSegments.where((s) => s.isNotEmpty).last) ?? -1,
        name = model.name;

  String get gameImageUrl => 'http://www.serebii.net/pokemongo/pokemon/${id.toString().padLeft(3, '0')}.png';
}
