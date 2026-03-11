import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_global66/presentation/providers/favorites_provider.dart';

void main() {
  test('Agregar pokemon a favoritos', () {
    final container = ProviderContainer();

    final notifier = container.read(favoritesProvider.notifier);

    notifier.toggleFavorite('pikachu');

    final favorites = container.read(favoritesProvider);

    expect(favorites.contains('pikachu'), true);
  });

  test('Eliminar pokemon de favoritos', () {
    final container = ProviderContainer();

    final notifier = container.read(favoritesProvider.notifier);

    notifier.toggleFavorite('pikachu');
    notifier.toggleFavorite('pikachu');

    final favorites = container.read(favoritesProvider);

    expect(favorites.contains('pikachu'), false);
  });
}
