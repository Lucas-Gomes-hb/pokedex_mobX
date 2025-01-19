import 'package:dio/dio.dart';
import 'package:pokemon_list/core/constants/api_constants.dart';
import 'package:pokemon_list/core/errors/failures.dart';
import 'package:pokemon_list/features/data/models/pokemon_detail_model.dart';
import 'package:pokemon_list/features/data/models/pokemon_model.dart';

class PokemonRepository {
  final Dio _dio;
  
  PokemonRepository(this._dio);

  Future<List<PokemonModel>> getPokemons() async {
    try {
      final response = await _dio.get(
        '${ApiConstants.baseUrl}${ApiConstants.pokemonEndpoint}',
        queryParameters: {'limit': ApiConstants.limit},
      );

      final List<dynamic> results = response.data['results'];
      return results.map((json) => PokemonModel.fromJson(json)).toList();
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw NetworkFailure();
      }
      throw ServerFailure(e.message??"ServerFailure");
    } catch (e) {
      throw ServerFailure();
    }
  }

  Future<PokemonDetailModel> getPokemonDetail(int id) async {
    try {
      final response = await _dio.get(
        '${ApiConstants.baseUrl}${ApiConstants.pokemonEndpoint}/$id',
      );

      return PokemonDetailModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw NetworkFailure();
      }
      throw ServerFailure(e.message??"ServerFailure");
    } catch (e) {
      throw ServerFailure();
    }
  }
}
