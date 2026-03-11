import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_provider.g.dart';

@riverpod
class Favorites extends _$Favorites {
  @override
  Set<String> build() {
    return <String>{};
  }

  bool isFavorite(String pokemonName) {
    return state.contains(pokemonName);
  }

  void toggleFavorite(String pokemonName) {
    if (state.contains(pokemonName)) {
      state = {...state}..remove(pokemonName);
    } else {
      state = {...state, pokemonName};
    }
  }
}
