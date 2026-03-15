import 'package:flutter/material.dart';
import 'package:pokedex_global66/presentation/widgets/svg_nav_icon.dart';

class PokemonBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const PokemonBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: SvgNavIcon('assets/icons/house.svg', color: Colors.grey),
          activeIcon: SvgNavIcon('assets/icons/house.svg', color: Colors.blue),
          label: 'Pokedex',
        ),
        BottomNavigationBarItem(
          icon: SvgNavIcon('assets/icons/globe.svg', color: Colors.grey),
          activeIcon: SvgNavIcon('assets/icons/globe.svg', color: Colors.blue),
          label: 'Regiones',
        ),
        BottomNavigationBarItem(
          icon: SvgNavIcon(
            'assets/icons/favorites.svg',
            color: Colors.grey,
            height: 18,
          ),
          activeIcon: SvgNavIcon(
            'assets/icons/favorites.svg',
            color: Colors.blue,
            height: 18,
          ),
          label: 'Favoritos',
        ),
        BottomNavigationBarItem(
          icon: SvgNavIcon(
            'assets/icons/users.svg',
            color: Colors.grey,
            height: 18,
          ),
          activeIcon: SvgNavIcon(
            'assets/icons/users.svg',
            color: Colors.blue,
            height: 18,
          ),
          label: 'Perfil',
        ),
      ],
    );
  }
}
