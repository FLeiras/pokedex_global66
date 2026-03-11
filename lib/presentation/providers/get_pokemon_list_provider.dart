import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_global66/features/pokemon/data/datasource/pokemon_remote_data_source_impl.dart';
import 'package:pokedex_global66/features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:pokedex_global66/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokedex_global66/features/pokemon/domain/usecases/get_pokemon_list.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/dio_client.dart';

part 'get_pokemon_list_provider.g.dart';

@riverpod
Future<List<Pokemon>> pokemonList(Ref ref) {
  final dataSource = PokemonRemoteDataSourceImpl(DioClient.dio);

  final repository = PokemonRepositoryImpl(dataSource);

  final getPokemonList = GetPokemonList(repository);

  return getPokemonList();
}
