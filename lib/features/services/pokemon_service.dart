import 'package:dio/dio.dart';
import 'package:pokemon_list/core/constants/api_constants.dart';

class PokemonService {
  final Dio _dio;
  
  PokemonService(this._dio);

  Future<Response> getPokemons() async {
    return await _dio.get(
      '${ApiConstants.baseUrl}${ApiConstants.pokemonEndpoint}',
      queryParameters: {'limit': ApiConstants.limit},
    );
  }

  Future<Response> getPokemonDetail(int id) async {
    return await _dio.get(
      '${ApiConstants.baseUrl}${ApiConstants.pokemonEndpoint}/$id',
    );
  }
}
