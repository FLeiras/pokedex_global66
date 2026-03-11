import 'package:flutter/material.dart';
import 'package:pokedex_global66/presentation/pages/favorites_page.dart';
import 'package:pokedex_global66/presentation/pages/pokemon_list_page.dart';
import 'package:pokedex_global66/presentation/pages/pokemon_profile_page.dart';
import 'package:pokedex_global66/presentation/pages/pokemon_region_page.dart';
import 'package:pokedex_global66/presentation/widgets/pokemon_bottom_nav.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  final pages = [
    const PokemonListPage(),
    const RegionsPage(),
    const FavoritesPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: PokemonBottomNav(
        currentIndex: index,
        onTap: (i) {
          setState(() {
            index = i;
          });
        },
      ),
    );
  }
}
