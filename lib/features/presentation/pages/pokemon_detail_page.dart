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
  late int id = widget.id;
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
            store.pokemon?.name.toUpperCase() ?? 'Pokémon',
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
            store.resetStore();
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            visible: id > 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    id -= 1;
                  });
                  store.fetchPokemonDetail(id);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: id < 1025,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    id += 1;
                  });
                  store.fetchPokemonDetail(id);
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
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
              child: PokemonDetailInfo(
                pokemon: pokemon,
              ));
        },
      ),
    );
  }
}
