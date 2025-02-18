import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon_list/features/presentation/stores/pokemon_list_store.dart';
import 'package:pokemon_list/features/presentation/widgets/pokemon_card.dart';
import 'package:pokemon_list/features/presentation/widgets/pokemon_search_sheet.dart';

class PokemonListPage extends StatefulWidget {
  @override
  _PokemonListPageState createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  final PokemonListStore store = GetIt.I<PokemonListStore>();

  @override
  void initState() {
    super.initState();
    store.fetchPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokédex'),
        centerTitle: true,
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
                    onPressed: store.fetchPokemons,
                    child: Text('Tentar novamente'),
                  ),
                ],
              ),
            );
          }

          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) =>
                      SearchBottomSheet(pokemons: store.pokemons),
                );
              },
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            body: GridView.builder(
              padding: EdgeInsets.only(top: 8, left: 8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: store.pokemons.length,
              itemBuilder: (context, index) {
                final pokemon = store.pokemons[index];
                return PokemonCard(pokemon: pokemon);
              },
            ),
          );
        },
      ),
    );
  }
}
