import 'package:flutter/material.dart';

class PokemonTypeUI {
  static const Map<String, String> icons = {
    'bug': 'assets/images/bug.png',
    'flying': 'assets/images/fly.png',
    'normal': 'assets/images/normal.png',
    'ghost': 'assets/images/phantom.png',
    'rock': 'assets/images/rock.png',
    'ground': 'assets/images/ground.png',
    'grass': 'assets/images/grass.png',
    'fire': 'assets/images/fire.png',
    'poison': 'assets/images/poison.png',
    'water': 'assets/images/water.png',
    'electric': 'assets/images/electric.png',
    'fairy': 'assets/images/fairy.png',
    'steel': 'assets/images/steel.png',
    'ice': 'assets/images/ice.png',
    'fighting': 'assets/images/fight.png',
    'psychic': 'assets/images/psychic.png',
    'dark': 'assets/images/dark.png',
  };

  static const Map<String, Color> colors = {
    'bug': Color.fromARGB(255, 61, 97, 20),
    'flying': Colors.lightBlueAccent,
    'rock': Color.fromARGB(255, 171, 155, 15),
    'ghost': Colors.deepPurple,
    'normal': Colors.grey,
    'ground': Colors.brown,
    'grass': Color(0xFF7AC74C),
    'fire': Color(0xFFEE8130),
    'poison': Color(0xFFA33EA1),
    'water': Colors.blueAccent,
    'electric': Colors.yellow,
    'fairy': Colors.pinkAccent,
    'steel': Colors.blueGrey,
    'ice': Colors.cyanAccent,
    'fighting': Colors.redAccent,
    'psychic': Colors.purpleAccent,
    'dark': Colors.black54,
  };

  static const Map<String, String> labelsEs = {
    'grass': 'Planta',
    'fire': 'Fuego',
    'poison': 'Veneno',
    'water': 'Agua',
    'flying': 'Volador',
    'normal': 'Normal',
    'bug': 'Insecto',
    'electric': 'Eléctrico',
    'ground': 'Tierra',
    'fairy': 'Hada',
    'rock': 'Roca',
    'ghost': 'Fantasma',
    'steel': 'Acero',
    'ice': 'Hielo',
    'fighting': 'Lucha',
    'psychic': 'Psíquico',
    'dark': 'Siniestro',
  };

  static String icon(String type) => icons[type] ?? 'assets/images/grass.png';

  static Color color(String type) => colors[type] ?? Colors.grey;

  static String label(String type) => labelsEs[type] ?? type;
}
