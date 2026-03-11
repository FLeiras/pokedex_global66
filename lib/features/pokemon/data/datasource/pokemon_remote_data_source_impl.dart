import 'package:dio/dio.dart';
import 'package:pokedex_global66/features/pokemon/data/datasource/pokemon_remote_data_source.dart';
import 'package:pokedex_global66/features/pokemon/data/models/pokemon_detail_model.dart';
import 'package:pokedex_global66/features/pokemon/data/models/pokemon_model.dart';
import 'package:pokedex_global66/features/pokemon/data/models/pokemon_species_model.dart';

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final Dio dio;

  PokemonRemoteDataSourceImpl(this.dio);

  @override
  Future<List<PokemonModel>> getPokemonList() async {
    final response = await dio.get('/pokemon?limit=20');

    final results = response.data['results'] as List;

    return results.map((json) => PokemonModel.fromJson(json)).toList();
  }

  @override
  Future<PokemonDetailModel> getPokemonDetail(String name) async {
    final response = await dio.get('/pokemon/$name');
    return PokemonDetailModel.fromJson(response.data);
  }

  @override
  Future<PokemonSpeciesModel> getPokemonSpecies(String name) async {
    final response = await dio.get('/pokemon-species/$name');
    return PokemonSpeciesModel.fromJson(response.data);
  }

  @override
  Future<List<String>> getPokemonWeaknesses(List<String> types) async {
    final weaknesses = <String>{};

    for (final type in types) {
      final response = await dio.get('/type/$type');
      final list =
          response.data['damage_relations']['double_damage_from'] as List;

      for (final t in list) {
        weaknesses.add(t['name']);
      }
    }

    return weaknesses.toList();
  }
}
