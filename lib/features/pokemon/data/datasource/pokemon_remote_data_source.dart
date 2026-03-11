import 'package:pokedex_global66/features/pokemon/data/models/pokemon_detail_model.dart';
import 'package:pokedex_global66/features/pokemon/data/models/pokemon_model.dart';
import 'package:pokedex_global66/features/pokemon/data/models/pokemon_species_model.dart';

abstract class PokemonRemoteDataSource {
  Future<List<PokemonModel>> getPokemonList();
  Future<PokemonDetailModel> getPokemonDetail(String name);
  Future<PokemonSpeciesModel> getPokemonSpecies(String name);
  Future<List<String>> getPokemonWeaknesses(List<String> types);
}
