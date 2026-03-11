import '../entities/pokemon_detail.dart';
import '../repositories/pokemon_repository.dart';

class GetPokemonDetail {
  final PokemonRepository repository;

  GetPokemonDetail(this.repository);

  Future<PokemonDetail> call(String name) {
    return repository.getPokemonDetail(name);
  }
}
