import '../entities/pokemon.dart';
import '../entities/pokemon_detail.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getPokemonList();
  Future<PokemonDetail> getPokemonDetail(String name);
}
