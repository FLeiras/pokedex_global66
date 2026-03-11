import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'search_query_provider.dart';
import 'get_pokemon_list_provider.dart';
import 'package:pokedex_global66/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokedex_global66/presentation/providers/type_filter_provider.dart';

part 'filtered_pokemon_provider.g.dart';

@riverpod
List<Pokemon> filteredPokemon(Ref ref) {
  final pokemonAsync = ref.watch(pokemonListProvider);
  final query = ref.watch(searchQueryProvider);
  final selectedTypes = ref.watch(typeFilterProvider);

  return pokemonAsync.when(
    data: (pokemons) {
      return pokemons.where((pokemon) {
        final matchName =
            pokemon.name.toLowerCase().contains(query.toLowerCase());

        final matchType = selectedTypes.isEmpty ||
            pokemon.types!.any((t) => selectedTypes.contains(t));

        return matchName && matchType;
      }).toList();
    },
    loading: () => [],
    error: (_, __) => [],
  );
}
