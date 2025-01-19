import 'package:mobx/mobx.dart';
import 'package:pokemon_list/features/data/models/pokemon_detail_model.dart';
import 'package:pokemon_list/features/data/repositories/pokemon_repository.dart';

part 'pokemon_detail_store.g.dart';

class PokemonDetailStore = _PokemonDetailStore with _$PokemonDetailStore;

abstract class _PokemonDetailStore with Store {
  final PokemonRepository _repository;

  _PokemonDetailStore(this._repository);

  @observable
  PokemonDetailModel? pokemon;

  @observable
  bool isLoading = false;

  @observable
  String? error;

  @action
  Future<void> fetchPokemonDetail(int id) async {
    isLoading = true;
    error = null;

    try {
      pokemon = await _repository.getPokemonDetail(id);
    } catch (e) {
      error = 'Erro ao carregar detalhes do Pokémon';
    } finally {
      isLoading = false;
    }
  }

  @action
  void resetStore() {
    pokemon = null;
  }
}
