import '../entities/pokemon.dart';
import '../repositories/pokemon_repository.dart';

class GetPokemonList {
  final PokemonRepository repository;

  GetPokemonList(this.repository);

  Future<List<Pokemon>> call() {
    return repository.getPokemonList();
  }
}
