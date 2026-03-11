import 'package:flutter/material.dart';

class PokemonTypeUI {
  static const Map<String, String> icons = {
    'grass': 'assets/icons/plant.svg',
    'fire': 'assets/icons/fire.svg',
    'poison': 'assets/icons/poison.svg',
    'water': 'assets/icons/agua.svg',
    'flying': 'assets/icons/flying.svg',
  };

  static const Map<String, Color> colors = {
    'grass': Color(0xFF7AC74C),
    'fire': Color(0xFFEE8130),
    'poison': Color(0xFFA33EA1),
    'water': Colors.blueAccent,
    'flying': Colors.lightBlueAccent,
  };

  static const Map<String, String> labelsEs = {
    'grass': 'Planta',
    'fire': 'Fuego',
    'poison': 'Veneno',
    'water': 'Agua',
    'flying': 'Volador',
  };

  static String icon(String type) => icons[type] ?? 'assets/icons/plant.svg';

  static Color color(String type) => colors[type] ?? Colors.grey;

  static String label(String type) => labelsEs[type] ?? type;
}
