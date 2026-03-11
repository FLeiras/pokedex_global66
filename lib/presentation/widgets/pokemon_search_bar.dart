import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/search_query_provider.dart';

class PokemonSearchBar extends ConsumerStatefulWidget {
  const PokemonSearchBar({super.key});

  @override
  ConsumerState<PokemonSearchBar> createState() => _PokemonSearchBarState();
}

class _PokemonSearchBarState extends ConsumerState<PokemonSearchBar> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: controller,
        onChanged: (value) {
          ref.read(searchQueryProvider.notifier).setQuery(value);
        },
        decoration: InputDecoration(
          hintText: 'Buscar Pokémon...',
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
