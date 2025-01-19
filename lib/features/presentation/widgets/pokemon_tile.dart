import 'package:flutter/material.dart';
import 'package:pokemon_list/features/data/models/pokemon_model.dart';
import 'package:pokemon_list/features/presentation/pages/pokemon_detail_page.dart';

class PokemonTile extends StatelessWidget {
  final PokemonModel pokemon;

  const PokemonTile({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        'No${pokemon.id.toString().padLeft(3, '0')}',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      title: Text(
        pokemon.name[0].toUpperCase() + pokemon.name.substring(1),
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PokemonDetailPage(id: pokemon.id),
          ),
        );
      },
    );
  }
}
