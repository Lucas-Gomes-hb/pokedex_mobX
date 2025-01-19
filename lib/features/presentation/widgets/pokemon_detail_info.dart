import 'package:flutter/material.dart';
import 'package:pokemon_list/features/data/models/pokemon_detail_model.dart';

class PokemonDetailInfo extends StatelessWidget {
  final PokemonDetailModel pokemon;

  const PokemonDetailInfo({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Informações',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                _buildInfoItem('Número', '#${pokemon.id.toString().padLeft(3, '0')}'),
                _buildInfoItem('Altura', '${(pokemon.height / 10).toStringAsFixed(1)} m'),
                _buildInfoItem('Peso', '${(pokemon.weight / 10).toStringAsFixed(1)} kg'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tipos',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: pokemon.types
                      .map((type) => Chip(
                            label: Text(type.toUpperCase()),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Habilidades',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: pokemon.abilities
                      .map((ability) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Text(ability.replaceAll('-', ' ').toUpperCase()),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value),
        ],
      ),
    );
  }
}
