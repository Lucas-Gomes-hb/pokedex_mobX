import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon_list/features/presentation/stores/pokemon_detail_store.dart';

class PokemonDetailPage extends StatefulWidget {
  final int id;

  const PokemonDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  _PokemonDetailPageState createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  final PokemonDetailStore store = GetIt.I<PokemonDetailStore>();

  @override
  void initState() {
    super.initState();
    store.fetchPokemonDetail(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (_) => Text(
            store.pokemon?.name.toUpperCase() ?? 'Detalhes do Pokémon',
          ),
        ),
      ),
      body: Observer(
        builder: (_) {
          if (store.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (store.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(store.error!),
                  ElevatedButton(
                    onPressed: () => store.fetchPokemonDetail(widget.id),
                    child: Text('Tentar novamente'),
                  ),
                ],
              ),
            );
          }

          final pokemon = store.pokemon;
          if (pokemon == null) return SizedBox();

          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CachedNetworkImage(
                  imageUrl: pokemon.imageUrl,
                  height: 200,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                SizedBox(height: 24),
                _buildInfoCard('Informações Básicas', [
                  'Número: #${pokemon.id.toString().padLeft(3, '0')}',
                  'Altura: ${(pokemon.height / 10).toStringAsFixed(1)}m',
                  'Peso: ${(pokemon.weight / 10).toStringAsFixed(1)}kg',
                ]),
                SizedBox(height: 16),
                _buildInfoCard('Tipos', 
                  pokemon.types.map((type) => type.toUpperCase()).toList(),
                ),
                SizedBox(height: 16),
                _buildInfoCard('Habilidades',
                  pokemon.abilities.map((ability) => 
                    ability.replaceAll('-', ' ').toUpperCase()
                  ).toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoCard(String title, List<String> items) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            ...items.map((item) => Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Text(item),
            )),
          ],
        ),
      ),
    );
  }
}
