import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_global66/presentation/providers/filtered_pokemon_provider.dart';
import 'package:pokedex_global66/presentation/providers/get_pokemon_list_provider.dart';
import 'package:pokedex_global66/presentation/providers/search_query_provider.dart';
import 'package:pokedex_global66/presentation/providers/type_filter_provider.dart';
import 'package:pokedex_global66/presentation/widgets/filter_bottom_sheet.dart';
import 'package:pokedex_global66/presentation/widgets/not_found_page.dart';
import 'package:pokedex_global66/presentation/widgets/poekedex_loading.dart';

import 'package:pokedex_global66/presentation/widgets/pokemon_card.dart';
import 'package:pokedex_global66/presentation/pages/pokemon_detail_page.dart';
import 'package:pokedex_global66/presentation/widgets/pokemon_search_bar.dart';
import 'package:pokedex_global66/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokedex_global66/presentation/providers/favorites_provider.dart';
import 'package:pokedex_global66/presentation/providers/favorites_filter_provider.dart';

class PokemonListPage extends ConsumerWidget {
  const PokemonListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonAsync = ref.watch(pokemonListProvider);
    // final pokemonAsync = ref.watch(pokemonListProvider);
    final pokemons = ref.watch(filteredPokemonProvider);

    return Scaffold(
      body: pokemonAsync.when(
        loading: () => const PokedexLoading(),
        error: (e, _) => Center(
          child: NotFoundPage(
            title: 'Algo salió mal...',
            message:
                'No pudimos cargar la información en este\n momento. Verifica tu conexión o intenta\n nuevamente más tarde.',
            imagePath: 'assets/images/no_found.png',
            showRetryButton: true,
            onRetry: () => ref.refresh(pokemonListProvider),
          ),
        ),
        data: (_) {
          return _PokemonListContent(
            pokemons: pokemons,
          );
        },
      ),
    );
  }
}

class _PokemonListContent extends ConsumerWidget {
  final List<Pokemon> pokemons;

  const _PokemonListContent({
    required this.pokemons,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider);
    final showOnlyFavorites = ref.watch(favoritesFilterProvider);

    final filteredPokemons = showOnlyFavorites
        ? pokemons.where((p) => favorites.contains(p.name)).toList()
        : pokemons;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              const Expanded(child: PokemonSearchBar()),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.tune),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (_) => const FilterBottomSheet(),
                  );
                },
              )
            ],
          ),
        ),
        if (filteredPokemons.length <= 19)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Se han encontrado ${filteredPokemons.length} resultados"),
                TextButton(
                  onPressed: () {
                    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                    ref.read(searchQueryProvider.notifier).state = '';
                    ref.read(typeFilterProvider.notifier).clear();
                  },
                  child: const Text("Borrar filtros"),
                )
              ],
            ),
          ),
        Expanded(
          child: filteredPokemons.isEmpty
              ? const Center(
                  child: Text('No hay Pokémon favoritos'),
                )
              : ListView.builder(
                  itemCount: filteredPokemons.length,
                  itemBuilder: (context, index) {
                    final pokemon = filteredPokemons[index];

                    return PokemonCard(
                      pokemon: pokemon,
                      types: pokemon.types ?? [],
                      isFavorite: favorites.contains(pokemon.name),
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
                    );
                  },
                ),
        ),
      ],
    );
  }
}
