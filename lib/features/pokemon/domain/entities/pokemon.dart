class Pokemon {
  final String name;
  final String url;
  final List<String>? types;

  const Pokemon({
    required this.name,
    required this.url,
    this.types = const [],
  });

  int get id {
    final uri = Uri.parse(url);
    return int.parse(uri.pathSegments[uri.pathSegments.length - 2]);
  }

  // String get image =>
  //     'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

  String get image =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';

  Pokemon copyWith({
    List<String>? types,
  }) {
    return Pokemon(
      name: name,
      url: url,
      types: types ?? this.types,
    );
  }
}
