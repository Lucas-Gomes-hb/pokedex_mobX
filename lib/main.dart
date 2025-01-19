import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon_list/features/data/repositories/pokemon_repository.dart';
import 'package:pokemon_list/features/presentation/pages/pokemon_list_page.dart';
import 'package:pokemon_list/features/presentation/stores/pokemon_detail_store.dart';
import 'package:pokemon_list/features/presentation/stores/pokemon_list_store.dart';
import 'package:pokemon_list/features/services/pokemon_service.dart';

void main() {
  setupDependencies();
  runApp(const MyApp());
}

void setupDependencies() {
  final dio = Dio()
    ..options.connectTimeout = const Duration(seconds: 5)
    ..options.receiveTimeout = const Duration(seconds: 3);
    
  GetIt.I.registerLazySingleton(() => dio);
  GetIt.I.registerLazySingleton(() => PokemonService(GetIt.I()));
  GetIt.I.registerLazySingleton(() => PokemonRepository(GetIt.I()));
  GetIt.I.registerLazySingleton(() => PokemonListStore(GetIt.I()));
  GetIt.I.registerLazySingleton(() => PokemonDetailStore(GetIt.I()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokédex',
      theme: ThemeData(
        primarySwatch: Colors.red,
        useMaterial3: true,
      ),
      home: PokemonListPage(),
    );
  }
}
