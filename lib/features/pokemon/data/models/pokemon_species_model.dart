import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_species_model.freezed.dart';

@freezed
class PokemonSpeciesModel with _$PokemonSpeciesModel {
  const factory PokemonSpeciesModel({
    required String description,
    required String category,
    required int genderRate,
  }) = _PokemonSpeciesModel;

  factory PokemonSpeciesModel.fromJson(Map<String, dynamic> json) {
    final entries = json['flavor_text_entries'] as List;
    final esEntry = entries.firstWhere(
      (e) => e['language']['name'] == 'es',
      orElse: () => entries.first,
    );

    return PokemonSpeciesModel(
      description: (esEntry['flavor_text'] as String)
          .replaceAll('\n', ' ')
          .replaceAll('\f', ' '),
      category: json['genera']
          .firstWhere((g) => g['language']['name'] == 'es')['genus'],
      genderRate: json['gender_rate'],
    );
  }
}
