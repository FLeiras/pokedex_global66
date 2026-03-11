import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_global66/features/pokemon/domain/entities/pokemon_detail.dart';
import 'package:pokedex_global66/features/pokemon/domain/entities/pokemon_gender_rate.dart';

void main() {
  test('PokemonDetail se crea correctamente', () {
    const pokemon = PokemonDetail(
      id: 25,
      name: 'pikachu',
      height: 4,
      weight: 60,
      image: 'url',
      types: ['electric'],
      description: 'mouse pokemon',
      category: 'mouse',
      ability: 'static',
      gender: GenderRate(male: 0.5, female: 0.5),
      weaknesses: ['ground'],
    );

    expect(pokemon.name, 'pikachu');
    expect(pokemon.types.first, 'electric');
  });
}
