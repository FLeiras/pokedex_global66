import 'package:pokedex_global66/features/pokemon/data/datasource/pokemon_remote_data_source_impl.dart';
import 'package:pokedex_global66/features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:pokedex_global66/features/pokemon/domain/entities/pokemon_detail.dart';
import 'package:pokedex_global66/features/pokemon/domain/usecases/get_pokemon_detail.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/dio_client.dart';

part 'pokemon_detail_provider.g.dart';

@riverpod
Future<PokemonDetail> pokemonDetail(
  ref,
  String pokemonName,
) {
  final dataSource = PokemonRemoteDataSourceImpl(DioClient.dio);
  final repository = PokemonRepositoryImpl(dataSource);
  final useCase = GetPokemonDetail(repository);

  return useCase(pokemonName);
}
