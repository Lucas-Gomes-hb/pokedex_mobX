import 'package:flutter/material.dart';
import 'package:pokemon_list/features/data/models/pokemon_model.dart';
import 'package:pokemon_list/features/presentation/widgets/pokemon_lines_painter.dart';
import 'package:pokemon_list/features/presentation/widgets/pokemon_tile.dart';

class SearchBottomSheet extends StatefulWidget {
  final List<PokemonModel> pokemons;

  const SearchBottomSheet({Key? key, required this.pokemons}) : super(key: key);

  @override
  _SearchBottomSheetState createState() => _SearchBottomSheetState();
}

class _SearchBottomSheetState extends State<SearchBottomSheet> {
  List<PokemonModel> filteredPokemons = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredPokemons = widget.pokemons;
  }

  void _filterPokemons(String query) {
    setState(() {
      filteredPokemons = widget.pokemons.where((pokemon) {
        final idMatch = pokemon.id.toString().contains(query.toLowerCase());
        final nameMatch =
            pokemon.name.toLowerCase().contains(query.toLowerCase());
        return idMatch || nameMatch;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 5,
                width: 50,
                margin: EdgeInsets.only(
                  top: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterPokemons,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  fontSize: 11,
                ),
                hintText: 'Search by number or name',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
          Expanded(
            child: CustomPaint(
              painter: LinePainter(),
              child: ListView.builder(
                itemCount: filteredPokemons.length,
                itemBuilder: (context, index) {
                  final pokemon = filteredPokemons[index];
                  return PokemonTile(pokemon: pokemon);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
