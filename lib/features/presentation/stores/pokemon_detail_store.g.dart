// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonDetailStore on _PokemonDetailStore, Store {
  late final _$pokemonAtom =
      Atom(name: '_PokemonDetailStore.pokemon', context: context);

  @override
  PokemonDetailModel? get pokemon {
    _$pokemonAtom.reportRead();
    return super.pokemon;
  }

  @override
  set pokemon(PokemonDetailModel? value) {
    _$pokemonAtom.reportWrite(value, super.pokemon, () {
      super.pokemon = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_PokemonDetailStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_PokemonDetailStore.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$fetchPokemonDetailAsyncAction =
      AsyncAction('_PokemonDetailStore.fetchPokemonDetail', context: context);

  @override
  Future<void> fetchPokemonDetail(int id) {
    return _$fetchPokemonDetailAsyncAction
        .run(() => super.fetchPokemonDetail(id));
  }

  @override
  String toString() {
    return '''
pokemon: ${pokemon},
isLoading: ${isLoading},
error: ${error}
    ''';
  }
}
