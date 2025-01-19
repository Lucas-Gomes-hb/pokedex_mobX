import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon_list/features/presentation/stores/pokemon_detail_store.dart';
import 'package:pokemon_list/features/presentation/widgets/pokemon_detail_info.dart';

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
            child: PokemonDetailInfo(pokemon: pokemon,)
          );
        },
      ),
    );
  }
}
