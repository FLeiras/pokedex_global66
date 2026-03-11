import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_detail_model.freezed.dart';

@freezed
class PokemonDetailModel with _$PokemonDetailModel {
  const factory PokemonDetailModel({
    required int id,
    required String name,
    required int height,
    required int weight,
    required List<String> types,
    required String ability,
  }) = _PokemonDetailModel;

  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) {
    return PokemonDetailModel(
      id: json['id'],
      name: json['name'],
      height: json['height'],
      weight: json['weight'],
      types: (json['types'] as List)
          .map((t) => t['type']['name'] as String)
          .toList(),
      ability: json['abilities'][0]['ability']['name'],
    );
  }
}
