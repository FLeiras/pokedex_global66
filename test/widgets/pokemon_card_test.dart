import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:pokedex_global66/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokedex_global66/presentation/widgets/pokemon_card.dart';

void main() {
  testWidgets('PokemonCard muestra el nombre del pokemon', (tester) async {
    const pokemon = Pokemon(
      name: 'bulbasaur',
      url: 'https://pokeapi.co/api/v2/pokemon/1/',
      types: ['grass'],
    );

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PokemonCard(
              pokemon: pokemon,
              types: const ['grass'],
              isFavorite: false,
              onTap: () {},
              onFavoriteTap: () {},
            ),
          ),
        ),
      );

      expect(find.text('Bulbasaur'), findsOneWidget);
    });
  });
}
