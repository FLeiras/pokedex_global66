import 'package:pokedex_global66/features/pokemon/domain/entities/pokemon_gender_rate.dart';

class PokemonDetail {
  final int id;
  final String name;
  final int height;
  final int weight;
  final String image;
  final List<String> types;
  final String description;
  final String category;
  final String ability;
  final GenderRate gender;
  final List<String> weaknesses;

  const PokemonDetail({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.image,
    required this.types,
    required this.description,
    required this.category,
    required this.ability,
    required this.gender,
    required this.weaknesses,
  });
}
