import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_global66/presentation/pages/home_page.dart';
import 'package:pokedex_global66/presentation/pages/pokemon_detail_page.dart';
import 'package:pokedex_global66/presentation/widgets/not_found_page.dart';

import '../widgets/pokemon_card.dart';
import '../providers/favorites_provider.dart';
import 'package:pokedex_global66/presentation/providers/get_pokemon_list_provider.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider);
    final pokemonListAsync = ref.watch(pokemonListProvider);

    final bool hasFavorites = favorites.isNotEmpty;

    return Scaffold(
      appBar: hasFavorites
          ? AppBar(
              centerTitle: true,
              title: const Text(
                'Favoritos',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const HomePage(),
                    ),
                  );
                },
              ),
            )
          : null,
      body: pokemonListAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (pokemons) {
          final favoritePokemons =
              pokemons.where((p) => favorites.contains(p.name)).toList();

          if (!hasFavorites) {
            return const NotFoundPage(
              title: 'No has marcado ningún\n Pokémon como favorito',
              message:
                  'Haz clic en el ícono de corazón de tus\n Pokémon favoritos y aparecerán aquí.',
              imagePath: 'assets/images/no_found.png',
              showRetryButton: false,
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(5),
            itemCount: favoritePokemons.length,
            itemBuilder: (context, index) {
              final pokemon = favoritePokemons[index];

              return Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Dismissible(
                  key: Key(pokemon.name),
                  direction: DismissDirection.endToStart,
                  onDismissed: (_) {
                    ref
                        .read(favoritesProvider.notifier)
                        .toggleFavorite(pokemon.name);
                  },
                  background: Container(),
                  secondaryBackground: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: PokemonCard(
                      pokemon: pokemon,
                      types: pokemon.types,
                      isFavorite: true,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => PokemonDetailPage(
                              pokemon: pokemon,
                            ),
                          ),
                        );
                      },
                      onFavoriteTap: () {
                        ref
                            .read(favoritesProvider.notifier)
                            .toggleFavorite(pokemon.name);
                      },
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
