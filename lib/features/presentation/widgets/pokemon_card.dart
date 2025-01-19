import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_list/features/data/models/pokemon_model.dart';
import 'package:pokemon_list/features/presentation/pages/pokemon_detail_page.dart';

class PokemonCard extends StatelessWidget {
  final PokemonModel pokemon;

  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PokemonDetailPage(id: pokemon.id),
            ),
          );
        },
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            SizedBox(
              height: 200,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFC0B088),
                    ),
                  ),

                  Positioned(
                    left: MediaQueryData().size.width/4,
                    child: Hero(
                      tag: 'pokemon-${pokemon.id}',
                      child: CachedNetworkImage(
                        imageUrl: pokemon.imageUrl,
                        height: 200,
                        width: 200,
                        fit: BoxFit.fill,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 100,
              left: 150,
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: Color(0xFFC0B088),
                    width: 2
                  )
                ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '#${pokemon.id.toString().padLeft(3, '0')}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontFamily: "PixelFont",
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        pokemon.name.toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
