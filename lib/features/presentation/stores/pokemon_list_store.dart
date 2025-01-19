import 'package:mobx/mobx.dart';
import 'package:pokemon_list/features/data/models/pokemon_model.dart';
import 'package:pokemon_list/features/data/repositories/pokemon_repository.dart';

part 'pokemon_list_store.g.dart';

class PokemonListStore = _PokemonListStore with _$PokemonListStore;

abstract class _PokemonListStore with Store {
  final PokemonRepository _repository;

  _PokemonListStore(this._repository);

  @observable
  ObservableList<PokemonModel> pokemons = ObservableList<PokemonModel>();

  @observable
  bool isLoading = false;

  @observable
  String? error;

  @action
  Future<void> fetchPokemons() async {
    isLoading = true;
    error = null;

    try {
      final result = await _repository.getPokemons();
      pokemons = ObservableList.of(result);
    } catch (e) {
      error = 'Erro ao carregar Pokémons';
    } finally {
      isLoading = false;
    }
  }
}
