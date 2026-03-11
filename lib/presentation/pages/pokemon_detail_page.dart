import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_global66/features/pokemon/domain/entities/pokemon_detail.dart';

import '../providers/pokemon_detail_provider.dart';
import 'package:pokedex_global66/presentation/widgets/pokemon_type_chip.dart';
import 'package:pokedex_global66/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokedex_global66/presentation/providers/favorites_provider.dart';

class PokemonDetailPage extends ConsumerWidget {
  final Pokemon pokemon;

  const PokemonDetailPage({
    super.key,
    required this.pokemon,
  });

  Widget _PokemonHeader({
    required BuildContext context,
    required PokemonDetail pokemon,
    required bool isFavorite,
    required VoidCallback onFavorite,
  }) {
    return SizedBox(
      height: 340,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -260,
            child: Container(
              width: 620,
              height: 520,
              decoration: const BoxDecoration(
                color: Color(0xFF8BC34A),
                shape: BoxShape.circle,
              ),
            ),
          ),

          /// HOJA GRANDE
          Positioned(
            top: 40,
            child: Opacity(
              opacity: 0.8,
              child: Image.asset(
                "assets/images/leaf.png",
                height: 240,
                fit: BoxFit.contain,
              ),
            ),
          ),

          /// POKEMON GRANDE (delante de la hoja)
          Positioned(
            bottom: -10,
            child: SizedBox(
              height: 240,
              width: 240,
              child: Image.network(
                pokemon.image,
                fit: BoxFit.contain,
              ),
            ),
          ),

          /// BOTON BACK
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          /// FAVORITO
          Positioned(
            top: 40,
            right: 16,
            child: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.white,
              ),
              onPressed: onFavorite,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonDetailAsync = ref.watch(pokemonDetailProvider(pokemon.name));
    final favoritesNotifier = ref.read(favoritesProvider.notifier);
    final isFavorite = ref.watch(favoritesProvider).contains(pokemon.name);

    return Scaffold(
      body: pokemonDetailAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, _) => Center(
          child: Text('Error: $error'),
        ),
        data: (pokemon) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: _PokemonHeader(
                    context: context,
                    pokemon: pokemon,
                    isFavorite: isFavorite,
                    onFavorite: () {
                      favoritesNotifier.toggleFavorite(pokemon.name);
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  pokemon.name.toUpperCase(),
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Nº${pokemon.id.toString().padLeft(3, '0')}',
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                ),
                Wrap(
                  spacing: 8,
                  children: pokemon.types
                      .map(
                        (type) => PokemonTypeChip(
                          type: type,
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 16),
                Text(
                  pokemon.description,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 24),
                const SizedBox(height: 20),
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 2.0,
                  children: [
                    _InfoCard(
                      title: "PESO",
                      value: "${pokemon.weight / 10} kg",
                      icon: Icons.scale,
                    ),
                    _InfoCard(
                      title: "ALTURA",
                      value: "${pokemon.height / 10} m",
                      icon: Icons.height,
                    ),
                    _InfoCard(
                      title: "CATEGORÍA",
                      value: pokemon.category,
                      icon: Icons.category,
                    ),
                    _InfoCard(
                      title: "HABILIDAD",
                      value: pokemon.ability,
                      icon: Icons.catching_pokemon,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Center(
                  child: Text(
                    "GENERO",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.male),
                    const SizedBox(width: 6),
                    Text(pokemon.gender.malePercentage),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: double.parse(pokemon.gender.malePercentage
                                  .replaceAll('%', '')) /
                              100,
                          minHeight: 10,
                          backgroundColor: Colors.pink.shade200,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(pokemon.gender.femalePercentage),
                    const SizedBox(width: 6),
                    const Icon(Icons.female),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  "Debilidades",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: pokemon.weaknesses
                      .map(
                        (type) => PokemonTypeChip(type: type),
                      )
                      .toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _InfoCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Icon(icon, size: 16, color: Colors.black54),
            const SizedBox(width: 6),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Container(
          height: 48,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
