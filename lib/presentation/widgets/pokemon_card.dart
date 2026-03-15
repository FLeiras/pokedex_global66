import 'package:flutter/material.dart';
import 'package:pokedex_global66/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokedex_global66/presentation/widgets/pokemon_leaf_background.dart';
import 'package:pokedex_global66/presentation/widgets/pokemon_type_chip.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  final bool isFavorite;
  final List<String>? types;
  final VoidCallback onTap;
  final VoidCallback onFavoriteTap;

  const PokemonCard({
    super.key,
    required this.pokemon,
    required this.isFavorite,
    this.types,
    required this.onTap,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    // print(pokemon.name);
    // print(types);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 130,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFC5E1A5),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                width: 120,
                height: 130,
                decoration: const BoxDecoration(
                  color: Color(0xFF8BC34A),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Nº${pokemon.id.toString().padLeft(3, '0')}',
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          pokemon.name[0].toUpperCase() +
                              pokemon.name.substring(1),
                          style: const TextStyle(
                            // fontFamily: 'Poppins',
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                            height: 1.0, // line-height 100%
                            letterSpacing: 0,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          children: (types ?? [])
                              .map(
                                (type) => PokemonTypeChip(
                                  type: type,
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 90,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            const PokemonLeafBackground(
                              size: 90,
                              opacity: 0.8,
                            ),
                            Image.network(
                              pokemon.image,
                              width: 94,
                              height: 94,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: onFavoriteTap,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
