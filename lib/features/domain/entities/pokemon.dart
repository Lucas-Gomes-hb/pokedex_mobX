class Pokemon {
  final int id;
  final String name;
  final String imageUrl;
  final int? height;
  final int? weight;
  final List<String>? types;
  final List<String>? abilities;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.height,
    this.weight,
    this.types,
    this.abilities,
  });

  Pokemon copyWith({
    int? id,
    String? name,
    String? imageUrl,
    int? height,
    int? weight,
    List<String>? types,
    List<String>? abilities,
  }) {
    return Pokemon(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      types: types ?? this.types,
      abilities: abilities ?? this.abilities,
    );
  }
}
