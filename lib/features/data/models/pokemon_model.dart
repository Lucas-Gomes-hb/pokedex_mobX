class PokemonModel {
  final int id;
  final String name;
  final String imageUrl;

  PokemonModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    final String url = json['url'] as String;
    final id = int.parse(url.split('/')[6]);
    return PokemonModel(
      id: id,
      name: json['name'] as String,
      imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png',
    );
  }
}
