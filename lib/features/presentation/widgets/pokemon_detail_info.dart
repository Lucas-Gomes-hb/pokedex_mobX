import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_list/core/constants/type_colors.dart';
import 'package:pokemon_list/features/data/models/pokemon_detail_model.dart';

class PokemonDetailInfo extends StatelessWidget {
  final PokemonDetailModel pokemon;

  const PokemonDetailInfo({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
            tag: 'pokemon-${pokemon.id}',
            child: CachedNetworkImage(
              imageUrl: pokemon.imageUrl,
              height: 200,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(height: 24),
          _buildBasicInfo(),
          const SizedBox(height: 16),
          _buildTypes(),
          const SizedBox(height: 16),
          _buildAbilities(),
        ],
      ),
    );
  }

  Widget _buildBasicInfo() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Informações Básicas',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildInfoRow('Número', '#${pokemon.id.toString().padLeft(3, '0')}'),
            _buildInfoRow('Altura', '${(pokemon.height / 10).toStringAsFixed(1)} m'),
            _buildInfoRow('Peso', '${(pokemon.weight / 10).toStringAsFixed(1)} kg'),
          ],
        ),
      ),
    );
  }

  Widget _buildTypes() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tipos',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: pokemon.types.map((type) => _buildTypeChip(type)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeChip(String type) {
    final Color typeColor = PokemonTypeColors.getColorForType(type);
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: typeColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: typeColor.withValues(alpha:0.4),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        type.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 11
        ),
      ),
    );
  }

  Widget _buildAbilities() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Habilidades',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ...pokemon.abilities.map((ability) => _buildAbilityItem(ability)),
          ],
        ),
      ),
    );
  }

  Widget _buildAbilityItem(String ability) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          ability.replaceAll('-', ' ').toUpperCase(),
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[800],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 11,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
