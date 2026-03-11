import 'package:pokedex_global66/features/pokemon/data/datasource/pokemon_remote_data_source.dart';
import 'package:pokedex_global66/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokedex_global66/features/pokemon/domain/entities/pokemon_detail.dart';
import 'package:pokedex_global66/features/pokemon/domain/entities/pokemon_gender_rate.dart';
import 'package:pokedex_global66/features/pokemon/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remote;

  PokemonRepositoryImpl(this.remote);

  @override
  Future<List<Pokemon>> getPokemonList() async {
    final models = await remote.getPokemonList();

    final pokemons = await Future.wait(
      models.map((model) async {
        final detail = await remote.getPokemonDetail(model.name);

        return Pokemon(
          name: model.name,
          url: model.url,
          types: detail.types,
        );
      }),
    );

    return pokemons;
  }

  @override
  @override
  Future<PokemonDetail> getPokemonDetail(String name) async {
    final detail = await remote.getPokemonDetail(name);
    final species = await remote.getPokemonSpecies(name);
    final weaknesses = await remote.getPokemonWeaknesses(detail.types);

    final male = species.genderRate == -1 ? 0 : (8 - species.genderRate) / 8;

    final female = species.genderRate == -1 ? 0 : species.genderRate / 8;

    return PokemonDetail(
      id: detail.id,
      name: detail.name,
      height: detail.height,
      weight: detail.weight,
      image:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${detail.id}.png',
      types: detail.types,
      description: species.description,
      category: species.category.replaceAll("Pokémon", "").trim(),
      ability: detail.ability,
      gender: GenderRate(
        male: male.toDouble(),
        female: female.toDouble(),
      ),
      weaknesses: weaknesses,
    );
  }
}
