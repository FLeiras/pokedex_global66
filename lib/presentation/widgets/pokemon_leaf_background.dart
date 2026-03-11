import 'package:flutter/material.dart';

class PokemonLeafBackground extends StatelessWidget {
  final double size;
  final double opacity;

  const PokemonLeafBackground({
    super.key,
    required this.size,
    this.opacity = 0.25,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Image.asset(
        'assets/images/leaf.png',
        width: size,
        height: size,
        fit: BoxFit.contain,
      ),
    );
  }
}
